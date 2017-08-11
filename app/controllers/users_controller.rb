class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all.order('name ASC')
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.name}! Be sure to update your profile!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    authorize @user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    authorize User
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User Deleted"
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation,
                                    :ins, :address, :dob, :role,
                                    :b_pressure, :weight, :height,
                                    :symptoms, :curr_condition,
                                    :emer_contact_name, :emer_contact_phone,
                                    :ssn, :phone_number)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin? || current_user.doctor?  || current_user.nurse?  || current_user.receptionist?
    end
end
