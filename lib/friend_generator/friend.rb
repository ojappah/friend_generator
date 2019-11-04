class FriendGenerator::Friend

@@all = []

  attr_accessor :name, :address, :phone, :birthday, :age


def initialize(name, address, phone, birthday, age)
  #  FriendGenerator::Friend.all.each do |object|
    @name = name
    @address = address
    @phone = phone
    @birthday = birthday
    @age = age

#self.all.split("\n").each do |name, address,phone,birthday,age|
#friend_hash.split("\n").each_with_index do |attribute, value|
#self.send"#{attribute}=", value
@@all << self
end

public
#def create_from_collection(friends_array)
  #friends_array.each do |friend_hash|
#    FriendGenerator::Friend.new(friends_array)
#  end

def self.all
  @@all
end
public
def self.scrape_index_page(index_page)
  friends_array = []
    index_page = Nokogiri::HTML(open(index_page))
    friend = index_page.css("div.info .content")
    friend.css(".friend-data a")
        name = friend.css('div.address > h3').text
        address = friend.css('div.adr').text
        phone = friend.css('div.extra > dl:nth-child(5) > dd').text
        birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
        age = friend.css('div.extra > dl:nth-child(9) > dd').text
        FriendGenerator::Friend.new(name, address, phone, birthday, age)
        #friends_array << {name: friend_name, address: friend_address, phone: friend_phone, birthday: friend_birthday, age: friend_age}
      end
      def self.reset_all
        @@all.clear
      end
end
