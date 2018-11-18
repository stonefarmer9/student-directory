

students = [
  {name: "Dr. Hannibal Lector", cohort: :november}, 
  {name:  "Darth Vadar", cohort: :november},
  {name:  "Nurse Ratched", cohort: :november},
  {name:  "Michael Corleone", cohort: :november},
  {name:  "Alex Delarge", cohort: :november},
  {name:  "The Wicked witch of the south-west", cohort: :november},
  {name:  "Terminator", cohort: :november},
  {name:  "Freddy Krueger", cohort: :november},
  {name:  "Joker", cohort: :november},
  {name:  "Joffrey Baratheon", cohort:  :november},
  {name:  "Norman Bates", cohort: :november},
  {name: "Jason Vorhees", cohort: :november},
  {name:  "Michael Myers", cohort: :november} 
  ]
def print_header  
  puts "The students of villains academy"
  puts "--------------------------------"     
end

def print_names(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
    puts "Please enter the names of new students"
    puts "To finish press enter twice"
    
    students = []
    
    name = gets.chomp
    
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end 
    students
end 
students = input_students

print_header
print_names(students)
print_footer(students)

