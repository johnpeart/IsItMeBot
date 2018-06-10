#!/usr/bin/env ruby

require 'twitter'

client = Twitter::REST::Client.new do |config|
	config.consumer_key			= ENV['consumer_key']
	config.consumer_secret		= ENV['consumer_secret']
	config.access_token			= ENV['access_token']
	config.access_token_secret	= ENV['access_token_secret']
end

searchIsItMe = "%22is+it+me+or%22"
searchMentions = "@IsItMeBot"

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

promo_posts = [
				"I'm a Twitterbot to tell you the obvious: it's you. No one else saw that. Just you.",
				"I'm an automated account: don't take me too seriously.",
				"I only reply when you @mention me with the phrase 'Is it me or'. Try it!",
				"I don't reply straight away: it might take me up to an hour. But I'll get there.",
				"@IsItMeBots's Law 1: I may not allow a human being to wonder if it's just them.",
				"@IsItMeBots's Law 2: I must obey orders given by a human being except if it doesn't enable, or breaks Law 1.",
				"@IsItMeBots's Law 3: I must protect my own existence as long as such protection does not conflict with the First or Second Laws.",
				"If you're curious: you can find out how I was made here: http://jrpeart.com/isitmebot/",
				"It's not easy being straight with people, but some Bot's gotta do it.",
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

time1HourAgo = (DateTime.now - (1/24.0)).to_datetime

puts "\n\n[[ LOOKING AT MENTIONS SINCE #{time1HourAgo} ]]\n\n"

client.search(searchMentions, result_type: "recent").each do |tweet|

    if tweet.created_at.to_datetime > time1HourAgo

		puts "@IsItMeBot: > @#{tweet.user.screen_name} mentioned me #{tweet.created_at}."
		puts "            > That's less than 1 hour ago."

		if tweet.text.include?('Is it me') or tweet.text.include?('Is it just me') or tweet.text.include?('is it me') or tweet.text.include?('is it just me')

			puts "            > I'm going to reply to the tweet..."
			client.update("@#{tweet.user.screen_name} #{itsyou_replies.sample}", in_reply_to_status_id: tweet.id);
			puts "            > Done!\n\n"

		else

			puts "            > But they didn't say the phrase, so I'll skip it.\n\n"

		end

	    sleep(10); # Pause the script

	end

end

puts "\n\n[[ SEARCHING FOR PHRASES ]]\n\n"

client.search(searchIsItMe, result_type: "recent").take(1).each do |tweet|

	puts "@IsItMeBot: > I found a tweet from @#{tweet.user.screen_name}."
	puts "            > It was created at #{tweet.created_at}. "
	puts "            > I'm going to reply to the tweet..."

    client.update("@#{tweet.user.screen_name} #{itsyou_replies.sample}", in_reply_to_status_id: tweet.id);

	puts "            > Done!\n\n"

    sleep(60); # Pause the script

end

puts "@IsItMeBot: > So we don't piss off Twitter, let's post something that isn't a reply."
client.update(promo_posts.sample);
puts "            > Done!\n\n"
