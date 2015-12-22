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
Book.create!(title: "GNU Emacs for Developers", isbn: '10-0123456789', page_count: 360, price: 39.99, description: 'A book about the Emacs text editor', published_at: '2012-11-12', publisher_id: 1, book_cover: File.open(File.join(Rails.root, 'app/assets/images/emacs.jpg')))
Book.create!(title: "Becoming a Vim Master", isbn: "1112223334445", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 39.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "Database Design for Designers", isbn: "2223334445556", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 59.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "Learning Web Development", isbn: "3334445556667", description: "A great book for junior developers", published_at: "2015-12-22", publisher_id: 1, page_count: 309, price: 39.99, created_at: "2015-12-18 08:31:43", updated_at: "2015-12-18 08:31:43", book_cover: nil)

Book.create!(title: "Python Hacks", isbn: "4445556667778", description: "Learn how to use Python to control your computer, ...", published_at: "2015-08-03", publisher_id: 4, page_count: 193, price: 24.99, created_at: "2015-12-18 08:33:10", updated_at: "2015-12-18 08:33:10", book_cover: nil)

Book.create!(title: "Advanced Ruby Programming", isbn: "5556667778889", description: "A great book", published_at: "2015-03-02", publisher_id: 3, page_count: 100, price: 49.99, created_at: "2015-12-18 08:33:54", updated_at: "2015-12-18 08:33:54", book_cover: nil)

Book.create!(title: "CSS for Beginners", isbn: "6667778889990", description: "Whatever you want it to be.", published_at: "2012-04-08", publisher_id: 5, page_count: 400, price: 19.99, created_at: "2015-12-18 08:34:56", updated_at: "2015-12-18 08:34:56", book_cover: nil)

Book.create!(title: "HTML5 Canvas", isbn: "7778889990001", description: "A Great book for people who love to read.", published_at: "2015-07-13", publisher_id: 1, page_count: 100, price: 25.99, created_at: "2015-12-20 20:22:47", updated_at: "2015-12-20 20:22:47", book_cover: nil)

Book.create!(title: "Understanding Algorithms, Dude", isbn: "8889990001112", description: "Agatha Christie, John Lewis, Andrew Jackson", published_at: "2015-12-01", publisher_id: 1, page_count: 999, price: 69.99, created_at: "2015-12-20 22:19:10", updated_at: "2015-12-20 22:26:10", book_cover: nil)

Book.create!(title: "Andrew's Guide to Data Structures and OO Design", isbn: "9990001112223", description: "a great book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 62.99, created_at: "2015-12-21 05:06:49", updated_at: "2015-12-21 05:11:02", book_cover: nil)

Book.create!(title: "More Algorithms, Please", isbn: "0001112223334", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 52.99, created_at: "2015-12-21 06:11:30", updated_at: "2015-12-21 06:11:30", book_cover: nil)

Book.create!(title: "Advanced Rails Development Guidebook", isbn: "1112221112223", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 39.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "Web Development for Fun and Profit", isbn: "2223332223334", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 39.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "Advanced Rails Development Guidebook", isbn: "2223332223331", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 39.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "Technical Interview Tips for Junior Developers", isbn: "3333333333333", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 39.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "Lisp without Limits", isbn: "2223332267934", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 39.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "Go, Elixir, or Clojure?", isbn: "8813332223334", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 49.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)

Book.create!(title: "How to Build Computers", isbn: "8732094729123", description: "a book", published_at: "2015-12-06", publisher_id: 1, page_count: 100, price: 19.99, created_at: "2015-12-21 06:15:27", updated_at: "2015-12-21 06:15:27", book_cover: nil)
