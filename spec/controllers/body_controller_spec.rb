require 'rails_helper'

RSpec.describe BodyController, type: :controller do
  describe "GET show" do
    it "renders the show template" do
      body = FactoryGirl.create(:body)
      get :show, :id => body.id
      expect(response).to render_template("show")
    end
  end

end
