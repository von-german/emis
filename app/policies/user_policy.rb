class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin? || @current_user.receptionist? ||
    @current_user.nurse? || @current_user.doctor?
  end

  def show?
    @current_user.admin? || @current_user == @user ||
    @current_user.receptionist? || @current_user.nurse? ||
    @current_user.doctor?
  end

  def update?
    @current_user.admin? || @current_user == @user || @current_user.nurse? || @current_user.doctor? || @current_user.receptionist?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end
end
