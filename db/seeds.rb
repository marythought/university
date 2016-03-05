# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = %w(Aaron Beth Cathy Darius Eliza Fiona Gertrude Heidi Lauren Mary Norie Opal Priscilla Queen Reba Sharon Tim Viola Yvonne Zelda)
majors = %w(English CS math music engineering informatics)

def gpa
  rand(5).to_s
end

100.times do
  Student.create(name: names.sample, major: majors.sample, gpa: gpa)
end
