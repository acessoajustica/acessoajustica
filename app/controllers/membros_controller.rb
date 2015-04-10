class MembrosController < ApplicationController
  before_action :set_membro, only: [:show, :edit, :update, :destroy]

  # GET /membros
  # GET /membros.json
  def index
    @membros = Membro.all
  end

  # GET /membros/1
  # GET /membros/1.json
  def show
  end

  # GET /membros/new
  def new
    @membro = Membro.new
    @pessoa = @membro
  end

  # GET /membros/1/edit
  def edit
  end

  # POST /membros
  # POST /membros.json
  def create
    @membro = Membro.new(membro_params)

    respond_to do |format|
      if @membro.save
        format.html { redirect_to @membro, notice: 'Membro was successfully created.' }
        format.json { render :show, status: :created, location: @membro }
      else
        format.html { render :new }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membros/1
  # PATCH/PUT /membros/1.json
  def update
    respond_to do |format|
      if @membro.update(membro_params)
        format.html { redirect_to @membro, notice: 'Membro was successfully updated.' }
        format.json { render :show, status: :ok, location: @membro }
      else
        format.html { render :edit }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membros/1
  # DELETE /membros/1.json
  def destroy
    @membro.destroy
    respond_to do |format|
      format.html { redirect_to membros_url, notice: 'Membro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membro
      @membro = Membro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membro_params
      params.require(:membro).permit(:ano_facultade)
    end
end
