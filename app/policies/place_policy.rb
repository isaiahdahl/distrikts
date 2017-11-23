class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def show?
      return true
    end
  end
end
