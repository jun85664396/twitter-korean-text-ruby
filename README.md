# Twkorean

## Compatibility

Currently wraps [open-korean-text 2.0.5](https://github.com/open-korean-text/open-korean-text/releases/tag/open-korean-text-2.0.5) / 현재 이 프로젝트는 [open-korean-text 2.0.5](https://github.com/open-korean-text/open-korean-text/releases/tag/open-korean-text-2.0.5)을 사용중입니다.

## Installation

Add this line to your application's Gemfile:

    gem 'twkorean'

If you are using Java 7

    gem 'twkorean', "~> 0.0.5"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twkorean

## Required

Twkorean supports java8+

    $ export JAVA_HOME={Your Path}

## Test
    
    $ rake or rspec

## Usage

    describe "Twkorean" do
      text = "한국어를 처리하는 예시입니닼ㅋㅋㅋㅋㅋ #한국어"
      twkorean = Twkorean::TwitterKoreanText.new
      text = twkorean.normalize(text)
      tokens = twkorean.tokenize(text)
    
      it "Tokenize" do
        p "#Tokenize"
        p twkorean.tokens_to_string_list(tokens)
        # ["한국어", "를", "처리", "하는", "예시", "입니다", "ㅋㅋㅋ", "#한국어"]
        p twkorean.tokens_to_token_list(tokens)
        # [
        #    ["한국어(Noun: 0, 3)", "한국어", "Noun", nil, "0", "3"],
        #    ["를(Josa: 3, 1)", "를", "Josa", nil, "3", "1"],
        #    ["처리(Noun: 5, 2)", "처리", "Noun", nil, "5", "2"],
        #    ["하는(Verb(하다): 7, 2)", "하는", "Verb", "(하다)", "7", "2"],
        #    ["예시(Noun: 10, 2)", "예시", "Noun", nil, "10", "2"],
        #    ["입니다(Adjective(이다): 12, 3)", "입니다", "Adjective", "(이다)", "12", "3"],
        #    ["ㅋㅋㅋ(KoreanParticle: 15, 3)", "ㅋㅋㅋ", "KoreanParticle", nil, "15", "3"],
        #    ["#한국어(Hashtag: 19, 4)", "#한국어", "Hashtag", nil, "19", "4"]
        # ]
      end
    
      it "Phrase extraction" do
        p "Phrase extraction"
        p twkorean.extract_phrases(tokens)
        # ["한국어(Noun: 0, 3)", "처리(Noun: 5, 2)", "처리하는 예시(Noun: 5, 7)", "예시(Noun: 10, 2)", "#한국어(Hashtag: 19, 4)"]
      end
    end

## Contributing

1. Fork it ( https://github.com/[my-github-username]/twkorean/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
