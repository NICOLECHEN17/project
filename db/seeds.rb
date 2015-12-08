# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 # Create some users
    User.create(name:'jialu Chen', email:'jl@example.com', password: "secret", password_confirmation: "secret")
    User.create(name:'Eric Zhuang', email:'eric@example.com', password: "secret", password_confirmation: "secret")
    User.create(name:'Nicole Chen', email:'nicole@example.com', password: "secret", password_confirmation: "secret")

    # Associate some microposts with users
    user = User.find(1)
    user.microposts.create(content: "Ireland is a beautiful country..")
    user.microposts.create(content: "I like travelling..")
    user = User.find(2)
    user.microposts.create(content: "I want to share my travel notes..")
    user = User.find(3)
    user.microposts.create(content: "I like Waterford ....")

     # Add comments from users on microposts
    user = User.find(1)
    comment = Comment.new(:content => "Good.")
    comment.user = user
    comment.micropost = Micropost.find(3)
    comment.save

    comment = Comment.new(:content => "To Eric: Thank you.")
    comment.user = user
    comment.micropost = Micropost.find(2)
    comment.save

    comment = Comment.new(:content => "Me too.")
    comment.user = User.find(2)
    comment.micropost = Micropost.find(2)
    comment.save



    # Add Relationships

    user1=User.find(1)
    user2=User.find(2)
    user3=User.find(3)
    user1.follow(user2)
    user1.follow(user3)
    user2.follow(user1)
