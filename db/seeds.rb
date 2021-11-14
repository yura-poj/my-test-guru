# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: :category1 }, { title: :category2 }])
tests = Test.create([{ title: :test1, category_id: categories[0].id, author_id: 1 },
                     { title: :test1, level: 2, category_id: categories[1].id, author_id: 3 }])
questions = Question.create([{ body: :a, test_id: tests.first.id }, { body: :b, test_id: tests.second.id }])
user = User.create(email: '1@1')
answers = Answer.create([{ correct: true, user_id: user.id, question_id: questions.first.id, body: 'opa ganga style' },
                         { user_id: user.id, question_id: questions.first.id, body: 'oh man' }])
