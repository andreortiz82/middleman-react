# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

Haml::TempleEngine.disable_option_validator!

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes

dev_com = "./node_modules/webpack/bin/webpack.js --watch -d"
prod_com = "./node_modules/webpack/bin/webpack.js --bail"

activate :external_pipeline,
  name: :webpack,
  # using yarn command at `./node_modules/yarn/bin/yarn`
  # because it won't be globally installed on build server
  command: build? ?  prod_com : dev_com,
  source: ".tmp/dist",
  latency: 1

configure :development do
  activate :livereload
end

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def current_page?(page)
    current_page.url == page+'/' ? "active" : ""
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
set :build_dir, 'tmp'

configure :build do
  ignore '/javascripts/components/*.js'
  ignore '/javascripts/site.js'
  activate :minify_css
  activate :asset_hash
end
