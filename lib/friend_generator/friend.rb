class FriendGenerator::Friend

  attr_accessor :name, :address, :phone, :birthday, :age
@@all = []
def initialize(name, address, phone, birthday, age)
  @name = name
  @address = address
  @phone = phone
  @birthday = birthday
  @age = age
end
@@all << self
def self.all
@@all
end


def get_male_page
  Nokogiri::HTML(open("http://www.fakenamegenerator.com/gen-male-us-us.php"))
end

def get_male_friend
  self.get_male_page.css("div.info.content")
end

def make_male_friends
    friend = self.new
    make_male_friends = []
    friend.name = friend.css('div.address.h3').text
    friend.address = friend.css('div.address.h3').text
    friend.phone = friend.css('div.extra > dl:nth-child(5) > dd').text
    friend.birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
    friend.age = friend.css('div.extra > dl:nth-child(9) > dd').text
    friends << make_male_friends
    friend
  end


def get_female_page
  Nokogiri::HTML(open("http://www.fakenamegenerator.com/gen-female-us-us.php"))
end

def get_female_friend
self.get_female_page.css("div.info.content")
end

def make_female_friends
  friend = self.new
  make_female_friends = []
  friend.name = friend.css('div.address.h3').text
  friend.address = friend.css('div.address.h3').text
  friend.phone = friend.css('div.extra > dl:nth-child(5) > dd').text
  friend.birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
  friend.age = friend.css('div.extra > dl:nth-child(9) > dd').text
  friends << make_female_friends
    friend
end

def get_random_page
  Nokogiri::HTML(open("https://www.fakenamegenerator.com/gen-random-us-us.php"))
end

def get_random_friend
self.get_random_page.css("div.info.content")
end

def make_random_friends
  friend = self.new
  make_random_friends = []
  friend.name = friend.css('div.address.h3').text
  friend.address = friend.css('div.address.h3').text
  friend.phone = friend.css('div.extra > dl:nth-child(5) > dd').text
  friend.birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
  friend.age = friend.css('div.extra > dl:nth-child(9) > dd').text
  friends << make_random_friends
  friend
  end



end
