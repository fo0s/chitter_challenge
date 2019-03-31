require 'spec_helper'

 # As a Maker
 # So that I can let people know what I am doing
 # I want to post a message (peep) to chitter

feature 'Save peep' do
  scenario 'saves a message' do
    visit('/')

    fill_in('peep', with: 'Test message')
    click_button('peepsubmit')

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
