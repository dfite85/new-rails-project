require 'rails_helper'
# here we go with this shit again.
RSpec.describe WelcomeController, type: :controller do
    
    describe "GET #index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "GET #about" do
        it "returns http succes" do
            get :about
            expect(response).to have_http_status(:success)
        end
    end
end