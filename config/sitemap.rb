# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.whoismytd.com"

SitemapGenerator::Sitemap.create do
  add person_index_path
  Person.find_each do |person|
    add person_path(person), :lastmod => person.updated_at
  end

  add body_index_path
  Body.find_each do |body|
    add body_path(body), :lastmod => body.updated_at
  end

  add constituency_index_path
  Constituency.find_each do |constituency|
    add constituency_path(constituency), :lastmod => constituency.updated_at
  end

  add group_index_path
  Group.find_each do |group|
    add group_path(group), :lastmod => group.updated_at
  end

  add page_path('about-us')

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
