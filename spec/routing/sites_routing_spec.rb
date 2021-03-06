require "rails_helper"

RSpec.describe SitesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sites").to route_to("sites#index")
    end

    it "routes to #show" do
      expect(get: "/sites/1").to route_to("sites#show", id: "1")
    end

    # it "routes to #create" do
    #   expect(post: "/sites").to route_to("sites#create")
    # end

    # it "routes to #update via PUT" do
    #   expect(put: "/sites/1").to route_to("sites#update", id: "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(patch: "/sites/1").to route_to("sites#update", id: "1")
    # end

    # it "routes to #destroy" do
    #   expect(delete: "/sites/1").to route_to("sites#destroy", id: "1")
    # end
  end
end
