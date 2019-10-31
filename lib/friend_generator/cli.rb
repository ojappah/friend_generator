#controller
class FriendGenerator::CLI
  def call
    friend_options
    friend_selection
    #my_friends
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


def friend_selection
  input = nil
  while input != "exit"
    puts "Enter a number from the options above to generate a new friend or type my friends to see a list of your current friends. Type exit to leave the app."
    input = gets.strip.downcase
    case input
    when "1"
      puts "Congratulations! You have a new Male Friend. Type my friends to see details about your new friend."

    when "2"
      puts "Congratulations! You have a new Female Friend.Type my friends to see details about your new friend."

    when "3"
      puts "Congratulations! You have a new randomly generated Friend.Type my friends to see details about your new friend."

    when "my friends"
      puts "Here is a list of your new friends."
      #my_friends
    else
      puts "That is not a valid option. Please try again. Select from the options given below."

      friend_options
  end
end
end

def exit
  puts "Thank you for using Friend Generator. Come back soon to generate more friends."
end
end
