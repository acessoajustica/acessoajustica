class EstagiariosController < ApplicationController
  include EstagiariosHelper
  authorize_resource 
  before_action :set_estagiario, only: [:show, :edit, :update, :destroy]

  # GET /estagiarios
  # GET /estagiarios.json
  def index
    @estagiarios = Estagiario.all
  end

  # GET /estagiarios/1
  # GET /estagiarios/1.json
  def show
  end

  # GET /estagiarios/new
  def new
    @estagiario = Estagiario.new
    @user_id = params[:user_id]
  end

  # GET /estagiarios/1/edit
  def edit
  end

  # POST /estagiarios
  # POST /estagiarios.json
  def create
    @estagiario = Estagiario.new(estagiario_params.select { | key, value | key != "user_id" and key != "especialidades"})
    add_all_especialidades(@estagiario, estagiario_params[:especialidades])
    respond_to do |format|
      if @estagiario.save
        @user = User.find(estagiario_params[:user_id])
        @user.membro_id = Membro.find_by( { :actable_type => "Estagiario", :actable_id => @estagiario.id } ).id;
        @user.save
        format.html { redirect_to @estagiario, notice: 'Estagiario was successfully created.' }
        format.json { render :show, status: :created, location: @estagiario }
      else
        @user_id = estagiario_params[:user_id]
        format.html { render :new }
        format.json { render json: @estagiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estagiarios/1
  # PATCH/PUT /estagiarios/1.json
  def update
    respond_to do |format|
      if @estagiario.update(estagiario_params)
        format.html { redirect_to @estagiario, notice: 'Estagiario was successfully updated.' }
        format.json { render :show, status: :ok, location: @estagiario }
      else
        format.html { render :edit }
        format.json { render json: @estagiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estagiarios/1
  # DELETE /estagiarios/1.json
  def destroy
    @estagiario.destroy
    respond_to do |format|
      format.html { redirect_to estagiarios_url, notice: 'Estagiario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estagiario
      @estagiario = Estagiario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estagiario_params
      params.require(:estagiario).permit(:ano_faculdade, :nome,
                                         :cpf, :nome_da_mae, :rg, :cor, 
                                         :identidade_de_genero, :user_id, :especialidades => [])
    end
end
