class FriendGenerator::Friend

  attr_accessor :name, :address, :phone, :birthday, :age

  @@all = []

  def initialize(name, address,phone,birthday,age)
    @name = name
    @address = address
    @phone = phone
    @birthday = birthday
    @age = age
    @@all << self
  end

  def self.all
@@all
  end

  #def self.scrape_male_friends
  #  self.scrape_male.each do |male_friend|
  #    friend = Friend.new
  #    friend.name

  #end

  def self.scrape_female_friends
    self.scrape_female

  end

  def self.scrape_random_friends
    self.scrape_random

  end

  def scrape_male
    index_page = Nokogiri::HTML(open("http://www.fakenamegenerator.com/gen-male-us-us.php"))
    friends = []
    index_page.css("div.info.content").each do |data|
      data.css(".friend-data a").each do |friend|
        friend_name = friend.css('div.address.h3').text
        friend_address = friend.css('div.adr').text
        friend_phone = friend.css('div.extra > dl:nth-child(5) > dd').text
        friend_birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
        friend_age = friend.css('div.extra > dl:nth-child(9) > dd').text

        friends << {name: friend_name, address: friend_address, phone: friend_phone, birthday: friend_birthday, age: friend_age}
      end
    end

  def scrape_female
  index_page = Nokogiri::HTML(open("http://www.fakenamegenerator.com/gen-female-us-us.php"))
  friends = []
  index_page.css("div.info.content").each do |data|
    data.css(".friend-data a").each do |friend|
      friend_name = friend.css('div.address.h3').text
      friend_address = friend.css('div.adr').text
      friend_phone = friend.css('div.extra > dl:nth-child(5) > dd').text
      friend_birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
      friend_age = friend.css('div.extra > dl:nth-child(9) > dd').text

      friends << {name: friend_name, address: friend_address, phone: friend_phone, birthday: friend_birthday, age: friend_age}
    end
  end
  def scrape_random
  index_page = Nokogiri::HTML(open("https://www.fakenamegenerator.com/gen-random-us-us.php"))
  friends = []
  index_page.css("div.info.content").each do |data|
    data.css(".friend-data a").each do |friend|
      friend_name = friend.css('div.address.h3').text
      friend_address = friend.css('div.adr').text
      friend_phone = friend.css('div.extra > dl:nth-child(5) > dd').text
      friend_birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
      friend_age = friend.css('div.extra > dl:nth-child(9) > dd').text

      friends << {name: friend_name, address: friend_address, phone: friend_phone, birthday: friend_birthday, age: friend_age}
    end
  end

end
end
end
end
