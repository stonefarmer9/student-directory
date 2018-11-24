require "csv"
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chop)
  end 
end 

def print_header  
  puts "The students of villains academy".center(75)
  puts "--------------------------------".center(75)     
end

def print_names(array)
   
    array.each_with_index do |student, index|
      puts "[#{index + 1}]. #{student[:name]} (#{student[:age]}) (#{student[:cohort]} cohort)".center(75)
    end
end

def add_student_info(*names)
    @students << {name: @name, age: @age, cohort: @cohort}
end


def group_by_cohort(array)
  puts "Which Cohort do you wish to view?(Jan, Nov or Dec?)"
  cohort = STDIN.gets.chop
  array.select { |student| student[:cohort].to_s == cohort}
  
end 

def print_footer
  puts "Overall, we have #{@students.count} great students".center(75)
end

def input
  @name = STDIN.gets.chop
  @age = STDIN.gets.chop.to_i
  @cohort = STDIN.gets.chop.to_sym
end 

def input_students
    puts "Please enter the names of new students, hit return and enter the age, then hit return and enter the cohort".center(75)
    puts "To finish press enter thrice".center(75)
    
    input 
    #@name = STDIN.gets.chop
    #@age = STDIN.gets.chop.to_i
    #@cohort = STDIN.gets.chop.to_sym
    while !@name.empty? do
      if @cohort.to_s == ""
         @cohort = "UNKNOWN"
      end 
       add_student_info({name: @name, age: @age, cohort: @cohort})
        
        
        if @students.count == 1
          puts "Now we have #{@students.count} student".center(75)
          @name = STDIN.gets.chop
          @age = STDIN.gets.chop.to_i
          @cohort = STDIN.gets.chop.to_sym
        else
          puts "Now we have #{@students.count} students".center(75)
          @name = STDIN.gets.chop
          @age = STDIN.gets.chop.to_i
          @cohort = STDIN.gets.chop.to_sym
        end 
    end 
    
end 

def print_menu
    puts "1. Add students to evil register".center(75)
    puts "2. Show all the evil students".center(75)
    puts "3. Save the recent additions to file".center(75)
    puts "4. Load the current student file to the program".center(75)
    puts "5. Load specific cohort list".center(75)
    puts "9. Exit the EvIl app".center(75)
end 

def process(selection)
      case selection 
      when "1"
        puts "Adding students".center(75)
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
        when "5"
          puts "Fetching students"
          print_names(group_by_cohort(@students))
      when "9"
        puts "Catch you later".center(75)
        exit 
      else
        puts "Incorrect input, please try again"
      end
end 

def show_students
  print_header
  print_names(@students)
  print_footer
end 

def save_student_info
  choose_filename 
  #open the file
  @filename = open(@filename, "w")
  #now we need to iterate over our students convert them to a string to be comma separated
  @students.each do |student|
    student_info = [student[:name], student[:age], student[:cohort]]
    csv_line = student_info.join(",")
    @filename.puts csv_line
  end
end 
#Below is a parser - A translator from  CSV format to hash (layman terms)

def open_student_lists(*)
  choose_filename
  @filename = open(@filename)
  @filename.readlines.each do |line|
    @name, @age, @cohort = line.chop.split(",")
    add_student_info({name: @name, age: @age, cohort: @cohort})
  end
end

def try_to_load_students
  filename = ARGV.first
  if filename.nil?
    filename = 'students.csv'
  end 
  if File.exists?(filename)
    open_student_lists(filename)
    puts "Loaded #{@students.count} from #{filename}".center(75)
  else 
    puts "Sorry #{filename} does not exist".center(75)
    exit
  end 
end

def choose_filename
  puts "Which file would you like to use?"
  puts "If left blank, default will be students.csv"
  @filename = STDIN.gets.chomp
  if @filename == ""
    @filename = "students.csv"
  else
    @filename
  end
end

try_to_load_students

interactive_menu

