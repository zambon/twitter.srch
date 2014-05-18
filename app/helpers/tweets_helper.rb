module TweetsHelper
  def twitter_languages
    [
      ["--Select--", ""],
      ["english",    "en"],
      ["espanol",    "es"],
      ["francais",   "fr"],
      ["italiano",   "it"],
      ["portugues",  "pt"]
    ]
  end

  def parse_tweet_user(tweet)
    "http://twitter.com/#{tweet.from_user}"
  end

  def parse_tweet_text(tweet)
    text = tweet.text
    links = text.scan(/((http[s]?\:\/\/|ftp\:\/\/)|(www\.|ftp\.))(\S+)/)
    unless links.empty?
      links.each do |str|
        text = text.sub(str[0] + str[3], "<a href=\"" + str[0] + str[3] + "\">" + str[0] + str[3] + "</a>")
      end
    end

    #(^|\.|\ |\(|\)|\-|\;|\,|\!|\?|\>|\<|\||\'|\"|\`|\~|\^|\%|\&|\$|\_|\=|\+|\[|\]|\{|\}|\*)
    #/(^|\.|\ )(@\w+)/
    #/(^|\.|\ )(\#\w+)/

    users = text.scan(/(^|\.|\ |\(|\)|\-|\;|\,|\!|\?|\>|\<|\||\'|\"|\`|\~|\^|\%|\&|\$|\_|\=|\+|\[|\]|\{|\}|\*)(@\w+)/)
    unless users.empty?
      users.each do |str|
        text = text.sub(
          str[1],
          "@<a href=\"http://twitter.com/" + str[1][1, str[1].length] + "\">" + str[1][1, str[1].length] + "</a>"
        )
      end
    end

    hashtags = text.scan(/(^|\.|\ |\(|\)|\-|\;|\,|\!|\?|\>|\<|\||\'|\"|\`|\~|\^|\%|\&|\$|\_|\=|\+|\[|\]|\{|\}|\*)(\#\w+)/)
    unless hashtags.empty?
      hashtags.each do |str|
        text = text.sub(
          str[1],
          "<a href=\"http://twitter.com/search?q=%23" +
          str[1][1, str[1].length] + "\" title=\"" + str[1] + "\">" + str[1] + "</a>"
        )
      end
    end

    text
  end
end
