

require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
# driver = Selenium::WebDriver.for :Chrome.driver_path="C:\Ruby26-x64\bin\chromedriver.exe"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)


def document_initialised(driver)
  driver.execute_script('return initialised')
end

# Navigate to url
driver.get 'https://www.indeed.co.in/jobs?q=java+developer&l=Pune%2C+Maharashtra'
driver.manage.window.maximize


wait.until{|document_initialised| driver}
search_form = driver.find_element(:xpath,"//a[@class='jobtitle turnstileLink ']").text
"Hello from JavaScript!".eql? search_form

#initialize value
i=1
#starting of loop
for i in 1..12

  # get title of company
  element1=driver.find_element(:xpath,"(//a[@class='jobtitle turnstileLink '])[#{i}]").text
  puts"the title of company #{i} is "+element1
  sleep 3
  # get name of company
  element2=driver.find_element(:xpath,"(//span[@class='company'])[#{i}]").text
  puts "the company name #{i} is "+element2
  # get the summary of company
  element3=driver.find_element(:xpath,"(//div[@class='summary'])[#{i}]").text
  puts "the summary is #{i} is "+element3
  puts"    "
  sleep 3
end
#click on next page
  driver.find_element(:xpath,"(//span[@class='pn'])[1]").click
   sleep 3

#starting of next page with new loop
for j in 1..13

  # get title of company
  element4=driver.find_element(:xpath,"(//a[@class='jobtitle turnstileLink '])[#{j}]").text
  puts"the title of company #{j} is "+element4
  sleep 3
  # get name of company
  element5=driver.find_element(:xpath,"(//span[@class='company'])[#{j}]").text
  puts "the company name #{j} is "+element5
  #element3=driver.find_element(:xpath,"(//div[@class='location accessible-contrast-color-location'])[#{i}]").text
  # get the summary of company
  element6=driver.find_element(:xpath,"(//div[@class='summary'])[#{j}]").text
  puts "the summary is #{j} is "+element6
  sleep 3
  puts"    "
end






