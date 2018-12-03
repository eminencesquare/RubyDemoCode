require '../../src/Common/web_driver_utills'
require 'selenium-webdriver'

# Search result page
class ProfileSearchPage
  attr_reader :driver
  # To initialise driver and utills class at the time of the creation of the object.
  def initialize(driver)
    @driver = driver
    @utills = WebDriverUtils.new(@driver)
  end  # End of method (initialize)

  # Locators present on the page and local variables.
  KeywordFound=[]
  SEARCHITEMS        = { css: 'section.air-card-hover.air-card-hover-escape.air-card-hover_tile'}
  NAMEOFTHEFREELANCER = { css: 'div[class=\'m-0-top-bottom ellipsis\'] h4 a'}
  TITLEOFTHEFREELANCER = { css: 'h4[data-qa="tile_title"]'}
  SPECIALIZATIONOFTHEFREELANCER = { css: 'div[data-ng-if="::specializationLine"]'}
  ABOUTOFTHEFREELANCER = { css: 'div.d-none.d-lg-block p'}
  SKILLOFTHEFREELANCER = { css: 'a.o-tag-skill'}
  AGENCYMEMBER = {css: 'div.p-m-relevant-sm-md'}

  # Provide the list of searched profile related to keyboard
  def getAllFreelancersList
    @utills.waitForElementUtillVisibility(SEARCHITEMS)
   return  @utills.findElements(SEARCHITEMS)
  end # End of method (getAllFreelancersList)

  # Store the profile section result in the array of hashes
  # @items : array of hashes contains searched result
  def searchedItems(items)
    count1 = 1
   return items.map do |item|
      {
          name: item.find_element(NAMEOFTHEFREELANCER).text, # Name of the searched freelancer.
          title: item.find_element(TITLEOFTHEFREELANCER).text, # Title of the searched freelancer
          specialization:
           begin
             item.find_element(SPECIALIZATIONOFTHEFREELANCER).text
           rescue Selenium::WebDriver::Error::NoSuchElementError
             'none'
           end,# Specialization of the searched freelancer.
          about: item.find_element(ABOUTOFTHEFREELANCER).text,# About of the searched freelancer.
          skills:
           begin
             skillsItem = item.find_elements(SKILLOFTHEFREELANCER)
             txt =''
             skillsItem.map do |skillItem|
               txt = txt + skillItem.text
             end
             txt
           rescue Selenium::WebDriver::Error::NoSuchElementError
             ''
           end, # Skills of the searched freelancer.
          agencyMember:
            begin
              item.find_element(AGENCYMEMBER)
                'yes'
            rescue Selenium::WebDriver::Error::NoSuchElementError
                'no'
            end,# Agency member of the searched freelancer.
          devices:
             begin
               @driver.find_element(:xpath, '//section[@data-log-sublocation="search_results"]['+count1.to_s+']//strong[text()="Devices - "]/..').text
             rescue Selenium::WebDriver::Error::NoSuchElementError
               ''
             end, # devices of the searched freelancer.
        }

    end # End of hash
  end # End of Method (searchedItems)

  # Keyword Search and print the list of freelancer those contains the keyword and not
  # @itemHash : list of the searched result.
  # @keyword : text to search in the result hash.
  def printSearchedListContainsKeywordOrNot(itemHash,keyword)
    keywordNotFound = Array.new()
    countFound = 0 # count for found keyword in the item.
    countNotFound = 0 # count for not found keyword in the item.
    itemHash.map do |item|
  puts item # print the item .
    if (item[:name].downcase.include? (keyword.downcase))
      begin
        KeywordFound[countFound]={name: item[:name],Attribute: 'name'}
        countFound = countFound + 1
      end # check presence in the name.
    else
      if (item[:title].downcase.include? (keyword.downcase))
           begin
             KeywordFound[countFound]={name: item[:name],Attribute:'title'}
             countFound = countFound + 1
           end # check presence in the title.
      else
        if (item[:specialization].downcase.include? (keyword.downcase))
            begin
              KeywordFound[countFound]={name: item[:name],Attribute:'specialization'}
              countFound = countFound + 1
            end # check presence in the specialization.
      else
        if (item[:about].downcase.include? (keyword.downcase))
             begin
               KeywordFound[countFound]={name: item[:name],Attribute:'about'}
               countFound = countFound + 1
             end # check presence in the about.
      else
        if (item[:skills].downcase.include? (keyword.downcase))
             begin
               KeywordFound[countFound]={name: item[:name],Attribute:'skills'}
               countFound = countFound + 1
             end # check presence in the skills.
      else
        if (item[:devices].downcase.include? (keyword.downcase))
             begin
               KeywordFound[countFound]={name: item[:name],Attribute:'devices'}
               countFound = countFound + 1
             end # check presence in the devices.
      else
          begin
            keywordNotFound[countNotFound] = item[:name]
            countNotFound = countNotFound +1
          end # Not present, add into not found count.
        # end # (item[:platform].downcase.include? (keyword.downcase))
        end # (item[:devices].downcase.include? (keyword.downcase))
        end # (item[:skills].downcase.include? (keyword.downcase))
        end # (item[:about].downcase.include? (keyword.downcase))
        end # (item[:specialization].downcase.include? (keyword.downcase))
        end # (item[:title].downcase.include? (keyword.downcase))
    end # (item[:name].downcase.include? (keyword.downcase))
  end # printSearchedListContainsKeywordOrNot(itemHash,keyword)

    # Print the list of freelancer those having keyword in profile
    puts keyword + " keyword found in below freelancer in respective attribute : "
    for j in 0..countFound
      puts KeywordFound[j]
    end # End of for

    # Print the list of freelancer those not having keyword in profile
    puts keyword + " keyword not found in below freelancer in any attribute : "
    for i in 0..countNotFound
      puts keywordNotFound[i]
    end # End of for

  end  #End of method

  # Scroll into view the Profile of freelancer for performing operation
  def scrollProfileIntoView(items, itemNumber)
  if itemNumber >= 1
    element = items[(itemNumber-1)].find_element(TITLEOFTHEFREELANCER)
    @utills.scrollElementIntoView(element)
  end # End of IF
  end #End of Method scrollProfileIntoView(items, itemNumber)

  # Click on Freelancer Profile
  def clickUserProfile(items, itemNumber)
    items[itemNumber].find_element(NAMEOFTHEFREELANCER).click
    return  UserProfilePage.new(@driver)
  end #End of Method clickUserProfile(items, itemNumber)

  # Click on Freelancer with having company profile
  def clickCompanyProfile(items, itemNumber)
    items[itemNumber].find_element(NAMEOFTHEFREELANCER).click
    return  CompanyProfilePage.new(@driver)
  end #End of Method clickCompanyProfile(items, itemNumber)

end #End of Class