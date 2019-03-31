class ChitterUsers

  def initialize(fullname, username, email, password)
    @fullname = fullname
    @username = username
    @email = email
    @password = password
  end

  def add
    connection = PG.connect(dbname: 'chitter_users')
    connection.exec("INSERT INTO chitterusers (fullname, email, username, password) VALUES(#{@fullname}, #{@email}, #{@username}, #{@password})")
  end

  def check(username, password)
    connection = PG.connect(dbname: 'chitter_users')
    
  end

  def id(user)
  end

end
