require 'spec_helper'

describe SkillsController do
  describe "create" do
    it "requires authentication" do
      post :create
      response.should redirect_to "/users/sign_in"

    end
    
    describe "create" do
      it "should create education" do
        user = FactoryGirl.create :user
        sign_in user
        expect{
          post :create, skill: {name: "name" }, format: :json
        }.to change{Skill.count}.by(1)
        response.should be_success
        user.reload.skills.count.should be 1
      end
    end
  end
end
