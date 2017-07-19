module Twkorean
  class TwitterKoreanText

    def initialize(normalization = true, stemming = true)
      jars = Dir.glob(File.dirname(__FILE__)+"/../jars/*.jar").join(File::PATH_SEPARATOR)
      Rjb::load(jars, ['-Xmx512M'])
    end

    def normalize(text)
      korean_processor.normalize(text).toString
    end

    def tokenize(text)
      tokens = korean_processor.tokenize(text)
      tokens
    end

    def tokens_to_string_list(tokens)
      tokens = korean_processor.tokensToJavaStringList(tokens)
      tokens.toArray.map{|x| x.toString}
    end

    def tokens_to_token_list(tokens)
      tokens = korean_processor.tokensToJavaKoreanTokenList(tokens)
      tokens.toArray.map{|x| parser(x.toString)}
    end

    def stem(tokens)
      # Deprecated method
      # For legacy Code, Version less 0.0.6
      tokens_to_token_list(tokens)
    end

    def extract_phrases(tokens)
      phrases = korean_processor.extractPhrases(tokens, true, true)
      phrases.toArray.map{|x| x.toString}
    end

    private
    def parser(text)
      text.match(/(.*)\(([a-zA-Z]*)(\(.*\))?: ([0-9]+), ([0-9]+)\)/).to_a
    end

    def korean_processor
      @korean_processor ||= Rjb::import('org.openkoreantext.processor.OpenKoreanTextProcessorJava')
    end
  end
end
