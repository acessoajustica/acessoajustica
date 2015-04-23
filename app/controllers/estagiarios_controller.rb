class EstagiariosController < ApplicationController
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
  end

  # GET /estagiarios/1/edit
  def edit
  end

  # POST /estagiarios
  # POST /estagiarios.json
  def create
    @estagiario = Estagiario.new(estagiario_params)

    respond_to do |format|
      if @estagiario.save
        format.html { redirect_to @estagiario, notice: 'Estagiario was successfully created.' }
        format.json { render :show, status: :created, location: @estagiario }
      else
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
      params.require(:estagiario).permit(:especialidade)
    end
end
