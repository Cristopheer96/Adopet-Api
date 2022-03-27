class OwnerPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
     end
    end
    def show?
      # true
      user.present?

    end
    def update?
      record.id == user.owner.id
    end
    def create?
    user.present?
    end
    def destroy?
      user.owner.present?
    end
end
