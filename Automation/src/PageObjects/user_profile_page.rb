require '../../src/Common/common_utils'

# User Profile page for more details
class UserProfilePage

  attr_reader :driver
  # To initialise driver and utills class at the time of the creation of the object.
  def initialize(driver)
    @driver = driver
    @utills = WebDriverUtils.new(@driver)
    @commonUtils = CommonUtils.new()
  end # End of method initialize(driver)

  # Locators present on the page.
  NAME        = { css: 'div#optimizely-header-container-default span[itemprop="name"]'     }
  TITLE = { css: 'span.fe-job-title'}
  ABOUT = { css: 'p[itemprop="description"]'}
  SKILLS = { css: 'div.o-profile-skills'}
  DEVICES = { xpath: '//label[text()=\'Devices\']/..'}

# Compare the profile name on search page and user profile page
  def verifyProfileNamePresent(nameExpected, keyword, counter)
    nameActual = @utills.getText(@utills.findElement(NAME))
    @commonUtils.matchText('Name',nameExpected,nameActual)
    keyword = keyword.gsub("-", "")
    keyword = keyword.gsub(" ", "")
    if (nameActual.downcase.include? (keyword.downcase))
     counter = counter + 1
    end
    return counter
  end # End of method verifyProfileNamePresent(nameExpected)

  # Compare the profile title on search page and user profile page
  def verifyProfileTitlePresent(titleExpected, keyword, counter)
    titleActual = @utills.getText(@utills.findElement(TITLE))
    @commonUtils.matchText('Title',titleExpected,titleActual)
    keyword = keyword.gsub("-", "")
    keyword = keyword.gsub(" ", "")
    if (titleActual.downcase.include? (keyword.downcase))
      counter = counter + 1
    end
    return counter
    end # End of method verifyProfileTitlePresent(titleExpected)

  # Compare the profile about section on search page and user profile page
  def verifyProfileAboutPresent(aboutExpected, keyword, counter)
    aboutActual = @utills.getText(@utills.findElement(ABOUT))
    aboutExpected= aboutExpected.gsub("...", "")
    aboutActual= aboutActual.gsub("\n", "")
    keyword = keyword.gsub("-", "")
    keyword = keyword.gsub(" ", "")
    @commonUtils.matchText('About',aboutExpected,aboutActual)
    if (aboutActual.downcase.include? (keyword.downcase))
      counter = counter + 1
    end
    return counter
  end # End of method verifyProfileAboutPresent(aboutExpected)

  # Compare the profile skills on search page and user profile page
  def verifyProfileSkillsPresent(skillsExpected, keyword, counter)
    if skillsExpected != ""
      skillsActual = @utills.getText(@utills.findElement(SKILLS))
      @commonUtils.matchText('Skills',skillsExpected,skillsActual)
      keyword = keyword.gsub("-", "")
      keyword = keyword.gsub(" ", "")
      if (skillsActual.downcase.include? (keyword.downcase))
        counter = counter + 1
      end
      # return counter
    end # End of if
    return counter
  end # End of method  def verifyProfileSkillsPresent(skillsExpected)

  # Compare the profile devices on search page and user profile page
  def verifyProfileDevicePresent(deviceExpected, keyword, counter)
    if deviceExpected != ''
      deviceActual = @utills.getText(@utills.findElement(DEVICES))
      @commonUtils.matchText('Device',deviceExpected,deviceActual)
      keyword = keyword.gsub("-", "")
      keyword = keyword.gsub(" ", "")
      if (deviceActual.downcase.include? (keyword.downcase))
        counter = counter + 1
      end
    end # End of if
    return counter
  end #End of method verifyProfileDevicePresent(deviceExpected)

end # End of Class