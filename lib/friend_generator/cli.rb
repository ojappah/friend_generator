#controller
class FriendGenerator::CLI
  def call
    friend_options
    friend_selection
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
puts "Enter a number from the options above to generate a new friend or type my friends to see a list of your current friends. Type exit to leave the app."
  input = nil
  input = gets.strip.downcase
end
end
