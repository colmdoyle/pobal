require 'rails_helper'

RSpec.describe GroupController, type: :controller do
  describe "GET show" do
    it "renders the show template" do
      group = FactoryGirl.create(:group)
      get :show, :id => group.id
      expect(response).to render_template("show")
    end
  end

end
