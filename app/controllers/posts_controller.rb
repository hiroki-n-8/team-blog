class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: '削除しました'
    else
      redirect_to root_path, notice: '削除できませんでした'
    end
  end

  private
  
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:opponent,:result,:goal,:allow,:scorer,:commentary)
  end
end

#データベース(カラム名)
#opponent（対戦相手）,result（結果）,goal（得点）,allow（失点）,scorer（得点者）,commentary（戦評）