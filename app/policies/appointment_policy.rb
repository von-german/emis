class AppointmentPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @appointment = model
  end

  def index?
    @current_user.receptionist? || @current_user.user?
  end

  def show?
    @current_user.user? || @current_user.receptionist?
  end

  def new?
    @current_user.receptionist?
  end

  def create?
    @current_user.receptionist?
  end

  def edit
    @current_user.receptionist?
  end

  def update?
    @current_user.receptionist?
  end

  def destroy?
    @current_user.receptionist?
  end
end
