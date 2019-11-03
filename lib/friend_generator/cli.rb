class FriendGenerator::CLI
  MALE_PATH = "http://www.fakenamegenerator.com/gen-male-us-us.php"
  FEMALE_PATH = "http://www.fakenamegenerator.com/gen-female-us-us.php"
  RANDOM_PATH = "https://www.fakenamegenerator.com/gen-random-us-us.php"

  def call
    friend_options
    make_male_friends
    make_female_friends
    make_random_friends
    friend_selection
    display_friends
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
    @friends_array = FriendGenerator::Friend.scrape_index_page(MALE_PATH)
    self.create_from_collection(@friends_array)
  end

  def make_female_friends
  @friends_array = FriendGenerator::Friend.scrape_index_page(FEMALE_PATH)
  FriendGenerator::Friend.create_from_collection(@friends_array)
end

def make_random_friends
  @friends_array = FriendGenerator::Friend.scrape_index_page(RANDOM_PATH)
  FriendGenerator::Friend.create_from_collection(@friends_array)
end
  def friend_selection
    Friend.all.each do |friend|
    input = nil
    while input != "exit"
      puts "Please enter a number from the options above to generate a new friend or type my friends to see a list of your current friends. Type 'exit' to leave the app."
      input = gets.strip.downcase
      case input
        when "1"
          puts "Congratulations! You have a new friend name #{friend.name.upcase}. He is #{friend.age} years old. Type 'my friends' to see more details about your new friend."
            create
        when "2"
          puts "Congratulations! You have a new friend name #{friend.name.upcase}. She is #{friend.age} years old. Type 'my friends' to see more details about your new friend."

        when "3"
          puts "Congratulations! You have a new random friend name #{friend.name.upcase}. Your friend is #{friend.age} years old. Type 'my friends' to see more details about your new friend."

        when "my friends"
          puts "Here is a list of all your new friends."
          @@all
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
end
