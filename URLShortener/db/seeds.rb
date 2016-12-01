# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:email => "CJ@gmail.com")
  user2 = User.create(:email => "Flarnie@gmail.com")
  user3 = User.create(:email => "Jeff@yahoo.com")
  user4 = User.create(:email => "GeorgesSt.Pierre@hotmail.com")
  user5 = User.create(:email => "Ned@aol.com")

  ShortenedUrl.destroy_all
  url1 = ShortenedUrl.create_for_user_and_long_url(user1, "https://github.com/appacademy/curriculum/tree/master/sql/projects/url_shortener")
  url2 = ShortenedUrl.create_for_user_and_long_url(user2, "http://drwrchrds.github.io/pairing_timer/")
  url3 = ShortenedUrl.create_for_user_and_long_url(user3, "https://github.com/appacademy/curriculum/tree/master/sql/projects/url_shortener")
  url4 = ShortenedUrl.create_for_user_and_long_url(user4, "https://github.com/appacademy/curriculum/tree/master/sql/projects/url_shortener")
  url5 = ShortenedUrl.create_for_user_and_long_url(user5, "https://github.com/appacademy/curriculum/tree/master/sql/projects/url_shortener")
  url6 = ShortenedUrl.create_for_user_and_long_url(user1, "https://google.com")
  url7 = ShortenedUrl.create_for_user_and_long_url(user1, "https://www.techopedia.com/definition/3337/command-line-interface-cli")

Visit.destroy_all
Visit.record_visit!(user1, url1)
Visit.record_visit!(user2, url1)
Visit.record_visit!(user3, url3)
Visit.record_visit!(user4, url1)
Visit.record_visit!(user5, url3)

end
