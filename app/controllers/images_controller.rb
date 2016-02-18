class ImagesController < ApplicationController

  # Render the upload image page
  def new
    @image = Image.new
  end

  # Add a new image to the database
  def create
    @image = Image.new(message_params)
    if @image.save
        redirect_to '/images'
    else
        redirect_to 'new'
    end
  end

  private
  def message_params
    params.require(:image).permit(:category, :tags, :image)
  end
end
