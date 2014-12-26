# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.anniek-lambrecht.be"

SitemapGenerator::Sitemap.create do
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
  Category.find_each do |category|
    add behandelingen_path(category), :priority => 0.7, :changefreq => 'weekly'
  end

  Treatment.find_each do |treatment|
    add behandeling_path(treatment), :priority => 0.7, :changefreq => 'weekly'
  end

  add producten_path, :priority => 0.5, :changefreq => 'monthly'
  add new_contact_path :priority => 0.5, :changefreq => 'monthly'
end
