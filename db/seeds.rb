# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Level0.delete_all
Level1.delete_all
Level2.delete_all

first = Level0.create!(
	title: "about",
	overview: "all there is to know about us",
	description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia expedita molestias quam aspernatur iusto pariatur doloremque consequuntur facere obcaecati maxime. Enim, sed laudantium in atque itaque dicta aperiam vero omnis."
	)
some = Level0.create!(
	title: "Something",
	overview: "Something more",
	description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia expedita molestias quam aspernatur iusto pariatur doloremque consequuntur facere obcaecati maxime. Enim, sed laudantium in atque itaque dicta aperiam vero omnis."
	)
second = Level1.create!(
	title: "company",
	overview: "all about the company",
	description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia expedita molestias quam aspernatur iusto pariatur doloremque consequuntur facere obcaecati maxime. Enim, sed laudantium in atque itaque dicta aperiam vero omnis."
	)
third = Level2.create!(
	title: "the boss",
	overview: "interview with the chief in charge",
	description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia expedita molestias quam aspernatur iusto pariatur doloremque consequuntur facere obcaecati maxime. Enim, sed laudantium in atque itaque dicta aperiam vero omnis."
	)
dude = Level2.create!(
	title: "the Queen",
	level1_id: 5,
	overview: "interview with the queen in charge",
	description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia expedita molestias quam aspernatur iusto pariatur doloremque consequuntur facere obcaecati maxime. Enim, sed laudantium in atque itaque dicta aperiam vero omnis."
	)