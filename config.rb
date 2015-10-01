###
# Compass
###

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
# page "/*.html", :layout => :layout_business
#
# A path which all have the same layout
with_layout :layout_customer do
  page "/customer/*"
  page "/en/customer/*"
end


# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :i18n, :mount_at_root => :es , :langs => [:en, :es]

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :directory_indexes

# config.rb
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-58977915-1' # Replace with your property ID.
end


helpers do
  def link_to_i18n(lname, lpath, *options)
    if ( I18n.locale.to_s != "es")
      link_to lname, '/' + I18n.locale.to_s + lpath, options[0]
    else
      link_to lname, lpath, options[0]
    end
  end
end