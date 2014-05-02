configure :development do   
  set :bind, '0.0.0.0'   
  set :port, 3000 

  ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'blackboard.db'
)

end

configure :production do
  # Database connection
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/blackboard')
 
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end