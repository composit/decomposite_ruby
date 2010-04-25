class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post.user_id = current_user.id
  end

  def edit
  end

  def create
    if( @post.save )
      redirect_to( @post, :notice => 'Post was successfully created.' )
    else
      render :action => "new"
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to( @post, :notice => 'Post was successfully updated.' )
    else
      render :action => "edit"
    end
  end

  def destroy
    @post.destroy

    redirect_to(posts_url)
  end
end
