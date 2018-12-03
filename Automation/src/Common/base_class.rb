# Base class for performing base operations before running any suite.
class BaseClass

  # Initialize Browser and Call for invoke and By default firefox will be initialize
  def initializeBrowser(browserType)
    case browserType.downcase
    when 'chrome'  # For Chrome browser
      Selenium::WebDriver::Chrome.driver_path ="../../Drivers/Chrome/chromedriver.exe"
      @driver = Selenium::WebDriver.for :chrome
    when 'firefox'  # For Firefox browser
      Selenium::WebDriver::Firefox.driver_path ="../../Drivers/Firefox/geckodriver.exe"
      @driver = Selenium::WebDriver.for :firefox
    else # By default Firefox browser
      Selenium::WebDriver::Firefox.driver_path ="../../Drivers/Firefox/geckodriver.exe"
      @driver = Selenium::WebDriver.for :firefox
    end # End of the case
  end # End of Method (initializeBrowser)

  def closeBrowser
    @driver.close # Driver closed
  end # End of Method (closeDriver)

end # End of Class