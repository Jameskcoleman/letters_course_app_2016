Fabricator(:letter) do
  title { Faker::Lorem.words(5).join(" ") }
  body { Faker::Lorem.paragraph(2) }
  assignment { Faker::Lorem.word }
end