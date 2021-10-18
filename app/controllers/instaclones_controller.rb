class InstaclonesController < ApplicationController
  before_action :set_instaclone, only: [:show, :edit, :update, :destroy]

  def index
    @instaclones = Instaclone.all
  end

  def new
    if params[:back]
      @instaclone = Instaclone.new(instaclone_params)
    else
      @instaclone = Instaclone.new
    end
  end

  def create
    @instaclone = current_user.instaclones.build(instaclone_params)
    if params[:back]
      render :new
    else
      if @instaclone.save
      # InstacloneMailer.instaclone_mail(@instaclone).deliver
      #　メール機能をherokuに実装できなかったのでコメントアウト
        redirect_to instaclones_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def confirm
    @instaclone = current_user.instaclones.build(instaclone_params)
    render :new if @instaclone.invalid?
  end

  def show
    @favorite = current_user.favorites.find_by(instaclone_id: @instaclone.id)
  end

  def edit
  end

  def update
    if @instaclone.update(instaclone_params)
      redirect_to instaclones_path
    else
      render :edit
    end
  end

  def destroy
    @instaclone.destroy
    redirect_to instaclones_path
  end

  private

  def instaclone_params
    params.require(:instaclone).permit(:content, :image, :image_cache)
  end

  def set_instaclone
    @instaclone = Instaclone.find(params[:id])
  end

  def login_required
    redirect_to new_session_path unless current_user
  end


end
