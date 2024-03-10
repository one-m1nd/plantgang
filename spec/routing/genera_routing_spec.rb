require "rails_helper"

RSpec.describe GeneraController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/genera").to route_to("genera#index")
    end

    it "routes to #new" do
      expect(get: "/genera/new").to route_to("genera#new")
    end

    it "routes to #show" do
      expect(get: "/genera/1").to route_to("genera#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/genera/1/edit").to route_to("genera#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/genera").to route_to("genera#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/genera/1").to route_to("genera#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/genera/1").to route_to("genera#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/genera/1").to route_to("genera#destroy", id: "1")
    end
  end
end
