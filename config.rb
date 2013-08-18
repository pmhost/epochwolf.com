###
# Blog settings
###

Time.zone = "US/Pacific"

# Primary blog, technical articles and links. 
activate :blog do |blog|
  blog.name = "blog"
  blog.prefix = "blog"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.taglink = "tags/:tag.html"
  blog.layout = "post"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".markdown"

  blog.tag_template = "blog/tag.html"
  # Disable the calendar template, using an archive page instead. 
  blog.calendar_template = nil # "calendar.html"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

# Secondary blog for my photos.
activate :blog do |blog|
  blog.name = "photos"
  blog.prefix = "photos"
  blog.permalink = ":title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.layout = "photos"
  blog.default_extension = ".markdown"

  # Disabling pagination, having two blogs with paging seems to cause wierdness. 
  # Only the main blog needs paging anyway. 
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

# Secondary blog for my stories. 
activate :blog do |blog|
  blog.name = "writing"
  blog.prefix = "writing"
  blog.permalink = ":year/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.taglink = "tags/:tag.html"
  blog.layout = "writing"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250

  blog.tag_template = "writing/tag.html"

  # Disabling pagination, having two blogs with paging seems to cause wierdness. 
  # Only the main blog needs paging anyway. 
  blog.paginate = nil 
end



### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 

# Set default layout for pages.
with_layout :page do
  page "/pages/*"
end

page "/writing/atom.xml", :layout => false
page "/atom.xml", :layout => false

# Ignore templates, don't want those rendering. 
ignore 'templates/*'


# Set up redirects from old versions of my site
# This is more of an exercise than a necessity, these links are at least 3 years old. 
# I use this redirect method is the easiest to implement and most browsers support the refresh meta tag. 
ready do
  sitemap.resources.select{|p| p.data.alias }.each do |page|
    page.data.alias.each do |old_url|
      proxy "/#{old_url}/index.html", 'templates/redirect.html', locals:{new_url: page.url}
    end
  end
end

# Methods defined in the helpers block are available in templates
helpers do
  def dt(datetime)
    datetime = Date.parse(datetime) if datetime.is_a? String
    "<span class=\"datetime\">#{datetime.strftime("%b %d, '%y")}</span>"
  end

  def tag_list(array, prefix="/blog")
    array ||= []
    array = [*array.split(/\s+,\s+/)].compact unless array.is_a? Array
    array.map{|tag| link_to tag, "#{prefix}/tags/#{tag}/" }.join ", "
  end

  def blog_link(article)
    if article.data.link
      "#{link_to article.title, article.data.link} <span class=\"external-link\">&raquo;</span>"
    else
      link_to article.title, article
    end
  end

  def permalink(article)
    link_to "&infin;", article, title:"Permalink"
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes
# Makes for nicer urls, no .html required. :)
activate :directory_indexes
# Code Highlighting
activate :syntax, line_numbers: true
require "middleman-thumbnailer"
activate :thumbnailer, dimensions: { small: '450x', large: '1024x'}, include_data_thumbnails: true

# Fix whitespace issues with pre tags :)
set :haml, { ugly: true }

set :markdown_engine, :kramdown

# Markdown Options for Karmdown 
# parse_block_html - enables markdown inside html, use markdown=0 on an html tag to disable.
set :markdown, fenced_code_blocks: true, parse_block_html: true


configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end

# Build-specific configuration
configure :build do

  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-12404363-1'
  end

  # For example, change the Compass output style for deployment
  # activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
