class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = ["You done goofed"]
      redirect_to track_url(@note.track_id)
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])

    if @note && (@note.user_id == current_user.id || current_user.admin_status)
      @note.destroy
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = ["janked up the server"]
      render text: "GET OUT BRUH", status: :forbidden
    end
  end

  private

  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
