class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    true
  end

  def spaces?
    true
  end

  def pending?
    true
  end

  def accepted?
    true
  end

  def user_spaces_bookings?
    true
  end
end
