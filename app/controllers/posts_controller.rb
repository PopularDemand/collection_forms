class PostsController < ApplicationController

  def new
    @post = Post.new
    @category_options = Category.all.map { |c| [c.name, c.id] }
  end

  def edit
    @post = Post.find(params[:id])
    @category_options = Category.all.map { |c| [c.name, c.id] }
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_post_params)
      flash[:success] = "Post Edited!"
      redirect_to @post
    else
      flash.now[:warning] = "Post not edited!"
      render :new
    end
  end

  def create
    @post = Post.new(whitelisted_post_params)
    if @post.save
      flash[:success] = "Post Created!"
      redirect_to @post
    else
      flash.now[:warning] = "Post not created!"
      render :new
    end
  end

  def index

  end

  private

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])
  end

end
