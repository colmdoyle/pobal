namespace :pobal do
  desc 'A one time migration of FBIDs to Vanity URLs'
  task facebook_migration: :environment do
    fb_access_token = ENV['FACEBOOK_ACCESS_TOKEN']
    Person.all.each do |person|
      if person.facebook && is_fbid(person.facebook)
        graph_api_response = HTTParty.get("https://graph.facebook.com/#{person.facebook}?access_token=#{fb_access_token}&fields=link")
        person.facebook = graph_api_response.parsed_response["link"].remove!("https://www.facebook.com/", "/", "app_scoped_user_id") unless graph_api_response.parsed_response["error"]
        person.save
        p "#{person.fullname} updated!"
      end
    end
  end

  def is_fbid(str)
    true if Integer(str) rescue false
  end
end
