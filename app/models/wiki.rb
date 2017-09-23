class Wiki < ActiveRecord::Base
  belongs_to :user
  
  after_initialize :access
  default_scope { order('created_at DESC') }
  
  def access
    self.private ||= false
  end

end
