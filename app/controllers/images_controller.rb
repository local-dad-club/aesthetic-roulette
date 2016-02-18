class ImagesController < ApplicationController

  # Render the upload image page
  def new
    @image = Image.new
  end

  # Add a new image to the database
  def create
    @image = Image.new(message_params)
    if @image.image_file_name.present? && @image.save
        flash[:success] = "Image uploaded successfully"
    else
        flash[:danger] = "Image upload failed. You're so dumb Katie"
    end
    redirect_to url_for(:images_new)
  end

  private
  def image_params
    params.require(:image).permit(:category, :tags, :image)
  end
end
