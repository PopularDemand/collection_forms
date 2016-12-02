class PostsController < ApplicationController

  def new
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  def create
  end

end
