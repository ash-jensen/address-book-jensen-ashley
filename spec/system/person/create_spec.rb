require 'rails_helper'

RSpec.describe 'create person', type: :system do
  # Person should not be created when first_name and last_name are left empty
  scenario 'first and last name present' do
    # 1 Visit Sign Up page
    visit sign_up_path

    # 2 Fill in email field with valid email, password field with a password
    fill_in 'user[email]', with: 'test@email.com'
    fill_in 'user[password]', with: 'password'

    # 3 Click Sign Up button
    click_button 'Sign Up'
    
    # 4 You should be taken to people page where message "User created." is displayed
    expect(page).to have_content("User created.")

    # 5 Click "Create New Person", fill in first and last names, click save
    click_button 'create-new-person'
    fill_in 'person[first_name]', with: 'TestFirst'
    fill_in 'person[last_name]', with: 'TestLast'
    click_button 'commit'

    # 6 Successful creation alert displayed
    expect(page).to have_content("Person was successfully created.")
    sleep 5

    # 7 Check that a new person is created
    expect(Person.count).to eq(1)
  end

  # Add test to check creates with required fields left blank
  # Add test to check creates with all fields left blank
  # Add test to check creates with incorrect date formatting
end