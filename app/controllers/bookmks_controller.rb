class BookmksController < ApplicationController
  before_action :set_bookmk, only: [:show, :edit, :update, :destroy]

  # GET /bookmks
  # GET /bookmks.json
  def index
    @bookmks = Bookmk.all
  end

  # GET /bookmks/1
  # GET /bookmks/1.json
  def show
  end

  # GET /bookmks/new
  def new
    @bookmk = Bookmk.new
  end

  # GET /bookmks/1/edit
  def edit
  end

  # POST /bookmks
  # POST /bookmks.json
  def create
    @bookmk = Bookmk.new(bookmk_params)

    respond_to do |format|
      if @bookmk.save
        format.html { redirect_to @bookmk, notice: 'Bookmk was successfully created.' }
        format.json { render :show, status: :created, location: @bookmk }
      else
        format.html { render :new }
        format.json { render json: @bookmk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmks/1
  # PATCH/PUT /bookmks/1.json
  def update
    respond_to do |format|
      if @bookmk.update(bookmk_params)
        format.html { redirect_to @bookmk, notice: 'Bookmk was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmk }
      else
        format.html { render :edit }
        format.json { render json: @bookmk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmks/1
  # DELETE /bookmks/1.json
  def destroy
    @bookmk.destroy
    respond_to do |format|
      format.html { redirect_to bookmks_url, notice: 'Bookmk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmk
      @bookmk = Bookmk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmk_params
      params.require(:bookmk).permit(:bookmkobj, :bookmkseq, :bookmkclick, :bookmkfolder_id, :user_id)
    end
end
