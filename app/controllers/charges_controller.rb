class ChargesController < ApplicationController
    
    def create
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
        
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: 15_00,
            description: "Blocipedia Membership - #{current_user.email}",
            currency: 'usd'
        )
        
        current_user.update_attribute(:role, 1)
        
        
        flash[:notice] = "#{current_user.email} paid up!"

        redirect_to root_path
        
        rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end
    
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Blocipedia Membership - #{current_user.email}",
            amount: 15_00
        }
    end
    
    private 
    
    def upgrade_user_role
        @user.role = 'premium'
    end
end
