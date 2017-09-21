require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { create(:user) }
    
    describe "attributes" do
        it "email and password attributes" do
            expect(user).to have_attributes(email: user.email, password: user.password)
        end
        
        it "sets standard as default role" do   
            expect(user.role).to eq("standard")
        end
    end
end
