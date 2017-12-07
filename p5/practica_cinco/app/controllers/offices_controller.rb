class OfficesController < ApplicationController
  before_action :set_offiz, only: [:show, :edit, :update, :destroy]

  # GET /offices
  # GET /offices.json
  def index
    @offices = Office.all
  end

  # GET /offices/1
  # GET /offices/1.json
  def show
  end

  # GET /offices/new
  def new
    @offiz = Office.new
  end

  # GET /offices/1/edit
  def edit
  end

  # POST /offices
  # POST /offices.json
  def create
    @offiz = Office.new(offiz_params)

    respond_to do |format|
      if @offiz.save
        format.html { redirect_to @offiz, notice: 'Office was successfully created.' }
        format.json { render :show, status: :created, location: @offiz }
      else
        format.html { render :new }
        format.json { render json: @offiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1
  # PATCH/PUT /offices/1.json
  def update
    respond_to do |format|
      if @offiz.update(offiz_params)
        format.html { redirect_to @offiz, notice: 'Office was successfully updated.' }
        format.json { render :show, status: :ok, location: @offiz }
      else
        format.html { render :edit }
        format.json { render json: @offiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @offiz.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: 'Office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offiz
      @offiz = Office.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offiz_params
      params.fetch(:offiz, {})
    end
end
