#---
# Excerpted from "Agile Web Development with Rails 7",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/rails7 for more book information.
#---
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
class ActionDispatch::IntegrationTest
  def login_as(user)
    if respond_to? :visit
      visit login_url
      fill_in :name, with: user.name
      fill_in :password, with: 'secret'
      click_on 'Login'
    else
      post login_url, params: { name: user.name, password: 'secret' }
    end
  end

  def logout
    delete logout_url
  end

  def setup
    login_as users(:one)
  end
end
