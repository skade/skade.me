###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
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
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
require "sanitize"

helpers do
   # Strip all HTML tags from string
  def strip_tags(html)
    Sanitize.clean(html.strip).strip
  end
end

Time.zone = "Berlin"

activate :livereload

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

activate :blog do |blog|
  # set options on blog
  blog.layout = "single"
  blog.permalink = ":year/:title.html"
  blog.prefix = "blog"
  blog.taglink = "tags/:tag.html"
  blog.tag_template  = "tag.html"
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  blog.day_link = ":year/:month/:day.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
  blog.per_page = 20
  blog.page_link = "page/:num"
end

activate :drafts do |drafts|
  current = `git log -1 --format="%H"`.chomp
  staging = `git rev-parse staging`.chomp
  drafts.build = current == staging ? true : nil
end

ready do
  page "rss.rss", :layout => "rss.rss"
end

# Markdown configuration
set :markdown_engine, :kramdown
set :markdown, :layout_engine => :erb,
               :tables => true,
               :autolink => true,
               :smartypants => true
# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  # Minify Javascript on build
  activate :sprockets
  activate :minify_javascript
  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
   activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
