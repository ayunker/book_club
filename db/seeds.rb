# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

meet = Meeting.create(name: "April")

Book.create([
  {
    title: "The Fury",
    author: "Alex Michaelides",
    description: "it a book",
    meeting: meet
  },

  {
    title: "The Silent Patient",
    author: "Alex Michaelides",
    description: "it another book",
    votes: 0,
    meeting: meet
  }
])
