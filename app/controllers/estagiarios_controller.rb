class EstagiariosController < ApplicationController
  include EstagiariosHelper
  authorize_resource
  before_action :set_estagiario, only: [:show, :edit, :update, :destroy, :active, :remove_director, :add_director]

  # GET /estagiarios
  # GET /estagiarios.json
  def index
    @estagiarios = Estagiario.all.joins(:membro).joins(:user).order("users.active DESC, users.last_sign_in_at DESC")
  end

  # GET /estagiarios
  def diretores
    @users = User.all.joins(:roles).joins(:membro).where("roles.name = 'diretor'")
    @estagiarios = Estagiario.all.joins(:membro).joins(:user).where("users.id in (?)", @users.ids).order("users.active DESC, users.last_sign_in_at DESC")
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

  # POST /estagiarios/1/active
  def active
    @estagiario.membro.user.active = !@estagiario.membro.user.active
    @estagiario.membro.user.save
    redirect_to estagiarios_path
  end

  # POST /estagiarios/1/remove_director
  def remove_director
    @estagiario.membro.user.roles.delete_all
    @estagiario.membro.user.roles << Role.find_by_name("estagiário")
    redirect_to diretores_path  end

  # POST /estagiarios/1/remove_director
  def add_director
    @estagiario.membro.user.roles.delete_all
    @estagiario.membro.user.roles << Role.find_by_name("diretor")
    redirect_to diretores_path
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
