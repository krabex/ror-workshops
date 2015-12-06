puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

students.each do |student|
  rand(1..3).times do
    deadline = Faker::Time.between(1.year.ago, 1.month.ago)
    paid = rand(1..2) == 1    
    
    student.student_payments << StudentPayment.create(
      payment_deadline: deadline,
      date_of_payment: (paid ? deadline - rand(1..15).days : nil),
      amount: (paid ? rand(50..100) : 0) 
    )
  end
end

puts "Seeds: done"
