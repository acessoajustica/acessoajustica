class RelatosController < ApplicationController
  authorize_resource
  before_action :set_relato, only: [:show, :edit, :update, :destroy]

  # GET /relatos
  # GET /relatos.json
  def index
    @relatos = Relato.all
  end

  # GET /relatos/1
  # GET /relatos/1.json
  def show
  end

  # GET /relatos/new
  def new
    @relato = Relato.new
  end

  # GET /relatos/1/edit
  def edit
  end

  # POST /relatos
  # POST /relatos.json
  def create
    @relato = Relato.new(relato_params)

    respond_to do |format|
      if @relato.save
        format.html { redirect_to @relato, notice: 'Relato was successfully created.' }
        format.json { render :show, status: :created, location: @relato }
      else
        format.html { render :new }
        format.json { render json: @relato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatos/1
  # PATCH/PUT /relatos/1.json
  def update
    respond_to do |format|
      if @relato.update(relato_params)
        format.html { redirect_to @relato, notice: 'Relato was successfully updated.' }
        format.json { render :show, status: :ok, location: @relato }
      else
        format.html { render :edit }
        format.json { render json: @relato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatos/1
  # DELETE /relatos/1.json
  def destroy
    @relato.destroy
    respond_to do |format|
      format.html { redirect_to relatos_url, notice: 'Relato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relato
      @relato = Relato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relato_params
      params.require(:relato).permit(:description, :caso_id)
    end
end
