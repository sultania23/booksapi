require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
	setup do
		Book.create(title: "programmatic programmer", rating: 5)
		Book.create(title: "grands", rating: 4)
	end

	test "listing books" do

		get "/books"

		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
		assert_equal Book.count, json(response.body).size 

	end
	test "top rated books using filters" do
		get "/books?rating=5"

		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type

		assert_equal 1, json(response.body).size
	end
  

end
