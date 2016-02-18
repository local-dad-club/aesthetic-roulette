class ImagesController < ApplicationController

  # Render the upload image page
  def new
    @image = Image.new
  end

  # Add a new image to the database
  def create
    @image = Image.new(image_params)
    if @image.save
        flash[:success] = "Succesful upload!"
    else
        flash[:danger] = "Upload failed! You're so dumb Katie"
    end
    redirect_to url_for(:images_new)
  end

  private
  def image_params
    params.require(:image).permit(:category, :tags, :image)
  end
end
