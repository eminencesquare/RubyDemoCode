require 'csv'


#open csv file
CSV.open('test.csv','wb') do |csv|
  csv << ['stock',"Sales","Day"]
  csv << ['10','12','2']
  csv << ['11','13','15']
  csv << ['4','24','3']
  csv << ['23','24','35']

end
