class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators
  
  scope :visible_to, -> (user) { user ? all : where(private: false) }
  
  def publicize
    update_attribute(:private, false)
  end
  
  def public?
    !private
  end  
  
end
