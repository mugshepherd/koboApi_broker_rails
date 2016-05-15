class KoboApi < ActiveRecord::Base

	require 'rest_client'

	USERNAME = ENV['KOBO_API_USER']
	PASSWORD = ENV['KOBO_API_PWD']
	SURVEY = ENV['KOBO_API_SURVEY']
	API_BASE_URL = "https://kc.kobotoolbox.org/api/v1/"
	# BASE_URL = "kc.kobotoolbox.org/api/v1"`

	def self.get_api_info
		# rest_resource = RestClient.get "https://#{USERNAME}:#{PASSWORD}@#{BASE_URL}/data/#{SURVEY}"
		uri = "#{API_BASE_URL}/data/#{SURVEY}?format=json"
		
		rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
		response = rest_resource.get
		@response = JSON.parse response
	end


end
