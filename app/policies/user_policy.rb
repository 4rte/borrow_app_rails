class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
