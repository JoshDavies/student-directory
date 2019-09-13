def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return thrice"
  students = []
  name = gets.chomp
  puts "Now add their Cohort month"
  cohort_input = gets.chomp
  while !name.empty? do
    cohort = cohort_input.to_sym
    puts "Is the above infomation correct?"
    typo_check = gets.chomp
    if typo_check == "yes"
      students << {name: name, cohort: cohort}
    end
    puts "Now we have #{students.count} students"
    name = gets.chomp
    puts "Now add their Cohort month"
    cohort_input = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)