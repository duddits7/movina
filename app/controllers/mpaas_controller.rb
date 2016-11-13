class MpaasController < ApplicationController
  before_action :set_mpaa, only: [:show, :edit, :update, :destroy]

  # GET /mpaas
  # GET /mpaas.json
  def index
    @mpaas = Mpaa.all
  end

  # GET /mpaas/1
  # GET /mpaas/1.json
  def show
  end

  # GET /mpaas/new
  def new
    @mpaa = Mpaa.new
  end

  # GET /mpaas/1/edit
  def edit
  end

  # POST /mpaas
  # POST /mpaas.json
  def create
    @mpaa = Mpaa.new(mpaa_params)

    respond_to do |format|
      if @mpaa.save
        format.html { redirect_to @mpaa, notice: 'Mpaa was successfully created.' }
        format.json { render :show, status: :created, location: @mpaa }
      else
        format.html { render :new }
        format.json { render json: @mpaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mpaas/1
  # PATCH/PUT /mpaas/1.json
  def update
    respond_to do |format|
      if @mpaa.update(mpaa_params)
        format.html { redirect_to @mpaa, notice: 'Mpaa was successfully updated.' }
        format.json { render :show, status: :ok, location: @mpaa }
      else
        format.html { render :edit }
        format.json { render json: @mpaa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mpaas/1
  # DELETE /mpaas/1.json
  def destroy
    @mpaa.destroy
    respond_to do |format|
      format.html { redirect_to mpaas_url, notice: 'Mpaa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mpaa
      @mpaa = Mpaa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mpaa_params
      params.require(:mpaa).permit(:name)
    end
end
