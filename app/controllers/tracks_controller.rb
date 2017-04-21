class TracksController < ApplicationController
  before_action :require_login

  def new
    @track = Track.new
    render :new
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = ['Invalid track! Bogus.....']
      redirect_to new_track_url
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url
    else
      flash[:errors] = ['Invalid track! Bogus.....']
      redirect_to new_track_url
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])

    if @track
      @track.destroy
      redirect_to bands_url
    else
      flash[:errors] = ['Track does not exist']
      redirect_to bands_url
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :bonus, :lyrics)
  end
end
