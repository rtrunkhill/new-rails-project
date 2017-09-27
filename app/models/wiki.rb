class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collabortors
  
  default_scope { order('created_at DESC') }
  

end
