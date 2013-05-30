require 'spec_helper'

describe EducationsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "create" do
    it "requires authentication" do
      post :create
      response.should redirect_to "/users/sign_in"

    end
    it "should create education" do
      user = FactoryGirl.create :user
      sign_in user
      expect{
        post :create, education: {from_date: "from", to_date: "to", name: "name" }
      }.to change{Education.count}.by(1)
      response.should be_success
    end
  end

end
