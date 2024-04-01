# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# meet = Meeting.create(name: "April")
meet = Meeting.find_by(name: "April")

Book.create([
  {
    title: "The Fury",
    author: "Alex Michaelides",
    url: "https://www.goodreads.com/en/book/show/123206645",
    meeting: meet
  },

  {
    title: "The Silent Patient",
    author: "Alex Michaelides",
    url: "https://www.goodreads.com/book/show/40097951-the-silent-patient",
    meeting: meet
  }
])
