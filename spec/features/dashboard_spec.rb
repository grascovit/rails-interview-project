require 'rails_helper'

feature 'Dashboard', type: :feature do
  scenario 'visitor can see the total number of users' do
    create_list(:user, 3)

    visit root_path

    expect(page).to have_content '3 User(s)'
  end

  scenario 'visitor can see the total number of questions' do
    create_list(:question, 3)

    visit root_path

    expect(page).to have_content '3 Question(s)'
  end

  scenario 'visitor can see the total number of answers' do
    create_list(:answer, 3)

    visit root_path

    expect(page).to have_content '3 Answer(s)'
  end

  scenario 'visitor can see the total number of API requests by tenants' do
    create(:tenant, requests_count: 2)
    create(:tenant, requests_count: 7)

    visit root_path

    expect(page).to have_content '9 API request(s) by 2 tenant(s)'
  end
end
