@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end 
end 

def print_header  
  puts "The students of villains academy".center(75)
  puts "--------------------------------".center(75)     
end

def print_names
    @students.each_with_index do |student,index|
      if student[:cohort][0] == "N"
      puts "[#{index + 1}]. #{student[:name]} (#{student[:age]}) (#{student[:cohort]} cohort)".center(75)
      end
    end 
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(75)
end

def input_students
    puts "Please enter the names of new students, hit return and enter the age, then hit return and enter the cohort".center(75)
    puts "To finish press enter thrice".center(75)
    name = STDIN.gets.chomp
    age = STDIN.gets.chomp.to_i
    cohort = STDIN.gets.chomp.to_sym
    while !name.empty? do
        @students << {name: name, cohort: cohort, age: age}
        
        if @students.count == 1
          puts "Now we have #{@students.count} student".center(75)
          name = STDIN.gets.chomp
          age = STDIN.gets.chomp.to_i
          cohort = STDIN.gets.chomp.to_sym
        else
          puts "Now we have #{@students.count} students".center(75)
          name = STDIN.gets.chomp
          age = STDIN.gets.chomp.to_i
          cohort = STDIN.gets.chomp.to_sym
        end 
    end 
    
end 

def print_menu
    puts "1. Add students to evil register".center(75)
    puts "2. Show all the evil students".center(75)
    puts "3. Save the recent additions to file".center(75)
    puts "4. Load the current student file to the program".center(75)
    puts "9. Exit the EvIl app".center(75)
end 

def process(selection)
      case selection 
      when "1"
        puts "Add students".center(75)
        input_students
      when "2"
        puts "Printing students".center(75)
       show_students
      when "3"
        save_student_info
        puts "Student data saved".center(75)
      when "4"
        puts "Opening list".center(75)
        open_student_lists
      when "9"
        puts "Catch you later".center(75)
        exit 
      else
        puts "Incorrect input, please try again"
      end
end 

def show_students
  print_header
  print_names
  print_footer
end 

def save_student_info
  #open the file
  file = File.open("students.csv", "w")
  #now we need to iterate over our students convert them to a string to be comma separated
  @students.each do |student|
    student_info = [student[:name], student[:age], student[:cohort]]
    csv_line = student_info.join(",")
    file.puts csv_line
  end 
  file.close
end 

def open_student_lists(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, age, cohort = line.chomp.split(",")
    @students << {name: name, age: age, cohort: cohort.to_sym}
  end 
  file.close
end

def try_to_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    open_student_lists(filename)
    puts "Loaded #{@students.count} from #{filename}".center(75)
  else 
    puts "Sorry #{filename} does not exist".center(75)
    exit
  end 
end 

try_to_load_students

interactive_menu




