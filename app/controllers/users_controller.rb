class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy, :likes]
  before_action :require_admin, only: [:destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Cofounder.com"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to users_path
    else
      render 'edit'
    end

  end

  def destroy
      @user.destroy
      flash[:danger] = "User has been deleted"
      redirect_to users_path
  end

  def likes
    current_user.like!(@user)
    redirect_to :back, notice: "Liked this profile successfully!"
  end


  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :password, :email, :name, :role, :looking, :partnerrole, :industry, :aboutfounder, :aboutbusiness, category_ids: [])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end



end
