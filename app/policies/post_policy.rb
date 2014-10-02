class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    @user.role == "editor"
  end

  def create?
    @user.role == "author" || "editor"
  end

  def update?

  end

end
