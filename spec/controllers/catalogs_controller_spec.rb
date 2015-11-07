require 'rails_helper'

RSpec.describe CatalogsController, type: :controller do
  let(:book1) { Fabricate(:book) }
  let(:book2) { Fabricate(:book) }

  describe "GET #index" do
    it "returns a successful HTTP request status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:book) { Fabricate(:book) }
     
    it "returns a successful HTTP request status code" do

      expect(response).to have_http_status(:success)
    end
  end
end
