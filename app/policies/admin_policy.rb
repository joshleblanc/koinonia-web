class AdminPolicy < ApplicationPolicy 
    def admin?
        @user&.admin?
    end

    def index? = admin?
    def show? = admin?
    def create? = admin?
    def new? = admin?
    def update? = admin?
    def edit? = admin?
    def destroy? = admin?
end