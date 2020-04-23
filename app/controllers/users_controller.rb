class UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update,:destroy]
def index
  if params[:search].present?
    @users = User.where("first_name LIKE ? or email Like ?","%#{params[:search]}%","%#{params[:search]}%")
  else
    @users = User.all
  end
  end
 
  def show
    @user
  end
 
  def new
    @user = User.new
  end
 
  def edit
   @user
  end

  def sign_in

  end

  def user_sign_in
  if params[:email].present? && params[:password].present?
   @user = User.where(email: params[:email],password: params[:password]).first
   if @user.present?
    session[:user]=@user.id
    redirect_to '/posts'
   else
    flash[:notice]="Invalid username and password"
   end
  end
  end

  def logout
    reset_session
    flash[:notice] = "This user has been successfully logged out"
    redirect_to '/'
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user]=@user.id
      flash[:notice]="The user was sucessfully created"
      redirect_to @user
    else
      render 'new'
    end
  end
 
  def update
    @user
    if @user.update(user_params)
      flash[:notice]="The user was sucessfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
 
  def destroy
    @user
    @user.destroy
 
    redirect_to users_path
  end

  def set_user
     @user = User.find(params[:id])
  end
 
  private
    def user_params
      params.require(:user).permit(:first_name, :email,:password)
    end
end
