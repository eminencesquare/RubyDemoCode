#load the web driver to interact with selenium 
require 'selenium-webdriver'
require "test/unit/assertions"
include Test::Unit::Assertions
#start the browser
driver = Selenium::WebDriver.for :chrome
# driver = Selenium::WebDriver.for :Chrome.driver_path="C:\Ruby26-x64\bin\chromedriver.exe"

#explicitly wait
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def document_initialised(driver)
  driver.execute_script('return initialised')
end
list = ["https://www.java.com/", "https://java.com/en/download/manual.jsp", "https://www.oracle.com/java/technologies/javase-downloads.html",
        "https://www.w3schools.com/java/java_intro.asp", "https://www.w3schools.com/java/", "https://en.wikipedia.org/wiki/Java_(programming_language)",
        "https://www.javatpoint.com/java-tutorial", "https://www.tutorialspoint.com/java/index.htm"]
# Navigate to url
driver.get 'https://www.google.com'

wait.until{|document_initialised| driver}
search_form = driver.find_element(:css,"input[name='q']").text
"Hello from JavaScript!".eql? search_form

#Maximize Chrome Browser
driver.manage.window.maximize

#explicitly wait 
driver.manage.timeouts.implicit_wait = 8

# Enter text into the  Chrome Browser
driver.find_element(:css,"input[name='q']").send_keys 'java'
sleep(3)

# driver.action.send_keys(:shift).perform
# driver.action.key_down(:shift).send_keys(:arrow_down).perform
# driver.action.send_keys(:return).perform

#Scroll up & down the page
driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
sleep(3)
driver.action.send_keys(:return).perform

# driver.action.key_down(:enter).key_up(:enter).perform
sleep(3)

# Using of a variable name element1 and store the all locator
element1=driver.find_element(:xpath,"(//div[@class='g']//h3)").text
puts"#{element1}"

# Starting of for loop
for i in 1..14

# Starting of scrolling loop
  for j in 1..5
    driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
  end

  # If condition is false here & not open
  if i==2 ||i==9 ||i==10
    next
  end

  #Using of a variable element and store the locator value using interpolation getting the link
  element=driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]")
  sleep(3)

  driver.action.move_to(element).perform
  sleep(3)

  #link element locator
  # driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]").click
  element.click
  sleep(3)

  # File lib/test/unit/assertions.rb, line 207

#def assert_equal(exp, act, msg = nil)
    #assert(driver.current_url == list) == True
  #end
  # Browser is back here
  driver.navigate.back
  sleep(3)

  # Browser Refresh
  driver.navigate.refresh
  sleep(3)

  #Increment of loop
  i+=1
  assert_equal(element1, element, msg = nil)
end

driver.close
