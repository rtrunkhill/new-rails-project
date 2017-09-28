require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
#   let (:my_wiki) { create(:wiki) }
#   let (:my_user) { create(:user) }
#   let (:other_user) { create(:user) }
#   let (:other_post) { create(:wiki, user: other_user) }    

    
    describe "POST create" do
    #   it "increases the number of wikis by 1" do
    #     expect{ post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph} }.to change(Wiki,:count).by(1)
    #   end
      
    #   it "assigns Wiki.last to @wiki" do
    #     post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
    #     expect(assigns(:wiki)).to eq  Wiki.last
    #   end
      
    #   it "redirects to the new wiki" do
    #     post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
    #     expect(response).to redirect_to Wiki.last
    #   end
    end
    
    describe "DELETE destroy" do
        # it "deletes the wiki" do
        #     delete :destroy, {id: my_wiki.id}
        #     count = Wiki.where({id: my_wiki.id}).size
        #     expect(count).to eq 0
        # end
        
        # it "redirects to wikis index" do
        #     delete :destroy, {id: my_wiki.id}
        #     expect(response).to redirect_to wikis_path
        # end
    end
end
