class FriendGenerator::CLI
  def call
    friend_options
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
    @friends = FriendGenerator::Friend.all
  end


  def friend_selection
    input = nil
    while input != "exit"
      puts "Please enter a number from the options above to generate a new friend or type my friends to see a list of your current friends. Type 'exit' to leave the app."
      input = gets.strip.downcase
      case input
        when "1"
          puts "Congratulations! You have a new friend name #{male_friend[:name]}. He is #{male_friend[:age]} years old. Type 'my friends' to see more details about your new friend."
          male_friend
        when "2"
          puts "Congratulations! You have a new friend name #{female_friend[:name]}. She is #{female_friend[:age]} years old. Type 'my friends' to see more details about your new friend."
          female_friend
        when "3"
          puts "Congratulations! You have a new random friend name #{random_friend[:name]}. Your friend is #{random_friend[:age]} years old. Type 'my friends' to see more details about your new friend."

        when "my friends"
          puts "Here is a list of all your new friends."
          @@all
        when "exit"
          puts "Thank you for using Friend Generator. Come back soon to generate more friends."
        else
          puts "That is not a valid option. Please try again. Select from the options given below."
        friend_options
      end
    end
  end

end
