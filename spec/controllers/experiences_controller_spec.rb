require 'spec_helper'

describe ExperiencesController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "create" do
    it "requires authentication" do
      post :create
      response.should redirect_to "/users/sign_in"

    end

    it "should create experience" do
      user = FactoryGirl.create :user
      sign_in user
      expect{
        post :create, experience: {from_date: "from", to_date: "to", description: "desc"}, format: :json
      }.to change{Experience.count}.by(1)
      response.should be_success
    end
  end

end
