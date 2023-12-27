# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.present?
  end

  def show?
    index?
  end

  def create?
    @user.present?
  end

  def new?
    create?
  end

  def update?
    @record.respond_to?(:user) && @record.user == @user
  end

  def edit?
    update?
  end

  def destroy?
    @record.respond_to?(:user) && @record.user == @user
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
