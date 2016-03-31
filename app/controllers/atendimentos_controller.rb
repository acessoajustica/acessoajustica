class AtendimentosController < ApplicationController
  load_and_authorize_resource
  before_action :set_cliente, only: [:new]
  before_action :set_atendimento, only: [:show, :edit, :update, :destroy, :archive]
  before_action :check_status, only: [:edit, :update, :destroy]
  before_action :diretor_only, only: [:active]

  # GET /atendimentos
  # GET /atendimentos.json
  def index
    @atendimentos = order_atendimentos_by_especialidades(current_user)
  end

  def active
    @atendimentos = Atendimento.active.order(created_at: :desc)
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
  end

  def archive
    respond_to do |format|
      if @atendimento.deactivate!
        format.html { redirect_to @atendimento, notice: 'Atendimento arquivado com sucesso!' }
        format.json { render :show, status: :ok, location: @atendimento }
      else
        format.html { render :edit }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
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
      if @atendimento.update(atendimento_params)
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
      params.require(:atendimento).permit(:status,
                                          :cliente_id,
                                          :justification,
                                          :atendimento_type_id,
                                          :initial_description,
                                          :detailed_description,
                                          :estagiario_id,
                                          :especialidade_id)
    end

    def check_status
      unless @atendimento.active?
        redirect_to @atendimento, flash: { warning: "O atendimento ##{@atendimento.id} está arquivado e não pode ser alterado!"}
      end
    end

    def diretor_only
      unless current_user.role? :diretor
        redirect_to root_path, flash: { warning: "Você não tem autorização para ver a página requisitada!"}
      end
    end

    #TODO refactor
    #order by especialidade do estagiario
    def order_atendimentos_by_especialidades(user)
      atendimentos = Atendimento.waiting_list
      if user.role?(:estagiário) && user.membro.present?
        estagiario = Estagiario.find(user.membro_id)
        if estagiario.present?
          especialidades = estagiario.especialidades.map{|e| e.id }
          atendimentos = atendimentos.sort_by{|a|
            if a.especialidade_id.blank?
              order = 1
            elsif especialidades.include?(a.especialidade_id)
              order = -1
            else
              order = 0
            end
            [order, a.created_at] #order by the order and creation date
          }
        end
      end
      atendimentos
    end
end
