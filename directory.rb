@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"  
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      print_students
    when "3"
      save_students
    when "4"
      choose_load_file
    when "9"
      exit
    else
      puts "Command unknown, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  input_info(name)
  spacer
end

def input_info(name)
  while !name.empty? do
    puts "Now enter their cohort"
    cohort = STDIN.gets.chomp
    add_students(name, cohort)
    students_count
    name = STDIN.gets.chomp
  end
end

def students_count
  puts "#{@students.count} students in Total"
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_students
  puts "The students of Villains Academy"
  spacer
  print_students_list
  spacer
  students_count
  spacer
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def save_students
  puts "Name the file to save to"
  choose_save_file(STDIN.gets.chomp)
end

def choose_save_file(filename = "students.csv")
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Students saved to #{filename}"
end

def choose_load_file
  puts "Name file to load from"
  filename = STDIN.gets.chomp
  auto_load_students(filename)
end

def auto_load_students(filename = "students.csv")
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename)
  else 
    puts "Sorry, #{filename} does not exist."
    exit 
  end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_students(name, cohort)
    end
  end
  puts "Loaded #{@students.count} from #{filename}"
  spacer
end

def spacer
  puts "-----------".center(30)
end

auto_load_students
interactive_menu