require '../../src/Common/web_driver_utills'
require '../../src/PageObjects/profile_search_page'
require 'selenium-webdriver'

# Base Url i.e Home page
class LandingPage

  attr_reader :driver
  # To initialise driver and utills class at the time of the creation of the object.
  def initialize(driver)
    @driver = driver
    @utills = WebDriverUtils.new(@driver)
  end # End of method (initialize)

  # Locators present on the page.
  SEARCH_BOX        = { css: 'div[class="navbar-collapse d-none d-lg-flex"] input[placeholder="Find Freelancers"]'     }
  SEARCH_ICON       = {css: 'nav[class="navbar navbar-subnavigation navbar-fixed-top ng-scope"] span[class="glyphicon air-icon-search m-sm-left m-0-right"]'}

  # Type the search keyword into search box
  # @keyword : text to type in the search textbox.
  def typeFindFreelancerSearchBox(keyword)
    @utills.typeInTextbox(SEARCH_BOX, keyword )
  end # End of Method (typeFindFreelancerSearchBox)

  # Click on search icon
  def clickOnSearchIconForFindFreelancer()
    @utills.click(SEARCH_ICON)
    return ProfileSearchPage.new(@driver)
  end # End of Method (clickOnSearchIconForFindFreelancer)

end # End of Class