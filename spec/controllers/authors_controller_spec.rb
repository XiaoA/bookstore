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
end
