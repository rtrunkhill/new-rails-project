require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let(:user) { create(:user) }
  
  before do
    sign_in(user)
  end


  describe "POST #create" do
    it "upgrades a user role" do
      post :create, { current_user: user }
      expect(user.role).to eq("premium")
    end
  end
  
  describe "DELETE #downgrade" do
    it "changes a user role to standard" do
      user.premium!
      delete :downgrade, {current_user: user }
      expect(user.role).to eq("standard")
    end  
  end
  
end

