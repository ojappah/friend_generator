class FriendGenerator::CLI
  MALE_PATH = "http://www.fakenamegenerator.com/gen-male-us-us.php"
  FEMALE_PATH = "http://www.fakenamegenerator.com/gen-female-us-us.php"
  RANDOM_PATH = "https://www.fakenamegenerator.com/gen-random-us-us.php"
@@friends_array = []
@@make_male_friends = []
@@make_female_friends = []
@@make_random_friends = []
  def call
    friend_options
    make_male_friends
    make_female_friends
    make_random_friends
    friend_selection
    exit
  end

  def friend_options
    puts "Welcome to Friend Generator. What type of Friend are you looking for today?"
    puts <<-DOC.gsub /^\s*/, ''
    1. Male
    2. Female
    3. Random
    DOC
  end

  def make_male_friends
    @@make_male_friends << FriendGenerator::Friend.scrape_index_page(MALE_PATH)
  #  self.create_from_collection(@friends_array)
    @@friends_array << @@make_male_friends
  end

  def make_female_friends
    @@make_female_friends << FriendGenerator::Friend.scrape_index_page(FEMALE_PATH)
  #  self.create_from_collection(@friends_array)
  @@friends_array << @@make_female_friends
  end

def make_random_friends
  @@make_random_friends << FriendGenerator::Friend.scrape_index_page(RANDOM_PATH)
#  self.create_from_collection(@friends_array)
  @@friends_array << @@make_random_friends
end
  def friend_selection

    #@@friends_array.each do |friend|
    input = nil
    while input != "exit"
      puts "Please enter a number from the options above to generate a new friend or type my friends to see a list of your current friends. Type 'exit' to leave the app."
      input = gets.strip.downcase
      case input
        when "1"
          puts "Congratulations! You have a new friend name #{@@make_male_friends[0].name.upcase}. He is #{@@make_male_friends[0].age} years old. Type 'my friends' to see more details about your new friend."

        when "2"
          puts "Congratulations! You have a new friend name #{@@make_female_friends[0].name}. She is #{@@make_male_friends[0].age} years old. Type 'my friends' to see more details about your new friend."

        when "3"
          puts "Congratulations! You have a new random friend name #{@@make_male_friends[0].name.upcase}. Your friend is #{@@make_male_friends[0].age} years old. Type 'my friends' to see more details about your new friend."

        when "my friends"
          @@friends_array.flatten.each do |friends|
          puts "Here is the name of all your new friends #{friends.name.upcase}."
        end
        else
          puts "That is not a valid option. Please try again. Select from the options given below."
        friend_options
      end
        def exit
          puts "Thank you for using Friend Generator. Come back soon to make new friends."
        end
    end

end
end
