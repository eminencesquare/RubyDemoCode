require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
# driver = Selenium::WebDriver.for :Chrome.driver_path="C:\Ruby26-x64\bin\chromedriver.exe"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def document_initialised(driver)
  driver.execute_script('return initialised')
end

# Navigate to url
driver.get 'https://pizzaonline.dominos.co.in/menu'
driver.manage.window.maximize

wait.until{|document_initialised| driver}
search = driver.find_element(:css,"span[class='rupee']").text
"Hello from JavaScript!".eql? search

i=1
for i in 1..15
  #get price of pizza
  price=driver.find_element(:xpath,"(//span[@class='rupee'])[#{i}]").text
  puts"the price of pizza #{i} is "+price
  sleep 2
  #get description of pizza
  description=driver.find_element(:xpath,"(//span[@class='itm-dsc__dscrptn'])[#{i}]").text
  puts"decription of pizza#{i} is "+description
  sleep 2
  #get size of pizza
  size=driver.find_element(:xpath,"(//div[@class='itm-dsc__actn__sz__dd-ttl'])[#{i}]").text
  puts"size of pizza#{i} is "+size
  sleep 2
  #get taste of pizza  
  crust=driver.find_element(:xpath,"(//div[@class='itm-dsc__actn__crst'])[#{i}]").text
  puts"taste of pizza#{i} is "+crust
  sleep 3
end


