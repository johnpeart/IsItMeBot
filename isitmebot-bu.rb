#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'twitter'

client = Twitter::REST::Client.new do |config|
	config.consumer_key			= 's9xQTFPOrLcE6zmb5857PvLje'
	config.consumer_secret		= '2FUlz9Ac91NuMDN6ntXEJK1R48AySG0w0a6yx07OSFDlWuxAHs'
	config.access_token			= '820242899388563456-wZSIora9uhEmC5Tqqgj9EQy99Tooulc'
	config.access_token_secret	= 'wx5KMij89FRLxdcqfqLfiHlmp5EJOWef5yAUEAYSxNO7a'
end

itsyou_replies = [
                   	"It's definitely you.",
					"It's you.",
					"It's you. It's always been you.",
					"Let me think about that... it's you.",
					"Let me think about that... it's definitely you.",
					"Let me think about that... it's you. It's always been you.",
					"Let me think about that... Yup. It's definitely you.",
					"Let me think about that... Yup. It's you.",
					"Let me think about that... Definitely you.",
					"Definitely you.",
					"Just you.",
					"Sorry, but it's you.",
					"It's you. Sorry!",
					"Sorry, just you.",
					"It's definitely you. Sorry!",
					"Only you.",
					"It's only you.",
					"Nope. Just you.",
					"Nope. Only you.",
					"Nope. Definitely you.",
					"Nope. Just you. Sorry!",
					"Nope. Only you. Sorry!",
					"Nope. Definitely you. Sorry!"
                  ]

itsyou = itsyou_replies.sample
itsyounotreply = itsyou_replies.sample

client.search("%22is+it+me+or%22", result_type: "recent").take(1).each do |tweet|

#  puts tweet.text

#  client.update("@#{tweet.user.screen_name} #{itsyou}", in_reply_to_status_id: tweet.id)
#  client.update("#{itsyounotreply}")

end

client.search("@isitmebot", result_type: "recent", since: Time.now.to_date).each do |tweet|

	if tweet.text.include?('Is it me') or tweet.text.include?('is it me') or tweet.text.include?('Is it just me') or tweet.text.include?('is it just me')
		puts tweet.text
	end

#  client.update("@#{tweet.user.screen_name} #{itsyou}", in_reply_to_status_id: tweet.id)
#  client.update("#{itsyounotreply}")

end
