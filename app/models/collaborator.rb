class Showing < ActiveRecord::Base
    belongs_to :user
    belongs_to :wiki
    
end