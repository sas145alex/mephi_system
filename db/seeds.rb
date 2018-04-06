# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = Person.create([first_name: 'Персон1', last_name: 'Персонов1', second_name: 'Персонович1', birthday: Date.today(), passport: 'passport1'])
p2 = Person.create([first_name: 'Персон2', last_name: 'Персонов2', second_name: 'Персонович2', birthday: Date.today(), passport: 'passport2'])
p3 = Person.create([first_name: 'Персон3', last_name: 'Персонов3', second_name: 'Персонович3', birthday: Date.today(), passport: 'passport3'])
p4 = Person.create([first_name: 'Персон4', last_name: 'Персонов4', second_name: 'Персонович4', birthday: Date.today(), passport: 'passport4'])
p5 = Person.create([first_name: 'Персон5', last_name: 'Персонов5', second_name: 'Персонович5', birthday: Date.today(), passport: 'passport5'])


post1 = Post.create(code: 'code111', name: 'Начальник отдела автоматизации и механизации производственных процессов', manager: true)
post2 = Post.create(code: 'code222', name: 'Техник', manager: false)
post3 = Post.create(code: 'code333', name: 'Аналитик', manager: false)
post4 = Post.create(code: 'code444', name: 'Начальник отдела материально-технического снабжения', manager: true)
post5 = Post.create(code: 'code555', name: 'Инженер по подготовке производства', manager: false)

dep1 = Department.create(name: 'Отдел автоматизации и механизации производственных процессов', description: 'dep description1')
dep2 = Department.create(name: 'dep name2', description: 'dep description2', parent: dep1)
dep3 = Department.create(name: 'отдела материально-технического снабжения', description: 'dep description3', parent: dep1)
dep4 = Department.create(name: 'dep name4', description: 'dep description4', parent: dep3)
dep5 = Department.create(name: 'dep name5', description: 'dep description5', parent: dep3)

dep1.posts << post1 << post2
dep2.posts << post2 << post3
dep3.posts << post3 << post4

pd1 = PostDepartment.where(post_id: post1, department_id: dep1).first
pd2 = PostDepartment.where(post_id: post2, department_id: dep1).first
pd3 = PostDepartment.where(post_id: post2, department_id: dep2).first
pd4 = PostDepartment.where(post_id: post3, department_id: dep2).first
pd5 = PostDepartment.where(post_id: post4, department_id: dep3).first


# raise p1.inspect
# raise w1.inspect
w1 = Worker.create([contract_start_date: Time.now.to_date, contract_end_date: Time.now.to_date + 1000, status: 1, person: Person.find(1), post_department: pd1])
w2 = Worker.create([contract_start_date: Time.now.to_date, contract_end_date: Time.now.to_date + 1000, status: 1, person: Person.find(2), post_department: pd2])
w3 = Worker.create([contract_start_date: Time.now.to_date, contract_end_date: Time.now.to_date + 1000, status: 1, person: Person.find(3), post_department: pd3])
w4 = Worker.create([contract_start_date: Time.now.to_date, contract_end_date: Time.now.to_date + 1000, status: 1, person: Person.find(4), post_department: pd4])
w5 = Worker.create([contract_start_date: Time.now.to_date, contract_end_date: Time.now.to_date + 1000, status: 1, person: Person.find(5), post_department: pd5])


# direct1 = Direction.create(name: 'dir1', status: 1, receive_date: Date.new, nominated_date_end: Date.new, finish_date: Date.new)
# direct2 = Direction.create(name: 'dir2', status: 1, receive_date: Date.new, nominated_date_end: Date.new, finish_date: Date.new)
# direct3 = Direction.create(name: 'dir3', status: 1, receive_date: Date.new, nominated_date_end: Date.new, finish_date: Date.new)
# direct4 = Direction.create(name: 'dir4', status: 1, receive_date: Date.new, nominated_date_end: Date.new, finish_date: Date.new)
# direct5 = Direction.create(name: 'dir5', status: 1, receive_date: Date.new, nominated_date_end: Date.new, finish_date: Date.new)

# task1 = Task.create(description: 'desc1', status: 1, direction: direct1)
# task2 = Task.create(description: 'desc2', status: 1, direction: direct2)
# task3 = Task.create(description: 'desc3', status: 1, direction: direct3)
# task4 = Task.create(description: 'desc4', status: 1, direction: direct4)
# task5 = Task.create(description: 'desc5', status: 1, direction: direct5)


(12).times do |i|
  Direction.create(name: "Распоряжение #{i+1}", status: 1, receive_date: Time.now(), nominated_date_end: Time.now() )
end
