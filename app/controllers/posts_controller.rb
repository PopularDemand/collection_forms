class PostsController < ApplicationController

  before_action :form_setup, only: [:new, :edit]

  def new
    @post = Post.new
    @comment = @post.comments.build
  end

  def edit
    @post = Post.find(params[:id])
    @post.comments.build
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
    @posts = Post.all
  end

  private

  def form_setup
    @category_options = Category.all.map { |c| [c.name, c.id] }
  end

  def whitelisted_post_params
    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [], :comments_attributes => [:body, :id, :_destroy])
  end

end
