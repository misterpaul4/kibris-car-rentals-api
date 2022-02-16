require "rails_helper"

RSpec.describe WaitingListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/waiting_lists").to route_to("waiting_lists#index")
    end

    it "routes to #show" do
      expect(get: "/waiting_lists/1").to route_to("waiting_lists#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/waiting_lists").to route_to("waiting_lists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/waiting_lists/1").to route_to("waiting_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/waiting_lists/1").to route_to("waiting_lists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/waiting_lists/1").to route_to("waiting_lists#destroy", id: "1")
    end
  end
end
