class BookmkfoldersController < ApplicationController
  before_action :set_bookmkfolder, only: [:show, :edit, :update, :destroy]

  # GET /bookmkfolders
  # GET /bookmkfolders.json
  def index
    @bookmkfolders = Bookmkfolder.all
    @bookmkfolder = Bookmkfolder.new
  end

  # GET /bookmkfolders/1
  # GET /bookmkfolders/1.json
  def show
  end

  # GET /bookmkfolders/new
  def newfolder

    #  redirect_to '/bookmkfolder/createfolder'
  end

  # GET /bookmkfolders/1/edit
  def edit
    authorize_action_for @bookmkfolder
  end

  # POST /bookmkfolders
  # POST /bookmkfolders.json
  def createfolder
    @bookmkfolder = Bookmkfolder.new(bookmkfolder_params)
    @bookmkfolder.user = current_user
    respond_to do |format|
      if @bookmkfolder.save
        format.html { redirect_to @bookmkfolder, notice: 'Bookmkfolder was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @bookmkfolder }

      else
        format.html { render :new }
        format.json { render json: @bookmkfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmkfolders/1
  # PATCH/PUT /bookmkfolders/1.json
  def update
    authorize_action_for @bookmkfolder
    respond_to do |format|
      if @bookmkfolder.update(bookmkfolder_params)
        format.html { redirect_to @bookmkfolder, notice: 'Bookmkfolder was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmkfolder }
      else
        format.html { render :edit }
        format.json { render json: @bookmkfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmkfolders/1
  # DELETE /bookmkfolders/1.json
  def destroy
    authorize_action_for @bookmkfolder
    @bookmkfolder.destroy
    respond_to do |format|
      format.html { redirect_to bookmkfolders_url, notice: 'Bookmkfolder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmkfolder
      @bookmkfolder = Bookmkfolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmkfolder_params
      params.require(:bookmkfolder).permit(:bookmkfoldertitle)
    end
end
