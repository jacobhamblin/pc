require "rails_helper"

RSpec.describe StoresController, :type => :controller do
  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "filters" do
    it "filters nothing when no names are supplied" do
      @controller = StoresController.new
      expect(@controller.send(:filter_stores, {names: [], model: Taco})).to eq([])
    end
  end
end
