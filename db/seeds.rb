puts "destroying old seeds!"
User.destroy_all
Algorithm.destroy_all
Session.destroy_all
Feedback.destroy_all

puts "creating users!"
user_1 = User.create(email: "testing@test.com", password:"password", first_name: "Bob", last_name: "The Builder", profession: "Builder", location: "Britain")
user_2 = User.create(email: "test@test.com", password:"password", first_name: "Richard", last_name: "Branson", profession: "CEO", location: "Britain")
user_3 = User.create(email: "testme@test.com", password:"password", first_name: "Ted", last_name: "Talk", profession: "Speaker", location: "USA")

puts "creating algorithms"
truncate_data = Algorithm.create(name:"Truncate Data", description: "This will remove random empty rows from dataset")

header_spaces = Algorithm.create(name:"Remove Header Spaces", description: "This will remove spaces out of the headers")

new_lines = Algorithm.create(name:"Remove New Lines from Cell", description: "This will remove new lines out of a cell")

over_under = Algorithm.create(name:"Redistribute Single Column of Data", description: "This will repeatedly move the 2nd row into a new 2nd column")

report_format = Algorithm.create(name:"Turn report into dataset", description: "This will rearrange your report into a dataset you can model from")

shared_column = Algorithm.create(name:"Split single column into multiple columns", description: "This will take what is in one column and split it out into seperate columns by a seperator")

symbols_around_data = Algorithm.create(name:"Remove Unwanted Symbols", description: "Data often gets messy by adding random symbols in the cells, this will remove all of that and just keep the text")

white_space_left_right = Algorithm.create(name:"Clear white spaces left/right", description: "If you have white space around the data in the columns, this will remove it")

puts "creating sessions!"

sesh_1 = Session.create(title: "my first session", user_id: user_1, algorithm_id: truncate_data)

sesh_2 = Session.create(title: "my second session", user_id: user_1, algorithm_id: symbols_around_data)

sesh_3 = Session.create(title: "my third session", user_id: user_1, algorithm_id: report_format)

sesh_4 = Session.create(title: "my fourth session", user_id: user_1, algorithm_id: new_lines)

puts "creating feedback!"

feed1 = Feedback.create(rating: 5, comments: "did a good job, thanks", session_id: sesh_1)

feed2 = Feedback.create(rating: 4, comments: "Almost there, thanks", session_id: sesh_2)

feed3 = Feedback.create(rating: 3, comments: "It did OK", session_id: sesh_3)

feed4 = Feedback.create(rating: 5, comments: "Nice!", session_id: sesh_4)

