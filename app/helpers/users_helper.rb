module UsersHelper

  def get_all_roles
    Role.where({user_id: self.id})
  end

  def get_all_active_roles
    Role.where({user_id: self.id , is_active: true})
  end

  def is_admin?
    Role.where({user_id: self.id, is_active: true , role_type: :admin}).count==1
  end

  def is_product_owner?
    Role.where({user_id: self.id, is_active: true , role_type: :product_owner})
  end

  def is_reporter?
    Role.where({user_id: self.id, is_active: true , role_type: :reporter})
  end

end
