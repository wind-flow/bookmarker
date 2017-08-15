class BookmksController < ApplicationController

  def createbookmk
    @bookmk = Bookmk.new(set_bookmk)
    @bookmk.bookmkid = params[:input_bookmkid]
    @bookmk.bookmkfolder_id = params[:bookmkfolder_id]

    respond_to do |format|
      if @bookmk.save
        format.html { redirect_to @bookmkfolder }
        format.js {}
        format.json { render :show, status: :created, location: @bookmk }

      else
      end
    end

  end

  def destroybookmk
    @bookmk.destroy
    respond_to do |format|
      format.html { redirect_to bookmkfolders_url, notice: 'Bookmk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmk
      @bookmkfolder = Bookmkfolder.find(params[:bookmkfolder_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def bookmk_params
    #   params.require(:bookmk).permit(:bookmkid)
    # end

end
