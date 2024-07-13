class UserPolicy < ApplicationPolicy 
    def show? 
        user.id == record.id || user.admin?
    end

    def index? 
        user.admin?
    end

    def create?
        user.admin?
    end

    def update?
        user.id == record.id || user.admin?
    end

    def destroy?
        user.id == record.id || user.admin?
    end
end