class DistriktPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def explore?
    true
  end

  def create?
    user.admin?
    raise
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def new?
    user.admin?
  end
end
