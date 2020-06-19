lines = ["hey this is one line", "this is second linr", "this is 3 line"]

#Write the text file
f=File.new("./mywrite.txt","w")
Lines.each{ |line| f.puts(line) }
f.close

