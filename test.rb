require 'mysql2'
require 'csv'

client = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => 'root')
CSV.foreach("test.csv") do |row|
  id = row[0]
  name = row[1]
  query = %Q{insert into test_ruby.personal values (#{id}, '#{name}')}
  client.query(query)
end

query = %q{select * from test_ruby.personal}
results = client.query(query)
results.each do |row|
  puts "--------------------"
  row.each do |key, value|
    puts "#{key} => #{value}"
  end
end