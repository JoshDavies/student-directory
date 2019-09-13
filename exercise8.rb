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
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
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
  puts "name which cohort month to print"
  print_cohort = gets.chomp
  students.each_with_index do |student, index|
    if print_cohort == "#{student[:cohort]}"
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"   
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)