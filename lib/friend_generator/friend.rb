class FriendGenerator::Friend

  attr_accessor :name, :address, :phone, :birthday, :age
@@all = []
friend = []
def initialize(friend_hash)
friend_hash.each do |attribute, value|
  self.send"#{attribute}=", value
end
end
@@all << self
end
public
def create_from_collection(friends_array)
  #friends_array.each do |friend_hash|
    FriendGenerator::Friend.new(friends_array)
  end

def self.all
  @@all
end
public
def scrape_index_page(index_page)
  friends_array = []
    index_page = Nokogiri::HTML(open(index_page))
    friend = index_page.css("div.info .content")
    friend.css(".friend-data a")
        friend_name = friend.css('div.address.h3').text
        friend_address = friend.css('div.adr').text
        friend_phone = friend.css('div.extra > dl:nth-child(5) > dd').text
        friend_birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
        friend_age = friend.css('div.extra > dl:nth-child(9) > dd').text

        #friends_array << {name: friend_name, address: friend_address, phone: friend_phone, birthday: friend_birthday, age: friend_age}
      end
