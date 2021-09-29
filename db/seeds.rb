# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "exp1@exp.com", password: "123456")
User.create(email: "exp2@exp.com", password: "123456")
User.create(email: "exp3@exp.com", password: "123456")
User.create(email: "exp4@exp.com", password: "123456")

Stock.create(ticker: "AAPL",name: "Apple inc" )
Stock.create(ticker: "GOOG",name: "Google inc" )
Stock.create(ticker: "MSFT",name: "Microsoft inc" )
Stock.create(ticker: "AMZN",name: "Amazone inc" )
