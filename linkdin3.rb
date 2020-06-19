=begin
#load in the webdriver gem to interect with selenium
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
driver.get "https://www.linkedin.com/login"


#Maximize the window
driver.manage.window.maximize
sleep 6
#driver.manage.timeouts.implicit_wait = 10

driver.find_element(:id,"username").send_keys ""
driver.find_element(:id,"password").send_keys ""
driver.find_element(:xpath,"//button[contains(text(),'Sign in')]").click
#driver.find_element(:xpath,"//button[text()='Sign in']").click

sleep 5
#element1=driver.find_element(:css,"//button[@data-control-name='share.sharebox_focus']")
#element1=driver.find_element(:xpath,"//button[text()='Start a post']")
driver.find_element(:xpath,"//button[contains(.,'Start a post')]").click
sleep 3
driver.find_element(:xpath,"//div[@class='ql-editor ql-blank']").click

driver.find_element(:xpath,"//div[@class='ql-editor ql-blank']").send_keys "I am Software engineer"

#driver.find_element(:xpath,"//button[contains(.,'Start a post')]").send_keys"hello everyone"

#click on post
driver.find_element(:xpath,"//span[text()='Post']").click
sleep 3
post1=driver.find_element(:xpath,"//span[contains(.,'Oops - this post has already been shared.')]")
driver.find_element(:id,"#ember491").click

if (post.displayed?)
  puts ("updated post:"+ post.text)
elsif(post1.displayed?)
  puts ("updated post"+ post1.text)
else
  puts"else blocked"
  driver.close

end
=end


#bhavano code
require 'selenium-webdriver'
require "test/unit/assertions"
include Test::Unit::Assertions
#driver = Selenium::WebDriver.for :Chrome.driver_path="C:\Ruby26-x64\bin\chromedriver.exe"

driver = Selenium::WebDriver.for :chrome
# use of explicit wait
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
def document_initialised(driver)
  driver.execute_script('return initialised')
end
begin
  #automate linked in site
  driver.get 'https://www.linkedin.com/'
  #driver will wait untill locator is not visible
  wait.until{|document_initialised| driver}
  search = driver.find_element(:css,"a[class='nav__button-secondary']").text
  # search = driver.find_element(:xpath,"(//input[@placeholder='Search job titles or companies'])[2]").text
  "Hello from JavaScript!".eql? search
  #implicit wait
  driver.manage.timeouts.implicit_wait = 20

  driver.manage.window.maximize
  # driver.find_element(:xpath,"(//input[@placeholder='Search job titles or companies'])[2]").click

  driver.find_element(:css,"a[class='nav__button-secondary']").click
  sleep(2)
  driver.find_element(:id,"username").send_keys("Manisha23.es@gmail.com")
  driver.find_element(:id,"password").send_keys("manisha@2345")
  sleep(3)
  driver.find_element(:xpath,"//button[contains(text(),'Sign in')]").click
  wait.until{|document_initialised| driver}
  search1 = driver.find_element(:xpath,"//button[@data-control-name='share.sharebox_focus']").text
  "Hello from JavaScript!".eql? search1

  driver.find_element(:xpath,"//button[@data-control-name='share.sharebox_focus']").click
  sleep(3)
  PostText="Hello Connection3"
  driver.find_element(:xpath,"//div[@aria-placeholder='What do you want to talk about?']").send_keys(PostText);
  sleep(5)

  driver.find_element(:xpath,"//div[@class='share-box-v2__actions share-actions mlA ember-view']").click
  # driver.find_element(:css,"button[id='ember600']").click
  sleep(15)
  # post line is left
  #
  Pst=driver.find_element(:css,"div[class='feed-shared-text__text-view feed-shared-text-view white-space-pre-wrap break-words ember-view']")
  PostedText=driver.find_element(:css,"div[class='feed-shared-text__text-view feed-shared-text-view white-space-pre-wrap break-words ember-view']").text
  # errormessage=driver.find_element(:xpath,"")
  if Pst.displayed?
    assert_equal(PostText,PostedText,"Text posted successfully")
    puts"Successfully Posted"
    # elsif errormessage.displayed?
  elsif(!Pst.displayed?)
    assert_not_equal(PostText,PostedText,"Posted text are not equal")
    puts"oops code is posted 2 time"
  else
    puts"else block"
  end


end



