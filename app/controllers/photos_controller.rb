class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @list_of_photos = Photo.all

    @photo = @list_of_photos.find(params["id"])

    if params["photo_caption"].nil? == false
      @photo.caption = params["photo_caption"]
      @photo.save
    end

    if params["image_url"].nil? == false
      @photo.source = params["image_url"]
      @photo.save
    end

    @photo = @list_of_photos.find(params["id"])


    render ("show_photo.html.erb")
  end

  def edit
    @list_of_photos = Photo.all
    @id = params["id"]
    @photo = @list_of_photos.find(@id)



    render("edit_photo.html.erb")
  end

end
