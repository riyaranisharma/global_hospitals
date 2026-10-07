source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.1.3", ">= 8.1.3.1"

# The modern asset pipeline
gem "propshaft"

# Use PostgreSQL as the database
gem "pg", "~> 1.7"

# Use the Puma web server
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps
gem "importmap-rails"

# Hotwire
gem "turbo-rails"
gem "stimulus-rails"

# Build JSON APIs
gem "jbuilder"


# =====================================
# PASSWORD AUTHENTICATION
# =====================================

gem "bcrypt", "~> 3.1.7"


# Windows timezone data
gem "tzinfo-data", platforms: %i[ windows jruby ]


# Database-backed adapters
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"


# Reduces boot times
gem "bootsnap", require: false


# Deploy application
gem "kamal", require: false


# HTTP asset caching/compression
gem "thruster", require: false


# Active Storage variants
gem "image_processing", "~> 1.2"


# =====================================
# DEVELOPMENT & TEST
# =====================================

group :development, :test do

  gem "debug",
      platforms: %i[ mri windows ],
      require: "debug/prelude"

  gem "bundler-audit",
      require: false

  gem "brakeman",
      require: false

  gem "rubocop-rails-omakase",
      require: false

end


# =====================================
# DEVELOPMENT
# =====================================

group :development do

  gem "web-console"

end


# =====================================
# TEST
# =====================================

group :test do

  gem "capybara"
  gem "selenium-webdriver"

end
