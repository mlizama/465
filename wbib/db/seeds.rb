# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


professors = Professor.create(
  [
    { first: 'Sally', last: 'Jones', university: 'Chico State'},
    { first: 'Fred', last: 'Smith', university: 'Chico State'}
  ]
)

ratings = Rating.create(
  [
    { course: 'PHYS 204B', comment: 'Difficult class, difficult instructor.  I should have taken the class years ago and gotten it out of the way', rating: 4, professor_id: professors[0].id},
    { course: 'PHYS 204B', comment: 'Easy class, easy instructor', rating: 78, professor_id: professors[0].id},
    { course: 'MATH 217', comment: 'Impossible instructor.  F#@king impossible!', rating: 0, professor_id: professors[1].id}
  ]
)
