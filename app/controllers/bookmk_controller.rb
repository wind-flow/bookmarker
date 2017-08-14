require 'link_thumbnailer'

class BookmkController < ApplicationController

  def index
    object = LinkThumbnailer.generate('http://stackoverflow.com')
    render 'index'
  end

end
