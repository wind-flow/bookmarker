class BookmkfolderController < ApplicationController

  def createfolder
    @bookmkfolders = Bookmkfolder.new#(bookmkfolder_params)
    # @bookmkfolders.memid = current_user
    @bookmkfolders.bookmkfoldertitle = "ASD"
    @bookmkfolders.save
    # respond_to do |format|
    #   if @bookmkfolders.save
    #     format.html { redirect_to @bookmkfolders, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @bookmkfolders }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @bookmkfolders.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private
  def bookmkfolder_params
    params.require(:bookmkfolder).permit(:bookmkfoldertitle, :bookmkfoldercolor)
  end
end
