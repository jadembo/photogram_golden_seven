class PhotosController < ApplicationController
  def index
    if params["photo_caption"].nil? == false && params["image_url"].nil? == false
      g = Photo.new
      g.source = params["image_url"]
      g.caption = params["photo_caption"]
      g.save
    end

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

  def delete
    @list_of_photos = Photo.all

    @photo = @list_of_photos.find(params["id"])
    @photo.destroy

    @list_of_photos = Photo.all

    render("index.html.erb")

  end

  def create

    render ("create.html.erb")

  end

end
