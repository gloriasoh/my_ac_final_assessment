class NotesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_id, only: [:edit, :update, :destroy]

  def index
    @notes = Note.all
    @user = current_user
    @user = User.all.where("id != ?", current_user.id)
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @note = Note.new
  end

  def edit; end

  def show; end

  def update
    if @note.update(note_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash[:notice] = 'Note sucessfully deleted'
    redirect_to root_path
  end

private

def note_params
  params.require(:note).permit(:body)
end

def find_id
  @note = Note.find(params[:id])
end

end
