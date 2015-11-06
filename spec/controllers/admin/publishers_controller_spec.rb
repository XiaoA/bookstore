require 'rails_helper'

RSpec.describe Admin::PublishersController, :type => :controller do
  let(:admin) { Fabricate(:admin) }

  before do
    session[:user_id] = admin.id
  end

  describe "GET #index" do
    it "returns a successful http request status code" do
      get :index

      expect(response).to have_http_status(:success)
    end

    it "assigns publisher objects to @publisher variables" do
      publisher1 = Fabricate(:publisher)
      publisher2 = Fabricate(:publisher)

      get :index
      expect(assigns(:publishers)).to match_array([publisher1, publisher2])
    end
  end
  
  describe "GET #show" do
    let(:publisher) { Fabricate(:publisher) }
    it "returns a successful http request status code" do
      get :show, id: publisher
      expect(response).to have_http_status(:success)
    end

    it "finds the publisher with the given id and assigns it to @publisher" do
      get :show, id: publisher
      expect(assigns(:publisher)).to eq(publisher)
    end
  end

  describe "GET #new" do
    it "returns a successful http request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful create" do

      before do
        post :create, publisher: Fabricate.attributes_for(:publisher)

        it "saves the new publisher object" do

          expect(Publisher.count).to eq(1)
        end
        
        it "redirects to the show action" do
          expect(response).to redirect_to admin_publisher_path(Publisher.first)
        end
        
        it "sets the success flash message" do
          expect(flash[:success]).to eq('Publisher has been created.')
        end
        
      end
    end
    
    context "unsuccessful create" do
      before do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
      end
      
      it "it does not save the new publisher object with invalid inputs" do
        expect(Publisher.count).to eq(0)
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end
      
      it "sets the failure flash message" do
        expect(flash[:danger]).to eq('Publisher has not been created.')
      end
    end
  end

  describe "GET #edit" do
    let(:publisher) { Fabricate(:publisher, name: 'Pendant Publishing') }
    it "sends a successful edit request" do
      get :edit, id: publisher

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "a successful update" do
      let(:publisher) { Fabricate(:publisher) }
      before do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: 'Pendant Publishing'), id: publisher.id
      end

      it "updates the modified publisher object" do
        expect(Publisher.first.name).to eq('Pendant Publishing')
      end

      it "redirects to the show action" do
        expect(response).to redirect_to admin_publisher_path(Publisher.first)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq('Publisher has been updated.')
      end
    end

    context "unsuccessful update" do
      let(:publisher) { Fabricate(:publisher, name: 'Pendant Publishing') }

      before do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: ''), id: publisher.id
      end

      it "does not update the modified publisher object" do
        expect(Publisher.first.name).to eq('Pendant Publishing')
      end

      it "sets the failure flash message" do

        expect(flash[:danger]).to eq('Publisher has not been updated.')
      end
    end #context
  end

  describe 'DELETE #destroy' do
    let(:publisher) { Fabricate(:publisher) }
    before do
      delete :destroy, id: publisher
    end

    it 'deletes the publisher with the given id' do

      expect(Publisher.count).to eq(0)
    end

    it 'sets the flash message' do
      expect(flash[:success]).to eq('Publisher has been deleted.')

    end

    it 'redirects to the index page' do
      expect(response).to redirect_to admin_publishers_path
    end
  end
end

