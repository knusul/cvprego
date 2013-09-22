require 'spec_helper'

describe CardController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "show" do
    it "requires authentication" do
      card = FactoryGirl.create :card
      get :show, :ignored => 'current'
      response.should redirect_to "/users/sign_in"
    end
  end

  describe 'update' do
    it "success with valid params" do
      user = FactoryGirl.create :user
      card = user.card
      sign_in user
      put :update, format: :json, ignored: 'current', card: {  first_name: "jakub"}
      response.should be_success
      card.reload.first_name.should eq "jakub"
    end
  end
end