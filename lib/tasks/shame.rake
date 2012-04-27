namespace :shame do
  desc "Shame people who misspell 'eligible'"
  task :reprimand => :environment do
    # lil' bit hack-y I guess
    require "action_view/helpers/date_helper"
    include ActionView::Helpers::DateHelper

    spank_candidates = Twitter.search("eligable")
    spank_candidates.each do |misspelled_tweet|
      puts "\033[34m@#{misspelled_tweet.from_user}\033[0m misspelled 'eligible' #{time_ago_in_words misspelled_tweet.created_at} ago: #{misspelled_tweet.text}"
    end
    puts "#{spank_candidates.size} people cannot spell 'eligible'"
  end
end
