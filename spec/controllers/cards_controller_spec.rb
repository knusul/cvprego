require 'spec_helper'

describe CardsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "show" do
    it "requires authentication" do
      card = FactoryGirl.create :card
      get :show, id: card
      response.should redirect_to "/users/sign_in"
    end
  end

  describe 'update' do
    it "accepts nested attributes for contact_type" do

      WIP
      user = FactoryGirl.create :user
      log_in user
      get :show, id: card, 
    end
  end
end
