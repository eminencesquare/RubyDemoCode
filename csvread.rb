require 'csv'


#read doc file
CSV.foreach('test.csv') do |row|
  puts row.inspect
end
