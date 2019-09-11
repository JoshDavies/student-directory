def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print(students)
  students.each_with_index do |student, index|
    # only print  students whose name begins with a specific letter
    if "#{student[:name]}".chars.shift == "D"
      # only print students whose name is shorter than 12 characters.  
      if "#{student[:name]}".length < 12
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)