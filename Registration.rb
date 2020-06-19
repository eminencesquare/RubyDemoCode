# load in the webdriver gem to interect with selenium
require 'selenium-webdriver'
#setup chrome plugin
#driver = Selenium::WebDriver.for :Chrome.driver_path="C:\Ruby26-x64\bin\chromedriver.exe"
#this line will start the browser
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 20 )

def document_initialised(driver)
  driver.execute_script('return initialised')
end

#Navigate to URl
driver.get "http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation"
#Maximize the window
driver.manage.window.maximize
sleep 5
driver.action.key_down(:return).perform
element1=driver.find_element(:id,"email_create").send_keys"manisha2311@gmail.com"
driver.action.key_down(:enter).perform
driver.find_element(:id,"SubmitCreate").click
#element2.click

driver.find_element(:id,"id_gender2").click
#else
# title="Mrs"
# driver.find_element(:css,"#id_gender1").click
sleep 4
driver.find_element(:id,"customer_firstname").send_keys "Manisha"
driver.find_element(:id,"customer_lastname").send_keys "Gupta"
sleep 5
 driver.find_element(:id, "email").send_keys("manisha4567@gmail.com")
  driver.find_element(:id, "passwd").send_keys("123456")
  driver.find_element(:css, "select[id='days']").click
  driver.find_element(:css, "select[id='days']").send_keys("1")
  driver.find_element(:css, "select[id='months']").click
  driver.find_element(:css, "select[id='months']").send_keys("december")
  driver.find_element(:css, "select[id='years']").click
  driver.find_element(:css, "select[id='years']").send_keys("1981")
  driver.find_element(:id, "newsletter").click
  driver.find_element(:id, "firstname").send_keys("")
  driver.find_element(:id, "lastname").send_keys("")
  driver.find_element(:id, "company").send_keys("EminenceSquareI")
  driver.find_element(:name, "address1").send_keys("Scheme number 78")
  driver.find_element(:name, "address2").send_keys("Vijay nagar 78")
  driver.find_element(:id, "city").send_keys("hyderabad")
  driver.find_element(:css, "select[id='id_state']").click
  driver.find_element(:css, "select[id='id_state']").send_keys("indiana")
  driver.find_element(:id, "postcode").send_keys("00002")
  driver.find_element(:css, "select[id='id_country']").click
  driver.find_element(:css, "select[id='id_country']").send_keys("united states")
  driver.find_element(:id, "other").send_keys("hello i am here")
  driver.find_element(:id, "phone").send_keys("90987654321")
  driver.find_element(:name, "phone_mobile").send_keys("98907654321")
  driver.find_element(:id, "alias").send_keys("L.I.G")
  driver.find_element(:xpath, "//button[@name='submitAccount']").click
  # Check that the checkbox exists
   elementb = wait.until {
    element = driver.find_element(:xpath, "//span[contains(text(),'Order history and details')]")
    element if element.displayed?
  }
  puts "Test Passed: The element is displayed/exists"
  elementb.click
  sleep(5)
end
