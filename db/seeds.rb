# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

default_config = {
  field: 'id',
  direction: 'asc'
}

User.create(
  name: 'User 1',
  email: 'user1@mail.com',
  password: '123456',
  config: default_config
)

4.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(
      min_length: 6,
      max_length: 20,
      mix_case: true,
      special_characters: true
    ),
    config: default_config
  )
end

20.times do
  Hashtag.create(name: Faker::ProgrammingLanguage.unique.name)
end

70.times do
  Note.create(
    title: Faker::Book.unique.title,
    body: Faker::Hipster.sentences.join(' '),
    user_id: User.all.sample.id
  )
end

15.times do
  Note.create(
    title: Faker::Book.unique.title,
    body: Faker::Hipster.sentences.join(' '),
    user_id: 1
  )
end

30.times do
  NoteHashtag.create(
    hashtag_id: Hashtag.all.sample.id,
    note_id: Note.all.sample.id
  )
end
