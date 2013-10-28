require 'spec_helper'

feature "Sign in", js: true do
  pending "success" do
    visit '/'
    within ".jumbotron" do
      fill_in "user_email", with: "exampel@gmail.com"
      fill_in "user_password", with: "superpassword"
      fill_in "user_password_confirmation", with: "superpassword"
      click_button "Sign up"
    end
    page.should have_text('PERSONAL')
  end
end
