require "rails_helper"

RSpec.describe WatertrackersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/watertrackers").to route_to("watertrackers#index")
    end

    it "routes to #new" do
      expect(get: "/watertrackers/new").to route_to("watertrackers#new")
    end

    it "routes to #show" do
      expect(get: "/watertrackers/1").to route_to("watertrackers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/watertrackers/1/edit").to route_to("watertrackers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/watertrackers").to route_to("watertrackers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/watertrackers/1").to route_to("watertrackers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/watertrackers/1").to route_to("watertrackers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/watertrackers/1").to route_to("watertrackers#destroy", id: "1")
    end
  end
end
