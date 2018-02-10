class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis                                                               #expect more than one wiki post
  has_many :collaborators 
  has_many :users
  
  
  
  #enum role: [:standard, :admin, :premium]
  def admin?
    self.role == 'admin'
  end  
  
  def premium?
    self.role == 'premium'
  end
  
  def standard?
    self.role == 'standard'
  end
  
  def going_public
    self.wikis.each { |wiki| puts wiki.publicize }
  end

end
