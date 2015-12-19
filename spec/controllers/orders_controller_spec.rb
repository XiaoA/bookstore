require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:sherlock) { Fabricate(:user) }
  before { set_current_user(sherlock) }

  describe "GET #new" do
    it "returns a successful http request status code" do
      get :new

      expect(response).to have_http_status(:success)
    end

    it "redirects to the 'sign in' page for unauthenticated users" do
      clear_current_user
      
      get :new
      expect(response).to redirect_to signin_path
    end
  end
  
end
