# WebDriver utilities to perform basic operation related to driver
require '../../src/PageObjects/landing_page'

class WebDriverUtils

  attr_reader :driver

  # Initialize the driver
  # @driver: instance of selenium webdriver.
  def initialize(driver)
    @driver = driver
  end # End of method (initialize)

  # To find an element through the given locator
  # @locator: locator string consist of type of locator
  def findElement(locator)
    return driver.find_element(locator)
  end # End of method (findElement)

  # To find the elements, for multiple element
  # @locator: locator string consist of type of locator
  def findElements(locator)
    return driver.find_elements(locator)
  end # End of Method (findElements)

  # Delete browser cookies
  def deleteAllCookies
    driver.manage().delete_all_cookies
  end # End of Method deleteAllCookies

  # Desired URL to open
  # @urlToOpen: url to open on the browser.
  def openURL(urlToOpen)
    driver.get(urlToOpen)
    return LandingPage.new(@driver)
  end # End of method (openURL)

  # Wait for element to visible on the page
  # @locator: locator string consist of type of locator
  def waitForElementUtillVisibility(locator)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    return wait.until {
      driver.find_element(locator)
  }
  end # End of Method (waitForElementUtillVisibility)

  # Type the text into the text box
  # @locator: locator string consist of type of locator
  # @value: value to be typed in the textbox.
  def typeInTextbox(locator, value)
    element = waitForElementUtillVisibility(locator)
    element.send_key(value)
  end # End of method (typeInTextbox)

  # Performing the click option on locator
  # @locator: locator string consist of type of locator
  def click(locator)
    findElement(locator).click()
  end # End of method (click)

  # Provide count of the particular element
  # @element: element, to get count.
  def getNumberOfCount(element)
    element.count()
  end # End of method (getNumberOfCount)

  # Get the text at the element
  # @element: element, to get text.
  def getText(element)
    element.text
  end # end of method (getText)

  # Return the text if element present, return 'none' if element is not present.
  # @element: element, to get text of present.
  def ifPresentGetTextElseNoneText(element)
    begin
      return element.text
    rescue Selenium::WebDriver::Error::NoSuchElementError
      return 'none'
    end
  end # End of method (ifPresentGetTextElseNoneTexts)

  # Scroll the bar of window to view the element
  #  @element: element, to get into scroll.
  def scrollElementIntoView(element)
    driver.execute_script("arguments[0].scrollIntoView(true);", element )
  end # End of method (scrollElementIntoView)

end # End of Class