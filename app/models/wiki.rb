class Wiki < ActiveRecord::Base
  has_many :user
  has_many :collaborators
  
  scope :visible_to, -> (user) { user ? all : where(private: false) }
  
  def publicize
    update_attribute(:private, false)
  end
  
  def public?
    !private
  end  
  
end
