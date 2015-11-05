require 'rails_helper'

RSpec.describe BodyController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

  end

  describe "GET show" do
    it "renders the show template" do
      body = FactoryGirl.create(:body)
      get :show, :id => body.id
      expect(response).to render_template("show")
    end
  end

end
