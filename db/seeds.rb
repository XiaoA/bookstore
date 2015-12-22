# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(first_name: 'Agatha', last_name: 'Christie')
Author.create!(first_name: 'Ernest', last_name: 'Hemingway')
Author.create!(first_name: 'Herman', last_name: 'Melville')
Author.create!(first_name: 'Ki no', last_name: 'Tsurayuki')
Author.create!(first_name: 'William', last_name: 'Shakespeare')
Author.create!(first_name: 'Maya', last_name: 'Angelou')

Publisher.create!([
                    {name: 'Wiley'},
                    {name: 'HarperCollins'},
                    {name: 'Cambridge University Press'},
                    {name: 'City Lights Publishers'},
                    {name: 'Faber and Faber'},
                    {name: 'Macmillan Publishers'}
                  ])
Book.create!(title: "GNU Emacs for Developers", isbn: '1000-123456789', page_count: 360, price: 39.99, description: 'A book about the Emacs text editor', published_at: '2012-11-12', publisher_id: 1, book_cover: File.open(File.join(Rails.root, 'app/assets/images/emacs.jpg')))
