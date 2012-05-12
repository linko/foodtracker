def sign_in_as_user(user = nil)
  user ||= FactoryGirl.create(:user)
  visit '/'
  fill_in "Email", with: user.email
  fill_in "Password", with: "password"
  click_button "Sign in"
end