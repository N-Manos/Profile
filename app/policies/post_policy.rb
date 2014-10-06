class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_accessor :user, :post

  def initialize(user, post)
    @user = user || User.new
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

  def destroy?
    @user.role == "editor"
  end

  def index?
    if @user.role == "editor"
      return true
    else
      @user.id == @post.author_id
    end
  end

end
