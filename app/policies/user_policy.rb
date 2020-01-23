class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record == user
  end

  def show?
    true
  end

  def update?
    record == user
  end

end
