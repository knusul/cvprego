require 'spec_helper'

describe CardController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'update' do
    it "requires authentication" do
      card = FactoryGirl.create :card
      get :update, :ignored => 'current'
      response.should redirect_to "/users/sign_in"
    end

    describe "authenticated user" do
      let ( :user ) { FactoryGirl.create :user}
      let ( :card ) { user.card}
      before :each do
        sign_in user
      end

      it "success with valid params" do
        put :update, format: :json, ignored: 'current', card: {  first_name: "jakub"}
        response.should be_success
        card.reload.first_name.should eq "jakub"
      end

      it "deals with nils in contact_types" do
        put :update, format: :json, ignored: 'current', card: {:firstname => "jakub"}
        response.should be_success
      end

      it "accepts attributes for contact_types" do
        phone = "phone"
        number = "3303"
        put :update, format: :json, ignored: 'current', card: { contact_types: [{:number => number, :name => phone}]}
        response.should be_success
        contact_type = card.reload.contact_types.first
        contact_type.number.should == number
        contact_type.name.should == phone
      end

      it "overwrites contact types" do
        phone = "phone"
        number = "3303"
        put :update, format: :json, ignored: 'current', card: { contact_types: [{:number => number, :name => phone}]}
        put :update, format: :json, ignored: 'current', card: { contact_types: [{:number => number, :name => phone}]}
        contact_type = card.reload.contact_types.length.should be 1
      end
    end
  end
end
