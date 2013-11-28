Given(/^a user is on the sign in page$/) do
  visit signin_path
end

When(/^he submits invalid sign in information$/) do
  click_button "Sign in"
end

Then(/^he should see an error message$/) do
  page.should have_selector("div.alert.alert-error")
end

And(/^the user has an account$/) do
  @user = User.create(name: 'example', email: 'example@aol.com',
                      password: 'foobar', password_confirmation: 'foobar')
end

And(/^the user submit valid sign in information$/) do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then(/^he should be on his profile page$/) do
  page.should have_selector("title", text: @user.name)
end

And(/^he should see a sign out link$/) do
  page.should have_link("Sign out", href: signout_path)
end
