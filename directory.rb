def interactive_menu
  students = []
  loop do
    puts "1. Add students to evil register".center(75)
    puts "2. Show all the evil students".center(75)
    puts "9. Exit the EvIl app".center(75)
  
    selection = gets.chomp
    case selection 
      when "1"
        students = input_students
      when "2"
        print_header
        print_names(students)
        print_footer(students)
      when "9"
        exit 
      else
        puts "Incorrect input, please try again"
    end
  end 
end 
=begin
students = [
  {name: "Dr. Hannibal Lector", cohort: :november, age: 49}, 
  {name:  "Darth Vadar", cohort: :november, age: 35},
  {name:  "Nurse Ratched", cohort: :november, age: 12},
  {name:  "Michael Corleone", cohort: :november, age: 69},
  {name:  "Alex Delarge", cohort: :november, age: 72},
  {name:  "The Wicked witch of the south-west", cohort: :november, age: 152},
  {name:  "Terminator", cohort: :november, age: 1},
  {name:  "Freddy Krueger", cohort: :november, age: 45},
  {name:  "Joker", cohort: :november, age: 36},
  {name:  "Joffrey Baratheon", cohort:  :november, age: 2},
  {name:  "Norman Bates", cohort: :november, age: 29},
  {name: "Jason Vorhees", cohort: :november, age: 18},
  {name:  "Michael Myers", cohort: :november, age: 562} 
  ]
=end   
def print_header  
  puts "The students of villains academy".center(75)
  puts "--------------------------------".center(75)     
end

def print_names(names)
    names.each_with_index do |student,index|
      puts "[#{index + 1}]. #{student[:name]} (#{student[:age]}) (#{student[:cohort]} cohort)".center(75)
    end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(75)
end

def input_students
    puts "Please enter the names of new students, hit return and enter the age, then hit return and enter the cohort".center(75)
    puts "To finish press enter twice".center(75)
    
    students = []
    
    name = gets.chomp
    age = gets.chomp.to_i
    cohort = gets.chomp.to_sym
    while !name.empty? do
        students << {name: name, cohort: cohort, age: age}
        
        if students.count == 1
          puts "Now we have #{students.count} student".center(75)
          name = gets.chomp
          age = gets.chomp.to_i
          cohort = gets.chomp.to_sym
        else
          puts "Now we have #{students.count} students".center(75)
          name = gets.chomp
          age = gets.chomp.to_i
          cohort = gets.chomp.to_sym
        end 
    end 
    students
end 

#students = input_students

interactive_menu




