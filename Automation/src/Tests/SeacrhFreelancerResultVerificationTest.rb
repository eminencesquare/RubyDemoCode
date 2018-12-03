require 'selenium-webdriver'
require '../../src/Common/web_driver_utills'
require '../../src/PageObjects/landing_page'
require '../../src/PageObjects/profile_search_page'
require '../../src/Common/common_utils'
require '../../src/PageObjects/company_profile_page'
require '../../src/PageObjects/user_profile_page'
require '../../src/Common/read_property_file'
require '../../src/Common/base_class'

# Create object for reading the input file.
puts "Step 1 : Read the input file for properties"
  getProperties = ReadPropertyFile.new()

# Read the Input data and stored in inputdata variable ( browser type, url and keyword to search.)
puts "Step 2 : Found below properties before test"
  inputData = getProperties.loadProperty()

# Create object for baseclass.
  baseClass = BaseClass.new()

puts "Step 3 : Open Browser"
# Open the browser.
  @driver = baseClass.initializeBrowser(inputData[0]["browserName"])

# Object for utilities
  utills = WebDriverUtils.new(@driver)

# Object for common utilities
  commonUtils = CommonUtils.new()

puts "Step 4 : Delete Cookies of Browser"
# Delete all cookies of browser before performing any operations.
  utills.deleteAllCookies

puts "Step 5 : Open URL"
# Open the base URL
  landingPage = utills.openURL(inputData[1]["url"])

# keyword value from the input file
  keyword = inputData[2]["keyword"]

puts "Step 6 : Type the search keyword into the search text box, Verify freelancer is selected from dropdown"
# Type the text in searchbox with keyword
  landingPage.typeFindFreelancerSearchBox(keyword)

puts "Step 7 : Click on Search icon"
# Click on the search icon. now we redirected to the profile search page.
  profileSearchPage = landingPage.clickOnSearchIconForFindFreelancer()

puts "Step 8 : Search result list will be display"
# Get all freelancers list.
  items = profileSearchPage.getAllFreelancersList

puts "Step 9 : Store the attributes value that are displaying"
# Get all attributes for searched freelancers.
  items_hash = profileSearchPage.searchedItems(items)

puts "Step 10 : Make a list of freelancer name in which keyword is found or not in any attribute"
# Print the list of search result those contains keyword or not
  profileSearchPage.printSearchedListContainsKeywordOrNot(items_hash, keyword)

puts "Step 11 : Select random freelancer"
# Get the random value to click on random freelancer
  randomValue = commonUtils.getRandomValue(10)

puts "Step 12 : Click on selected freelancer"
# Scroll for profile into view to perform the click operation
  profileSearchPage.scrollProfileIntoView(items, randomValue)

puts "Step 13 : Verify the stored attributes of search result page matches with attributes at profile page"
# Find the selected profile is company/agency or Individual ones and perform the click operation.
  if items_hash[randomValue][:agencyMember].include? 'yes'
    begin
    companyProfilePage = profileSearchPage.clickCompanyProfile(items, randomValue)
    # Verify the stored attributes values are correct with at user profile page and also search
    # the keyword at user profile page
    counter = 0
    counter = companyProfilePage.verifyProfileNamePresent(items_hash[randomValue][:name],keyword, counter)
    counter = companyProfilePage.verifyProfileTitlePresent(items_hash[randomValue][:title],keyword, counter)
    counter = companyProfilePage.verifyProfileAboutPresent(items_hash[randomValue][:about],keyword, counter)
    counter = companyProfilePage.verifyProfileSkillsPresent(items_hash[randomValue][:skills],keyword, counter)

    puts "Step 14 : Verify the keyword is contains in any of the attribute at profile page"
    if(counter >= 1)
      puts "\t Searched "+keyword+" found in attribute"
    else
      raise "\t Searched "+keyword+" is not found in any attribute"
    end
end
  else # Perform the operation if profile page is user profile page
    userProfilePage = profileSearchPage.clickUserProfile(items, randomValue)
  # Verify the stored attributes values are correct with at user profile page and also search
  # the keyword at user profile page
  counter = 0
    counter = userProfilePage.verifyProfileNamePresent(items_hash[randomValue][:name],keyword, counter)
    counter = userProfilePage.verifyProfileTitlePresent(items_hash[randomValue][:title],keyword, counter)
    counter = userProfilePage.verifyProfileAboutPresent(items_hash[randomValue][:about],keyword, counter)
    counter = userProfilePage.verifyProfileSkillsPresent(items_hash[randomValue][:skills],keyword, counter)
    counter = userProfilePage.verifyProfileDevicePresent(items_hash[randomValue][:devices],keyword, counter)

    puts "Step 14 : Verify the keyword is contains in any of the attribute at profile page"
    if(counter >= 1)
      puts "\t Searched "+keyword+" found in attribute"
    else
      raise "\t Searched "+keyword+" is not found in any attribute"
    end

  end # End of If (items_hash[randomValue][:agencyMember].include? 'yes')

puts "Step 15 : Close the browser"
#close the driver.
baseClass.closeDriver
