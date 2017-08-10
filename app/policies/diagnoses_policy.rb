class DiagnosesPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @diagnoses = model
  end

  def index?
    @current_user.doctor?
  end

  def show?
    @current_user.doctor?
  end

  def edit?
    @current_user.doctor?
  end

  def new?
    @current_user.doctor?
  end

  def create?
    @current_user.doctor?
  end

  def destroy?
    @current_user.doctor?
  end
end
