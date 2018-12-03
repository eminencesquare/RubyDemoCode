# Common Utilities contains common operations throughout the application.
class CommonUtils

  # Return the Random value between 0 to maximum value.
  # @maxValue : maximum value for the random value generation
  def getRandomValue(maxvalue)
    return rand(maxvalue)
  end # End of Method (getRandomValue)

  # Compare the text of expected and actual results.
  # @FieldName : field name for which comparision
  # @expectedText : expected text
  # @actualText : actual text
  def matchText(fieldName, expectedText, actualText)
    expectedText = expectedText.gsub(" ", "")
    expectedText = expectedText.gsub("-", "")
    actualText = actualText.gsub(" ", "")
    actualText = actualText.gsub("-", "")

    if (actualText.downcase.include? (expectedText.downcase))
      puts expectedText + ' is matched with ' + actualText
    else
      raise 'Expected profile '+fieldName+' is ' + expectedText + ' but found ' + actualText
    end
  end # End of Method (matchText)

end # End of Class