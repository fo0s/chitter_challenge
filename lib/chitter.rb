class Chitter
  attr_reader :user, :message

  def post(message)
    @message = message
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO chitterdatabase (username, message) VALUES('Bart_the_fart', '#{message}')")
  end

end
