class BookmkfolderController < ApplicationController

  def index
    @bookmkfolders = Bookmkfolder.all
  end

  def show
  end

  def createfolder
    @bookmkfolder = Bookmkfolder.new(bookmkfolder_params)
    @bookmkfolder.bookmkfoldertitle = params[:bookmkfolder[bookmkfoldertitle]]

    @bookmkfolder.save

    if @bookmkfolder.save
    respond_to do |format|
      format.js
    end

    else

    end
  end

  private

  def set_post
    @bookmkfolder = Bookmkfolder.find(params[:id])
  end

  def bookmkfolder_params
    params.require(:bookmkfolder).permit(:bookmkfoldertitle)
  end
end
