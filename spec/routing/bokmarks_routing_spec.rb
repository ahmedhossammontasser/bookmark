require "rails_helper"

RSpec.describe BokmarksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bokmarks").to route_to("bokmarks#index")
    end

    it "routes to #show" do
      expect(get: "/bokmarks/1").to route_to("bokmarks#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bokmarks").to route_to("bokmarks#create")
    end

    # it "routes to #update via PUT" do
    #   expect(put: "/bokmarks/1").to route_to("bokmarks#update", id: "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(patch: "/bokmarks/1").to route_to("bokmarks#update", id: "1")
    # end

    it "routes to #destroy" do
      expect(delete: "/bokmarks/1").to route_to("bokmarks#destroy", id: "1")
    end
  end
end
