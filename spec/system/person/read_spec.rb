require 'rails_helper'

RSpec.describe 'read person', type: :system do
  # Person should not be created when first_name and last_name are left empty
  scenario 'existing person shown' do
    # 1 Visit Sign Up page
    visit sign_up_path

    # 2 Sign up by filling email field with valid email, password field with a password
    fill_in 'user[email]', with: 'test@email.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign Up'
    
    # 3 You should be taken to people page where message "User created." is displayed
    expect(page).to have_content("User created.")

    # 4 Click "Create New Person", fill in first and last names, click save
    click_button 'create-new-person'
    fill_in 'person[first_name]', with: 'TestFirst'
    fill_in 'person[last_name]', with: 'TestLast'
    click_button 'commit'

    # 5 Successful creation alert displayed
    expect(page).to have_content("Person was successfully created.")

    # 6 Check that a new person is created
    expect(Person.count).to eq(1)

    # 7 Sign Out 
    click_on 'Sign Out'

    # 8 Sign In to existing user account
    fill_in 'session[email]', with: 'test@email.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Sign In'
    
    # 9 DB is searched for people matching the user's id and displayed in person card
    expect(page).to have_content("TestFirst TestLast")
  end
end