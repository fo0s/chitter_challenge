require 'chitter'
require 'pg'

describe Chitter do
  context '#post' do
    it 'saves a message' do
      chitter = Chitter.new
      chitter.post('Test message')
      expect(chitter.message).to eq 'Test message'
    end

    it 'saves to database' do
      chitter = Chitter.new
      chitter.post('Test message')

      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("SELECT * FROM chitterdatabase;")

      expect(result.first["message"]).to include('Test message')
    end

    it 'saves a message when submit is hit on site' do

    end
  end

end
