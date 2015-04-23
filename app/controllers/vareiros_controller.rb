class VareirosController < ApplicationController
  before_action :set_vareiro, only: [:show, :edit, :update, :destroy]

  # GET /vareiros
  # GET /vareiros.json
  def index
    @vareiros = Vareiro.all
  end

  # GET /vareiros/1
  # GET /vareiros/1.json
  def show
  end

  # GET /vareiros/new
  def new
    @vareiro = Vareiro.new
  end

  # GET /vareiros/1/edit
  def edit
  end

  # POST /vareiros
  # POST /vareiros.json
  def create
    @vareiro = Vareiro.new(vareiro_params)

    respond_to do |format|
      if @vareiro.save
        format.html { redirect_to @vareiro, notice: 'Vareiro was successfully created.' }
        format.json { render :show, status: :created, location: @vareiro }
      else
        format.html { render :new }
        format.json { render json: @vareiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vareiros/1
  # PATCH/PUT /vareiros/1.json
  def update
    respond_to do |format|
      if @vareiro.update(vareiro_params)
        format.html { redirect_to @vareiro, notice: 'Vareiro was successfully updated.' }
        format.json { render :show, status: :ok, location: @vareiro }
      else
        format.html { render :edit }
        format.json { render json: @vareiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vareiros/1
  # DELETE /vareiros/1.json
  def destroy
    @vareiro.destroy
    respond_to do |format|
      format.html { redirect_to vareiros_url, notice: 'Vareiro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vareiro
      @vareiro = Vareiro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vareiro_params
      params.require(:vareiro).permit(:forum)
    end
end
