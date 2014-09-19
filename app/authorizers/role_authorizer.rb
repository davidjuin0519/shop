class RoleAuthorizer < ApplicationAuthorizer

  def self.readable_by?(user)
    user.has_role? :admin
  end

end