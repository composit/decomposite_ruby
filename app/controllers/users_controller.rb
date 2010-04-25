class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create

    if( @user.save )
      redirect_to( @user, :notice => 'User was successfully created.' )
    else
      render :action => "new"
    end
  end

  def update
#    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to( @user, :notice => 'User was successfully updated.' )
    else
      render :action => "edit"
    end
  end

  def destroy
#    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url)
  end
end
