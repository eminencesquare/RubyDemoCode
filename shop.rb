# load in the webdriver gem to interect with selenium
require 'selenium-webdriver'
#setup chrome plugin
#driver = Selenium::WebDriver.for :Chrome.driver_path="C:\Ruby26-x64\bin\chromedriver.exe"
#this line will start the browser
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def document_initialised(driver)
  driver.execute_script('return initialised')
end
#Navigate to URl
driver.get "http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation"
#Maximize the window
driver.manage.window.maximize
sleep 6
driver.manage.timeouts.implicit_wait = 10

driver.find_element(:css,"a.login").click
#puts"enter email id"
email_id="manishagupta38@gmail.com"
email_id_criteria="valid"
paswrd_criteria="invalid"
paswrd="1234"
#puts"enter password"
#paswrd=gets.chomp
#driver.get'http://automationpractice.com/'
driver.find_element(:xpath,"//input[@name='email'][1]").send_keys(email_id)
driver.find_element(:id,"passwd").send_keys(paswrd)
sleep 3
driver.find_element(:css,"button[id='SubmitLogin']").click

#validation
if email_id.length()==0 && driver.find_element(:xpath,"//p[contains(text(),'There is 1 error')]").displayed?
  puts"you have not enter any email id "

elsif email_id_criteria=="invalid" && driver.find_element(:xpath,"//p[contains(text(),'There is 1 error')]").displayed?
  puts"you have enter invalid email address "
elsif email_id_criteria=="valid" && paswrd_criteria=="valid"
  puts"you have enter valid email and valid password "

elsif email_id_criteria=="valid" && paswrd.length()==0 && driver.find_element(:xpath,"(//p[contains(text(),'There is 1 error')])/following-sibling::*[1]").displayed?
  puts"you have enter valid email but blank/invalid password "

elsif paswrd.length()==0 && driver.find_element(:xpath,"(//p[contains(text(),'There is 1 error')])/following-sibling::*[1]").displayed?
  puts"you have entered valid email id and blank password"

elsif paswrd_criteria=="invalid" && paswrd.length()<5  && driver.find_element(:xpath,"(//p[contains(text(),'There is 1 error')])/following-sibling::*[1]").displayed?
 puts" test passed for invalid password and where length is less than 5 "

 elsif paswrd.length()>5 && paswrd_criteria=="invalid" && driver.find_element(:xpath,"(//p[contains(text(),'There is 1 error')])/following-sibling::*[1]").displayed?
   puts" you have enter invalid password where lenght is greater than 5"
else
  puts"test is failed"

  end

