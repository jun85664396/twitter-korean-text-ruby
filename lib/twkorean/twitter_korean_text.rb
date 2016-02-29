# @name                twkorean-ruby
# @author              JunSangPil
# @version             0.0.4
# @url                 https://github.com/jun85664396/twkorean-ruby
# @license             Apache License 2.0
module Twkorean
  class TwitterKoreanText

    attr_accessor :korean_processor

    def initialize(normalization = true, stemming = true)
      jars = Dir.glob(File.dirname(__FILE__)+"/../jars/*.jar").join(':')
      Rjb::load(jars, ['-Xmx512M'])
      self.korean_processor = Rjb::import('com.twitter.penguin.korean.TwitterKoreanProcessorJava')
    end

    def normalize(text)
      self.korean_processor.normalize(text).toString
    end

    def tokenize(text)
      tokens = self.korean_processor.tokenize(text)
      tokens
    end

    def tokens_to_string_list(tokens)
      tokens = self.korean_processor.tokensToJavaStringList(tokens)
      tokens.toArray.map{|x| x.toString}
    end

    def tokens_to_token_list(tokens)
      tokens = self.korean_processor.tokensToJavaKoreanTokenList(tokens)
      tokens.toArray.map{|x| self.parser(x.toString)}
    end

    def stem(tokens)
      stemmed = self.korean_processor.stem(tokens)
      stemmed
    end

    def extract_phrases(tokens)
      phrases = self.korean_processor.extractPhrases(tokens, true, true)
      phrases.toArray.map{|x| x.toString}
    end

    def parser(text)
      text.match(/(.*)\(([a-zA-Z]*): ([0-9]+), ([0-9]+)\)/).to_a
    end

  end
end
