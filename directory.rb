

students = [
  "Dr. Hannibal Lector", 
  "Darth Vadar",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked witch of the south-west",
  "Terminator",
  "Freddy Krueger",
  "Joker",
  "Joffrey Baratheon",
  "Norman Bates",
  "Jason Vorhees",
  "Michael Myers" 
  ]
def print_header  
  puts "The students of villains academy"
  puts "--------------------------------"     
end

def print_names(names)
  names.each do |student|
    puts student
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

print_header
print_names(students)
print_footer(students)

