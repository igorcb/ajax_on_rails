class PostsController < ApplicationController
  before_filter :load

  def load
    @posts = Post.all
    @post = Post.new
  end

  def index
  end

#  def show
#    @post = Post.find(params[:id])
#  end

#  def new
#    @post = Post.new
#  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to posts_url
    end  
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      @post = Post.all
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    @post = Post.all
  end
end
