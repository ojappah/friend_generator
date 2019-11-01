class FriendGenerator::Friend

  attr_accessor :name, :address, :phone, :birthday, :age

  @@all = []
  def self.all
    self.scrape_male_friends
    self.scrape_female_friends
    self.scrape_random_friends
  end

  def self.scrape_male_friends
    @male_friends = []
    self.scrape_male
    @male_friends
  end

  def self.scrape_female_friends
    @female_friends = []
    self.scrape_female
    @female_friends
  end

  def self.scrape_random_friends
    @random_friends = []
    self.scrape_random
    @random_friends
  end

  def self.scrape_male
    html = open("https://www.fakenamegenerator.com/gen-male-us-us.php")
    doc = Nokogiri::HTML.parse(html)
    friend_data = doc.css("div.info.content")
    friend_data.each do |data|
    male_friend = Hash.new
    male_friend[:name] = friend_data.css("div.address.h3")
    male_friend[:address] = friend_data.css("div.adr")
    male_friend[:phone] = friend_data.css("div.extra > dl:nth-child(5) > dd")
    male_friend[:birthday] = friend_data.css("div.extra > dl:nth-child(8) > dd")
    male_friend[:age] = friend_data.css("div.extra > dl:nth-child(9) > dd")
  end

  def self.scrape_female
    html = open("https://www.fakenamegenerator.com/gen-female-us-us.php")
    doc = Nokogiri::HTML.parse(html)
    friend_data = doc.css("div.info.content")
    friend_data.each do |data|
    female_friend = Hash.new
    female_friend[:name] = friend_data.css("div.address.h3")
    female_friend[:address] = friend_data.css("div.adr")
    female_friend[:phone] = friend_data.css("div.extra > dl:nth-child(5) > dd")
    female_friend[:birthday] = friend_data.css("div.extra > dl:nth-child(8) > dd")
    female_friend[:age] = friend_data.css("div.extra > dl:nth-child(9) > dd")
  end

  def self.scrape_random
    html = open("https://www.fakenamegenerator.com/gen-random-us-us.php")
    doc = Nokogiri::HTML.parse(html)
    friend_data = doc.css("div.info.content")
    friend_data.each do |data|
    random_friend = Hash.new
    random_friend[:name] = friend_data.css("div.address.h3")
    random_friend[:address] = friend_data.css("div.adr")
    random_friend[:phone] = friend_data.css("div.extra > dl:nth-child(5) > dd")
    random_friend[:birthday] = friend_data.css("div.extra > dl:nth-child(8) > dd")
    random_friend[:age] = friend_data.css("div.extra > dl:nth-child(9) > dd")
  end


end
  
