require 'spec_helper'

describe SkillsController do
  describe "create" do
    it "requires authentication" do
      post :create
      response.should redirect_to "/users/sign_in"

    end
    it "should create education" do
      user = FactoryGirl.create :user
      sign_in user
      expect{
        post :create, skill: {name: "name" }
      }.to change{Skill.count}.by(1)
      response.should be_success
    end
  end
end
