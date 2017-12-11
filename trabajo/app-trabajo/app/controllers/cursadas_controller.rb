class CursadasController < ApplicationController
  before_action :set_cursada, only: [:show, :edit, :update, :destroy]

  # GET /cursadas
  # GET /cursadas.json
  def index
    @cursadas = Cursada.all
  end

  # GET /cursadas/1
  # GET /cursadas/1.json
  def show
  end

  # GET /cursadas/new
  def new
    @cursada = Cursada.new
  end

  # GET /cursadas/1/edit
  def edit
  end

  # POST /cursadas
  # POST /cursadas.json
  def create
    @cursada = Cursada.new(cursada_params)

    respond_to do |format|
      if @cursada.save
        format.html { redirect_to @cursada, notice: 'Cursada was successfully created.' }
        format.json { render :show, status: :created, location: @cursada }
      else
        format.html { render :new }
        format.json { render json: @cursada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursadas/1
  # PATCH/PUT /cursadas/1.json
  def update
    respond_to do |format|
      if @cursada.update(cursada_params)
        format.html { redirect_to @cursada, notice: 'Cursada was successfully updated.' }
        format.json { render :show, status: :ok, location: @cursada }
      else
        format.html { render :edit }
        format.json { render json: @cursada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursadas/1
  # DELETE /cursadas/1.json
  def destroy
    @cursada.destroy
    respond_to do |format|
      format.html { redirect_to cursadas_url, notice: 'Cursada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cursada
      @cursada = Cursada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cursada_params
      params.require(:cursada).permit(:year)
    end
end
