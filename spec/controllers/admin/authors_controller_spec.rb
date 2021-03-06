require 'rails_helper'
require 'support/macros'

RSpec.describe Admin::AuthorsController, :type => :controller do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before { set_current_admin admin }

  describe "GET #index" do
    context "guest users" do
      it_behaves_like "requires sign in" do
        let(:action) { get :index }
      end
    end

    context "non-admin users" do
      it_behaves_like "requires admin status" do
        let(:action) { get :index }
      end
    end

    context "admin users" do
      it "returns a successful HTTP request status code (200)" do
        get :index

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #show" do
    let(:author)  { Fabricate(:author) }

    context "guest users" do
      it_behaves_like "requires sign in" do
        let(:action) { get :index }
      end
    end

    context "non-admin users" do
      it_behaves_like "requires admin status" do
        let(:action) { get :index }
      end
    end

    context "admin users" do
      it "returns a successful HTTP request status code" do
        get :show, id: author.id

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #new" do
    it "returns a successful HTTP request status code" do
      get :new

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves the new author object" do
        post :create, author: Fabricate.attributes_for(:author)
        
        expect(Author.count).to eq(1)
      end

      it "redirects to the author show action" do
        post :create, author: Fabricate.attributes_for(:author)

        expect(response).to redirect_to admin_author_path(Author.first)
      end

      it "sets the 'success' flash message" do
        post :create, author: Fabricate.attributes_for(:author)
        
        expect(flash[:success]).to eq('Author has been created.')
      end
    end

    context "an unsuccessful create" do
      it "does not save the new author object with invalid inputs" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(Author.count).to eq(0)
      end

      it "sets the 'failure' flash message" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(flash[:danger]).to eq('Author has not been created.')
      end
    end 
  end

  describe "GET #edit" do
    let(:author) { Fabricate(:author) }

    it "sends a successsful edit request" do
      get :edit, id: author.id

      expect(response).to have_http_status(:success)
    end

    it "finds the author with the given ID and assigns to @author" do
      get :edit, id: author.id
      expect(assigns(:author)).to eq(author)
    end
  end

  describe "PUT #update" do
    context "a successful update" do
      let(:author) { Fabricate(:author, first_name: 'Karen') }

      it "updates the modified author object" do
        put :update, author: Fabricate.attributes_for(:author, first_name: ''), id: author.id
        expect(Author.first.first_name).to eq('Karen')
      end

      it "redirects to the show action " do
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Karen'), id: author.id
        expect(response).to redirect_to admin_author_path(Author.first)
      end

      it "sets the success flash message" do
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Karen'), id: author.id
        expect(flash[:success]).to eq('Author has been updated.')
      end
    end

    context "an unsucessful update" do
      let(:author) { Fabricate(:author, first_name: 'Karen') }

      it "does not update the modified author object" do
        put :update, author: Fabricate.attributes_for(:author, first_name: ''), id: author.id
        expect(Author.first.first_name).to eq('Karen')
      end

      it "sets the danger flash message" do
        put :update, author: Fabricate.attributes_for(:author, first_name: ''), id: author.id
        expect(flash[:danger]).to eq('Author has not been updated.')
      end
    end
  end

  describe "DELETE #destroy" do
    let(:author) { Fabricate(:author) }

    it "deletes the author with a given ID" do 
      delete :destroy, id: author.id
      expect(Author.count).to eq(0)
    end

    it "sets the flash 'success' message" do
      delete :destroy, id: author.id
      expect(flash[:success]).to eq('Author has been deleted.')
    end

    it "redirects to the index page" do
      delete :destroy, id: author.id
      expect(response).to redirect_to admin_authors_path
    end
  end
end
