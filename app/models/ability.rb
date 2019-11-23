# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user
    when nil
      apply_anonymous_permissions
    when Visitor
      apply_visitor_permissions(user)
    when Admin
      apply_admin_permissions(user)
    end
  end

  def apply_anonymous_permissions
    can [ :read, :dongp, :jiax ], Work
    can [ :read, :create ], Suggestion
    can [ :read ], Flip
  end

  def apply_visitor_permissions(visitor)
    apply_anonymous_permissions
    can [ :read, :update ], User, id: visitor.id
    can [ :create, :destroy ], Flip
  end

  def apply_admin_permissions(admin)
    apply_visitor_permissions(admin)

    if admin.superadmin
      can :manage, :all
    else
      can [ :create, :update ], Work
      can [ :read, :create ], Admin
    end
  end
end
