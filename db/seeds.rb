puts "destroying old seeds!"
User.destroy_all
Algorithm.destroy_all
Task.destroy_all
Feedback.destroy_all

puts "creating users!"
user_1 = User.create(email: "testing@test.com", password:"password", first_name: "Bob", last_name: "The Builder", profession: "Builder", location: "Britain")
user_2 = User.create(email: "test@test.com", password:"password", first_name: "Richard", last_name: "Branson", profession: "CEO", location: "Britain")
user_3 = User.create(email: "testme@test.com", password:"password", first_name: "Ted", last_name: "Talk", profession: "Speaker", location: "USA")

puts "creating algorithms"

truncate_data = Algorithm.create(name:"Truncate Data", description: "This will remove random empty rows from dataset")

header_spaces = Algorithm.create(name:"Header Spaces", description: "The Header Spaces algorithm will remove white space out of your dataset headers - which is useful if you want to reload your csv file to a database.")

new_lines = Algorithm.create(name: "New Lines", description:"The New Lines algorithm will remove /n (alt enter) out of a cell. These new lines are often put in by people who don't know how to use Excel :)")

symbols_around_data = Algorithm.create(name: "Remove Symbols", description:"Data often gets messy with random symbols being added in cells. The Remove Symbols algorithm will remove all of that and just keep the letters of the alphabet and numbers (including decimal numbers).")

white_space_left_right = Algorithm.create(name:"White Space", description: "If you have white space (space bar action) around the data you want within the cells, the White Space algorithm will remove it from your dataset.")

blank_columns = Algorithm.create(name:"Blank Columns", description: "The Blank Columns algorithm will remove all the blank columns (pesky random extra columns) within your dataframe.")

over_under = Algorithm.create(name:"Over Under", description: "This will repeatedly move the 2nd row into a new 2nd column")

shared_column = Algorithm.create(name:"Shared Column", description: "The Shared Column algorithm will take what is nested in one column and split it out into seperate columns (if it is seperated by a comma).")


# puts "creating Tasks!"

# sesh_1 = Task.create(title: "my first Task", user_id: user_1, algorithm_id: truncate_data)

# sesh_2 = Task.create(title: "my second Task", user_id: user_1, algorithm_id: symbols_around_data)

# sesh_3 = Task.create(title: "my third Task", user_id: user_1, algorithm_id: report_format)

# sesh_4 = Task.create(title: "my fourth Task", user_id: user_1, algorithm_id: new_lines)

# puts "creating feedback!"

# feed1 = Feedback.create(rating: 5, comments: "did a good job, thanks", task_id: sesh_1)

# feed2 = Feedback.create(rating: 4, comments: "Almost there, thanks", task_id: sesh_2)

# feed3 = Feedback.create(rating: 3, comments: "It did OK", task_id: sesh_3)

# feed4 = Feedback.create(rating: 5, comments: "Nice!", task_id: sesh_4)

# filename1 = "data23"
# filename2 = "data93"
# filename3 = "data43"
# filename4 = "data83"
# filename5 = "data43"

# sesh_1 = Task.create(title: filename1, user_id: user_1, algorithm_id: truncate_data, input_file_size: 2345.0, submitted: true, file: filename1, downloaded: true)

# sesh_2 = Task.create(title: filename2, user_id: user_1, algorithm_id: blank_columns, input_file_size: 4356.0, submitted: true, file: filename2, downloaded: true)

# sesh_3 = Task.create(title: filename3, user_id: user_1, algorithm_id: symbols_around_data, input_file_size: 6587.0, submitted: true, file: filename3, downloaded: true)

# sesh_4 = Task.create(title: filename4, user_id: user_1, algorithm_id: header_spaces, input_file_size: 2222.0, submitted: true, file: filename4, downloaded: true)

# sesh_5 = Task.create(title: filename5, user_id: user_1, algorithm_id: truncate_data, input_file_size: 8975.0, submitted: true, file: filename5, downloaded: true)

 