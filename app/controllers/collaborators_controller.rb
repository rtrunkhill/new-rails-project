class CollaboratorsController < ApplicationController

    
    def create
        @user = User.where(email: params[:email]).take
        @wiki = Wiki.find(params[:wiki_id])
        
        if @user == nil
            flash[:notice] = "Is that your imaginary friend? #{(params[:email])}  doesn't exist"
            redirect_to edit_wiki_path(@wiki)
       
        elsif @wiki.users.include?(@user)
            flash[:notice] = "A collaborator so nice you listed them twice! #{(params[:email])} is already a collaborator."
            redirect_to edit_wiki_path(@wiki)
        
        else
            @collaborator = Collaborator.new
            @collaborator.user_id = @user.id
            @collaborator.wiki_id = @wiki.id
            
            if @collaborator.save
                flash[:notice] = "#{(params[:email])} is now a collaborator on the #{@wiki.title} wiki!"
                redirect_to edit_wiki_path(@wiki)
            else
                flash.now[:alert] = "Something went wrong! Oh the humanity! (plese try again)"
                redirect_to edit_wiki_path(@wiki)
            end
        end
    end
    
    
    def destroy
        @collaborator = Collaborator.find(params[:id])
        p "*******************************************"
        p @collaborator
        p "*******************************************"
        #@wiki = Collaborator.find(params[:wiki_id])
        
        if @collaborator.destroy
            flash[:notice] = "Collaborator was removed. What will they do now?"
            redirect_to action: :index
        else
            flash.now[:alert] = "What did you do, Ray? That Collaborator is still there!"
            render :show
        end
    end
end


