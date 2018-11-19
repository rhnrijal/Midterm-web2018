Given("I am an admin") do
  @admin= FactoryBot.create :admin
  end

Given("there is an ordinary user") do
  @user = FactoryBot.create :user
end

Given("I am logged in") do
  visit '/users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end

Given("I want to add an account owned by the user") do
  @account = FactoryBot.build :account
  @account.owners = [ @user ]
end

When("I visit the accounts page") do
  visit '/accounts'

end

Then("I should see a {string} link") do |string|
  expect(page).to have_link(string)
end

When("I click the {string} link") do |string|
  click_link string
end

Then("I should see a new account form") do
  expect(page).to have_css('form input#account_number')
end

When("I fill in the account data") do
  fill_in 'Number', with: @account.number
  fill_in 'Balance', with: @account.balance
  #page.find('a.add_fields').click()
  #page.find('select').select(@account.owners[0].email)
  click_button 'Create Account'
end

Then("I should see the new account") do
  #expect(page).to have_content(@account.number)
  #expect(page).to have_content(@account.balance)
  expect(page).to have_content "Account was successfully created"
end

Then("I should see that it is owned by the user") do
  expect(page).to have_content(@account.owners[0].email)
end
