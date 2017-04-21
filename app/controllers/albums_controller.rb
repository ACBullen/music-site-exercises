class AlbumsController < ApplicationController
  before_action :require_login

  def new
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = ['Invalid album! Bogus.....']
      redirect_to new_album_url
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url
    else
      flash[:errors] = ['Invalid album! Bogus.....']
      redirect_to new_album_url
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])

    if @album
      @album.destroy
      redirect_to bands_url
    else
      flash[:errors] = ['Album does not exist']
      redirect_to bands_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :genre, :album_type)
  end
end
