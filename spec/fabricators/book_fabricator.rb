
Fabricator(:book) do
  title { Faker::Book.title }
  isbn { Faker::Code.isbn }
  description { Faker::Lorem.sentences(1) }
  published_at { Faker::Date.backward }
  publisher_id { Faker::Number.number(2) }
  page_count { Faker::Number.number(3) }
  price { Faker::Commerce.price }
  created_at { Faker::Date.backward }
  updated_at { Faker::Date.backward }
end
