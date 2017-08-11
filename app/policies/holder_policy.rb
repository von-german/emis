class HolderPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @holder = model
  end

  def index?
    @current_user.doctor? || @current_user.user?
  end
end
