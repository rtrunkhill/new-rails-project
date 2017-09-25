class ChargesController < ApplicationController
  
  
  def create
    customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is NOT the user_id in your app
    amount: Amount.default,
    description: "BigMoney Membership - #{current_user.email}",
    currency: 'usd'
    )
    
    flash[:notice] = "Thanks for all the money, #{current_user.email}! You are now a premium user!."
    current_user.premium!
    redirect_to wikis_path(current_user) # or wherever
    
    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: Amount.default
    }
  end
  
  def destroy
    current_user.standard!
    
    Wiki.where(user_id: current_user.id).each do |wiki|
      wiki.private = false
      wiki.save
    end
    
    flash[:notice] = "You are back to a boring standard account."
    redirect_to wikis_path(current_user)
  end
end
