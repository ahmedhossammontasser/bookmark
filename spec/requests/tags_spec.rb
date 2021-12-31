require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/tags", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Tag. As you add validations to Tag, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tag.create! valid_attributes
      get tags_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tag = Tag.create! valid_attributes
      get tag_url(tag), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Tag" do
        expect {
          post tags_url,
               params: { tag: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Tag, :count).by(1)
      end

      it "renders a JSON response with the new tag" do
        post tags_url,
             params: { tag: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tag" do
        expect {
          post tags_url,
               params: { tag: invalid_attributes }, as: :json
        }.to change(Tag, :count).by(0)
      end

      it "renders a JSON response with errors for the new tag" do
        post tags_url,
             params: { tag: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tag" do
        tag = Tag.create! valid_attributes
        patch tag_url(tag),
              params: { tag: new_attributes }, headers: valid_headers, as: :json
        tag.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the tag" do
        tag = Tag.create! valid_attributes
        patch tag_url(tag),
              params: { tag: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the tag" do
        tag = Tag.create! valid_attributes
        patch tag_url(tag),
              params: { tag: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  # describe "DELETE /destroy" do
  #   it "destroys the requested tag" do
  #     tag = Tag.create! valid_attributes
  #     expect {
  #       delete tag_url(tag), headers: valid_headers, as: :json
  #     }.to change(Tag, :count).by(-1)
  #   end
  # end
end
