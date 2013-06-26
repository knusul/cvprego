require 'spec_helper'

describe LanguagesController do
  describe "create" do
    it "requires authentication" do
      post :create
      response.should redirect_to "/users/sign_in"
    end

    it "should create education" do
      user = FactoryGirl.create :user
      sign_in user
      expect{
        post :create, language: {name: "english", level: 'intermediate' }, format: :json
      }.to change{Language.count}.by(1)
      response.should be_success
    end
  end
end
