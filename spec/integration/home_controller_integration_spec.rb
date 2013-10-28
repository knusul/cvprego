require 'spec_helper'
feature "HomeController", js: true do
  before :each do
    @user = FactoryGirl.create :user, :password => "FooBar12"
  end

  pending "have currentUser set" do
    login_user @user
    page.should have_content "Add Experience"
    page.evaluate_script("App.currentUser").should == @user.attributes.slice("id", "email").merge('card_id' => @user.card.id)
  end
end
