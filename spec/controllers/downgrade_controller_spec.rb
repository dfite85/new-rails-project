require 'rails_helper'
require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  # For Devise >= 4.1.0
  config.include Devise::Test::ControllerHelpers, :type => :controller           
  # Use the following instead if you are on Devise <= 4.1.1
  # config.include Devise::TestHelpers, :type => :controller
end                                                                             #had to find a work around to even TEST a controller
 
RSpec.describe DowngradeController, type: :controller do
  let(:user) {User.create!(email: "fake@fakemail.com", password: "password", role: "role")}
  
  describe "attributes" do
          it "has an email and password" do
              expect(user).to have_attributes(email: "fake@fakemail.com", password: "password", role: "role")
          end
      end
  end


