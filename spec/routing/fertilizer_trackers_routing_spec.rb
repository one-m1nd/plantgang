require "rails_helper"

RSpec.describe FertilizerTrackersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fertilizer_trackers").to route_to("fertilizer_trackers#index")
    end

    it "routes to #new" do
      expect(get: "/fertilizer_trackers/new").to route_to("fertilizer_trackers#new")
    end

    it "routes to #show" do
      expect(get: "/fertilizer_trackers/1").to route_to("fertilizer_trackers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/fertilizer_trackers/1/edit").to route_to("fertilizer_trackers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/fertilizer_trackers").to route_to("fertilizer_trackers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fertilizer_trackers/1").to route_to("fertilizer_trackers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fertilizer_trackers/1").to route_to("fertilizer_trackers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fertilizer_trackers/1").to route_to("fertilizer_trackers#destroy", id: "1")
    end
  end
end
