class BookmkfoldersController < ApplicationController
  before_action :set_bookmkfolder, only: [:show, :edit, :update, :destroy]

  # GET /bookmkfolders
  # GET /bookmkfolders.json
  def index
    @bookmkfolders = Bookmkfolder.order("sequence")
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
    colors = ['#c9ddff', '#c9ffdd', '#ffd2c9', '#c9caff', '#fdc9ff', '#fffdc9', '#c9fffc', '#ffc9c9', '#ffe5c9', '#eaffc9']
    puts Bookmkfolder.methods
    @bookmkfolder = Bookmkfolder.new(bookmkfolder_params)
    @bookmkfolder.user = current_user
    @bookmkfolder.sequence = Bookmkfolder.count + 1
    @bookmkfolder.bookmkfoldercolor = colors.at(rand(colors.size))

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
    @bookmkfolder = Bookmkfolder.find(params[:id])
    if @bookmkfolder.update_attributes(params[:sequence])
      redirect_to @bookmkfolder, notice:"AA!"
    else
      render :edit
    end
    # respond_to do |format|
    #   if @bookmkfolder.update(bookmkfolder_params)
    #     format.html { redirect_to @bookmkfolder, notice: 'Bookmkfolder was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @bookmkfolder }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @bookmkfolder.errors, status: :unprocessable_entity }
    #   end
    # end
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

  def sort
    folder = params[:sequence]
    puts params[:sequence]
    for i in 1..folder.size
        fold = Bookmkfolder.find(i)
        fold.sequence = params[:sequence].index(i.to_s)
        fold.save
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
