class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show? # anyone can view a restaurant
    true
  end

  def create? # only logged in users can create a restaurant
    true
  end

  def update? # only restaurant creator can update it
    record.user == user
  end

  def destroy? # only restaurant creator can destroy it
    record.user == user
  end

  def search?
    true
  end
end
