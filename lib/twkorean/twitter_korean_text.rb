# @name                twkorean-ruby
# @author              JunSangPil
# @version             0.0.1
# @url                 https://github.com/jun85664396/twkorean-ruby
# @license             Apache License 2.0
module Twkorean
  class TwitterKoreanText

    attr_accessor :korean_processor

    def initialize(normalization = true, stemming = true)
      jars = Dir.glob(File.dirname(__FILE__)+"/../jars/*.jar").join(':')
      Rjb::load(jars, ['-Xmx512M'])
      korean_processor = Rjb::import('com.twitter.penguin.korean.TwitterKoreanProcessorJava$Builder').new
      unless normalization
        korean_processor.disableNormalizer
      end
      unless stemming
        korean_processor.disableStemmer
      end
        self.korean_processor = korean_processor.build
    end

    def normalize(text)
      self.korean_processor.normalize(text).toString
    end

    def tokenize(text)
      tokens = self.korean_processor.tokenize(text)
      return [] unless tokens
      tokens.toArray.map{|x| x.toString}
    end

    def tokenize_to_strings(text)
      tokens = self.korean_processor.tokenizeToStrings(text)
      return [] unless tokens
      tokens.toArray.map{|x| x.toString}
    end

    def extract_phrases(text)
      phrases = self.korean_processor.extractPhrases(text)
      return [] unless phrases
      phrases.toArray.map{|x| x.toString}
    end

  end
end
