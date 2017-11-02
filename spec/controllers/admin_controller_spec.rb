require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe "GET #index" do
    context "not authorized" do
      it "returns 302" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
    
    context "authorized" do
      before(:all) do
        @user = User.create!({
          :email => 'example@test.com',
          :password => 'please',
          :password_confirmation => 'please' 
        })
      end

      it "returns 200" do
        sign_in @user
        get :index
        expect(response).to have_http_status(200)
      end
     
      after(:all) do
        @user.delete
      end
    end
  end

end
