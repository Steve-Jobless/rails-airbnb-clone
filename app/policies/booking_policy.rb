class BookingPolicy < ApplicationPolicy
  class Scope < Scope
      def resolve
        scope.all

        # For a multi-tenant SaaS app, you may want to use:
        # scope.where(user_id: user)
      end
  end

    def create?
      true
    end

    def update?
      true
    end
end
