module DeviseMacros
  def login_user user
    visit '/'
    click_link "Sign-in"
    within "#login-form" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Sign in"
    end
  end
end
