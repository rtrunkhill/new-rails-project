class Amount < ActiveRecord::Base
    def self.default
        100_00
    end
end
