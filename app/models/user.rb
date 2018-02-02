class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis                                                               #expect more than one wiki post
  
  
  
  
  #enum role: [:standard, :admin, :premium]
  def admin?
    self.role == 'admin'
  end  
  
  def premium?
    self.role == 'premium'
  end

end
