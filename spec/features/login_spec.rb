require 'rails_helper'

feature 'Sign in' do
  let(:user) { FactoryGirl.create(:user) }
  def fill_in_sign_in_fields
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'visiting the logon screen and logon' do
    visit '/'
    click_link "Sign in"
    fill_in_sign_in_fields
  end
end
