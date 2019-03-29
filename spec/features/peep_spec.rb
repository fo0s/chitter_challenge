require 'spec_helper'

feature 'Save peep' do
  scenario 'saves a message' do
    visit('/')

    fill_in('message', with: 'Test message')
    click_button('submit')

    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM chitterdatabase;")

    expect(result.first["message"]).to include('Test message')
  end
end

# feature 'post_peep' do
#   scenario 'creates a message and displays it' do
#     visit('/')
#
#     fill_in('message', with: 'Test message')
#     click_button('submit')
#
#     expect(feed).to have_content 'Test message'
#   end
# end
