class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Cofounder.com"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account was updated successfully"
      redirect_to users_path
    else
      render 'edit'
    end

  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :name, :role, :looking, :partnerrole, :industry, :aboutfounder, :aboutbusiness)
  end



end