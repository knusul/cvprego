require 'spec_helper'

describe ContactTypesController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "show" do
    it "requires authentication" do
      contact_type = FactoryGirl.create :contact_type
      get :show, format: :json, id: contact_type
      response.should redirect_to "/users/sign_in.json"
    end
  end

  describe 'create' do
    it "success with valid params" do
      user = FactoryGirl.create :user
      sign_in user
      post :create, format: :json, id: user.card.id, contact_type: {name: "jakub"}
      response.should be_success
    end
  end
end
