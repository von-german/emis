class ConversationPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @conversation = model
  end

  def index?
    @current_user.user? || @current_user.receptionist?
  end
end
