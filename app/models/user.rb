class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # has_many :wikis
  
  has_many :collaborators
  has_many :wikis, through: :collaborators
         
  before_save { self.role ||= :standard }
  
  enum role: [:standard, :premium, :admin]
  
  after_initialize :first_time
  
  def first_time
    self.role ||= :standard
  end
  

end
