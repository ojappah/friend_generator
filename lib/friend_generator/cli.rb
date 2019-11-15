class FriendGenerator::CLI
  MALE_PATH = "http://www.fakenamegenerator.com/gen-male-us-us.php"
  FEMALE_PATH = "http://www.fakenamegenerator.com/gen-female-us-us.php"
  RANDOM_PATH = "https://www.fakenamegenerator.com/gen-random-us-us.php"
  @@friends_array = []

  def call
    menu
    create_friends
    friend_selection
  end

  def menu
    puts "Welcome to Friend Generator. Enter an option number from below to generate a new Friend or display current friends by typing 'friends'."
    puts <<-DOC.gsub /^\s*/, ''
    1. Option 1 - Create Male Friend
    2. Option 2 - Create Female Friend
    3. Option 3 - Create Random Friend
    DOC
  end

  def create_friends
      @@friends_array << FriendGenerator::Friend.scrape_index_page(MALE_PATH,"Male")
      @@friends_array << FriendGenerator::Friend.scrape_index_page(FEMALE_PATH, "Female")
      @@friends_array<< FriendGenerator::Friend.scrape_index_page(RANDOM_PATH, "Random")
  end

  def male_friends
male_friends
  end

  def female_friends
female_friends
  end

  def random_friends
random_friends
  end

  def friend_selection

    input = nil
    while input != "goodbye"
        puts  "Type 'friends' to see more details on all of your created friends. Type 'goodbye' to leave the app."
        input = gets.strip.downcase
        case input
            when "1"
                puts "Congratulations! You have a new friend name #{male_friends[0].name.upcase}. He was born on #{male_friends[0].birthday}. Type '4' to see more details about your male friend."

            when "2"
                puts "Congratulations! You have a new friend name #{female_friends[0].name}. She was born on #{female_friends[0].birthday}. Type '5' to see more details about your female friend."

            when "3"
                puts "Congratulations! You have a new randomly generated friend name #{random_friends[0].name.upcase}. Your new friend was born on #{random_friends[0].birthday}. Type '6' to see more details about your random friend."

            when "friends"
                @@friends_array.flatten.each do |friends|
                puts "Here you can find more details about your newly created friends."
                puts "Name:#{friends.name.upcase}, \nAddress:#{friends.address}\n Phone: #{friends.phone}, \n DOB: #{friends.birthday}, \n Age: #{friends.age}."
                end

            when "4"
                male_friends.flatten.each do |friends|
                puts "Here is a list of all your male friends."
                puts "Name:#{friends.name.upcase}, \nAddress:#{friends.address} \n Phone: #{friends.phone}, \n DOB: #{friends.birthday}, \n Age: #{friends.age}."
                end

            when "5"
                female_friends.flatten.each do |friends|
                puts "Here is a list of all your female friends."
                puts "Name:#{friends.name.upcase}, \nAddress:#{friends.address} \n Phone: #{friends.phone}, \n DOB: #{friends.birthday}, \n Age: #{friends.age}."
                end

            when "6"
                random_friends.flatten.each do |friends|
                puts "Here is a list of all your randomly created friends."
                puts "Name:#{friends.name.upcase}, \nAddress:#{friends.address} \n Phone: #{friends.phone}, \n DOB: #{friends.birthday}, \n Age: #{friends.age}."
                end

            when "goodbye"
                puts "Thank you for using Friend Generator. Come back soon to create new friends."
            else
                puts "That is not a valid option. Please try again. Select from the options given below."
                menu
            end
        end
    end
end
