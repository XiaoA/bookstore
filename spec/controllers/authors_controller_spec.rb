require 'spec_helper'

describe AuthorsController do
  describe "GET #index" do
    it "assigns the author object to @author" do
      author1 = Fabricate(:author)
      author2 = Fabricate(:author)

      get :index
      expect(assigns(:authors)).to match_array([author1, author2])
    end
    it "render the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    let(:author) { Fabricate(:author) }
    it "finds the author with a given id and assigns it to @author" do
      
      get :show, id: author
      expect(assigns(:author)).to eq(author)
    end

    it "renders the show template" do
      
      get :show, id: author
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new author object to @author" do
      get :new
      expect(assigns(:author)).to be_instance_of(Author)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves the new author object" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(Author.count).to eq(1)
      end
      
      it "redirects to the show action" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(response).to redirect_to author_path(Author.first)
      end
      
      it "sets the 'success' flash message" do
      post :create, author: Fabricate.attributes_for(:author)
      expect(flash[:success]).to eq('Author has been created.')
      end
      
      context "an unsuccessful create" do
        it "does not save the new author object with valid inputs" do
          post :create, author: Fabricate.attributes_for(:author, first_name: nil)
          expect(Author.count).to eq(0)
        end

        it "renders the new template" do
          post :create, author: Fabricate.attributes_for(:author, first_name: nil)
          expect(response).to render_template :new
        end
        it "sets the 'failure' flash message" do
          post :create, author: Fabricate.attributes_for(:author, first_name: nil)
          expect(flash[:danger]).to eq('Author has not been created.')
        end
      end
    end 
  end
end

