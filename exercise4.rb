def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return thrice"
  students = []
  name = gets.chomp
  puts "Now add their Date of Birth:"
  country_of_birth = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, cob: country_of_birth}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    puts "Now add their Date of Birth:"
    country_of_birth = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end
# Using a while method to print
def print(students)
  count = 0
  while count < students.length do
      puts "#{count +1}. #{students[0 + count][:name]} 
      (#{students[0 + count][:cohort]} cohort)
      (D.O.B: #{students[0 + count][:cob]})"
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)