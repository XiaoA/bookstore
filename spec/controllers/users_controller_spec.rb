require 'rails_helper'


RSpec.describe UsersController, :type => :controller do
  describe "GET #new" do
    it "returns a successful HTTP request status code" do
      get :new

      expect(response).to have_http_status(:success)
    end

    it "assigns a new user to @user" do
      
    end
  end

  describe "GET #show" do
    it "returns a successful HTTP request status code" do
      user = Fabricate(:user)
      get :show, id: user.id

      expect(response).to have_http_status(:success)
    end

    it "displays a user profile" do
    end
  end

  

  describe "POST #create" do
    context "a successful create" do
      it "saves the new user object" do
        post :create, user: Fabricate.attributes_for(:user)
        
        expect(User.count).to eq(1)
      end

      it "redirects to the 'sign in' page" do
        post :create, user: Fabricate.attributes_for(:user)

        expect(response).to redirect_to signin_path
      end

      it "sets the 'success' flash message" do
        post :create, user: Fabricate.attributes_for(:user)
        
        expect(flash[:success]).to eq('User has been created.')
      end
    end

    context "an unsuccessful create" do
      it "does not save the new user object with invalid inputs" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
        expect(User.count).to eq(0)
      end

      it "sets the 'failure' flash message" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
        expect(flash[:danger]).to eq('User has not been created.')
      end
    end 
  end
end
