class FriendGenerator::Friend

    attr_accessor :name, :address, :phone, :birthday, :age


    def initialize(name, address, phone, birthday, age)

      @name = name
      @address = address
      @phone = phone
      @birthday = birthday
      @age = age
    end


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

    end
end
