class BookmksController < ApplicationController

  # GET /bookmks
  # GET /bookmks.json
  def index
    @bookmks = Bookmk.all
  end

  # GET /bookmks/1
  # GET /bookmks/1.json
  def show
  end

  def addBookmark
      @user = current_user
      begin
        link = LinkThumbnailer.generate(params[:title])
        bookmark = Bookmark.new(category_id: params[:categoryId],
                                title: link.title,
                                link: params[:title],
                                img_url: link.images.first.src.to_s)
        bookmark.save
        render :json => {:isSuccess => true,
                           :title => bookmark.title,
                           :link => bookmark.link,
                           :img_url => bookmark.img_url}
        rescue LinkThumbnailer::Exceptions => e
        # do something
        render :json => {:issSuccess => false}
      end
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
  def createbmk

    begin
      link = LinkThumbnailer.generate(params[:bookmkTitle])

      @bookmkfoldertmp = Bookmkfolder.find(params[:bookmkfolderid])
      @bookmk = Bookmk.new
      # @bookmk = @bookmkfoldertmp.bookmk.new#.build(id: params[:bookmkfolderid], bookmkobj: params[:bookmkobj], user: current_user)
      # @bookmk = Bookmk.new#(bookmkfolder_id: params[:bookmkfolderid].to_i, bookmkobj: params[:bookmkobj])
      @bookmk.bookmkfolder_id = params[:bookmkfolderid]
      @bookmk.bookmkTitle = link.title
      @bookmk.bookmkLink = params[:bookmkTitle]
      @bookmk.bookmkImgUrl = link.images.first.src.to_s

      @bookmk.user = current_user
      @bookmk.save

      @bookmkfoldertmp.bookmks = @bookmk.id
      # @bookmkfoldertmp.save
      @bookmkfoldertmp.save
      render :json => {:isSuccess => true,
                        :title => @bookmk.bookmkTitle,
                        :link => @bookmk.bookmkLink,
                        :imgUrl => @bookmk.bookmkImgUrl
                       }
    rescue LinkThumbnailer::Exceptions => e
      render :json => {:isSuccess => false }
    end
    # respond_to do |format|
    #   if @bookmk.save
    #     format.html { redirect_to @bookmk, notice: 'Bookmk was successfully created.' }
    #     format.json { render :show, status: :created, location: @bookmk }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @bookmk.errors, status: :unprocessable_entity }
    #   end
    # end
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

  def sort
    puts "===================="
    bookmker = params[:bmksequence]
    puts bookmker
    puts "===================="
    for i in 1..bookmker.size
        bookmk = Bookmk.find(bookmker.at(i-1))
        bookmk.bookmkseq = i
        puts bookmk.bookmkTitle
        bookmk.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_bookmk
    #   @bookmk = Bookmk.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
end
