class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @list_of_photos = Photo.all

    @photo = @list_of_photos.find(params["id"])

    render ("show_photo.html.erb")
  end

  def edit


    render("edit_photo.html.erb")
  end

end
