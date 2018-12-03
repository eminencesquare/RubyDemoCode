# Read the input file(InputData.txt) for Properties (browser, Url and Search keyword)
class ReadPropertyFile

# Read the file and store the desired information
def loadProperty
  property=[]
  filename = '..\..\InputData\InputData.txt'
  i=0
  fh = open filename # Open the file for reading the text

  # Read the content of file and stored in Property
  while (line = fh.gets)
    line = line.gsub("\n", "")
    propertyName=line.split("=").first
    propertyValue = line.split("=").last
    property[i] = {propertyName=>propertyValue}
    puts "\t" + line
    i=i+1
  end # End of while

   fh.close # Closing the file after reading
   return property
  end # End of Method (matchText)

end # End of Class