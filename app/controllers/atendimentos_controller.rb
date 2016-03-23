class AtendimentosController < ApplicationController
  load_and_authorize_resource
  before_action :set_cliente, only: [:new]
  before_action :set_atendimento, only: [:show, :edit, :update, :destroy]

  # GET /atendimentos
  # GET /atendimentos.json
  def index
    @atendimentos = Atendimento.from_beginning_of_day
  end

  # GET /atendimentos/my-cases
  def my_cases
    authorize! :read, Atendimento
    @atendimentos = Atendimento.all_for(current_user)
  end

  # GET /atendimentos/select-cases
  def select_case
    authorize! :update, Atendimento
    @atendimento = Atendimento.find(params[:id])
    @membro = Membro.find(current_user.membro_id)
    @atendimento.update(estagiario_id: @membro.actable_id)
    redirect_to atendimentos_url
  end


  # GET /atendimentos/1
  # GET /atendimentos/1.json
  def show
  end

  # GET /atendimentos/new
  def new
    @atendimento = Atendimento.new
    @atendimento.cliente = @cliente
  end

  # GET /atendimentos/1/edit
  def edit
    @relato = Relato.new
  end

  # POST /atendimentos
  # POST /atendimentos.json
  def create
    @atendimento = Atendimento.new(atendimento_params)

    respond_to do |format|
      if @atendimento.save
        format.html { redirect_to @atendimento, notice: 'Atendimento criado com sucesso!' }
        format.json { render :show, status: :created, location: @atendimento }
      else
        format.html { render :new }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atendimentos/1
  # PATCH/PUT /atendimentos/1.json
  def update
    respond_to do |format|
      @atendimento.relatos.build(:description => atendimento_params[:new_relato])
      if @atendimento.update(atendimento_params.except(:new_relato))
        format.html { redirect_to @atendimento, notice: 'Atendimento atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @atendimento }
      else
        format.html { render :edit }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendimento
      @atendimento = Atendimento.find(params[:id])
    end

    def set_cliente
      @cliente = Cliente.find(params[:cliente_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atendimento_params
      params.require(:atendimento).permit(:status, :cliente_id, :atendimento_type_id, :new_relato)
    end
end
