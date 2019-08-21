class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:digger).where(diggers: { user_id: user })
    end
  end

  def create?
    true
  end

  def mine?
    true
  end
end
