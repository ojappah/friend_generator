class FriendGenerator::Friend
attr_accessor :name, :address, :phone, :birthday, :age, :url

  def self.Friend
    @friend = []
    @male_friend = self.new
    @name = name
    @address = address
    @phone = phone
    @birthday = birthday
    @age = age
    url = "https://www.fakenamegenerator.com/gen-male-us-us.php"


    @female_friend = self.new
    @name = name
    @address = address
    @phone = phone
    @birthday = birthday
    @age = age
    url = "https://www.fakenamegenerator.com/gen-female-us-us.php"

    @friend = []
    @random_friend = self.new
    @name = name
    @address = address
    @phone = phone
    @birthday = birthday
    @age = age
    url = "https://www.fakenamegenerator.com/gen-random-us-us.php"


  end
end
