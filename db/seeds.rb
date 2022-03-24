# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create(email: 'admin@example.com', password: 'asdfgh', password_confirmation: 'asdfgh',
                     first_name: 'Elon', last_name: 'Mask', confirmed_at: 1.day.ago)
user = User.create(email: 'user@example.com', password: 'asdfgh', password_confirmation: 'asdfgh',
                   first_name: 'Elon', last_name: 'Mask', confirmed_at: 1.day.ago)

categories = Category.create([{ title: :category1 }, { title: :category2 }])
tests = Test.create([{ title: :test1, level: 2, category: categories[0], author: admin },
                     { title: :test2, level: 1, category: categories[1], author: admin },
                     { title: :tester, level: 2, category: categories[0], author: admin }])
questions = Question.create([{ body: :True?, test: tests.first },
                             { body: :False?, test: tests.first },
                             { body: 'True and false?', test: tests.first}])
Question.create([{ body: :True?, test: tests.third }, { body: :False?, test: tests.third },
                 { body: 'True and false?', test: tests.third}])
answers = Answer.create([
                          { correct: true, question: questions.first, body: :True },
                          { correct: false, question: questions.first, body: :False },
                          { correct: true, question: questions.second, body: :False},
                          { correct: false, question: questions.second, body: :True},
                          { correct: true, question: questions.third, body: :False},
                          { correct: true, question: questions.third, body: :True},
                          { correct: false, question: questions.third, body: :"I don't know"}
                        ])
Badge.create( [
                { title: 'one', action_type: :test, test: tests.first,
                  image_url: 'https://cdn.schoolstickers.com/products/en/819/102713-03.png' },
                { title: 'two', action_type: :level, test: tests.second,
                  image_url: 'https://cdn.schoolstickers.com/products/en/819/102713-03.png' },
                { title: 'three', action_type: :category, category: categories.second }
              ] )