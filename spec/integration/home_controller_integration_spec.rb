require 'spec_helper'
feature "HomeController", js: true do
  before :each do
    @user = FactoryGirl.create :user, :password => "FooBar12"
  end

  it "have currentUser set" do
    login_user @user
    sleep(0.5)
    page.evaluate_script("App.currentUser").should == @user.attributes.slice("id", "email").merge('card_id' => "")
  end
end
