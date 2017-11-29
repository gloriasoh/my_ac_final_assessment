class NotesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :find_id, only: [:edit, :update, :destroy]

  def index
    @notes = Note.all
    @user = User.all
    @note = current_user.feed.order("created_at DESC") if current_user

  end

  def like
    @note = Note.find(params[:id])
    @note.likes.create(user: current_user)
    UserMailer.notice(current_user).deliver_later
    redirect_to root_path
  end

  def unlike
    @note = Note.find(params[:id])
    @like = @note.likes.find_by(user: current_user)
    @like.destroy
    UserMailer.notice(current_user.email).deliver_later
    redirect_to root_path
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
  params.require(:note).permit(:title, :body)
end

def find_id
  @note = Note.find(params[:id])
end

end
