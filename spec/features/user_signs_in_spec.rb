require 'rails_helper'

RSpec.feature 'User signs in' do
  scenario 'with valid credentials' do
    user = create :user

    visit new_user_session_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button I18n.t('views.messages.Log in')

    #expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_link I18n.t('views.messages.Sign Out')
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid credentials' do
    user = build :user

    visit new_user_session_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button I18n.t('views.messages.Log in')

    #expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link I18n.t('views.messages.Sign Out')
  end
end
