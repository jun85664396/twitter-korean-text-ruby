# Twkorean

## Compatibility

Currently wraps [twitter-korean-text 3.0](https://github.com/twitter/twitter-korean-text/tree/korean-text-3.0) / 현재 이 프로젝트는 [twitter-korean-text 3.0](https://github.com/twitter/twitter-korean-text/tree/korean-text-3.0)을 사용중입니다.

## Installation

Add this line to your application's Gemfile:

    gem 'twkorean'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twkorean

## Required

    $ export JAVA_HOME={Your Path}
    $ gem install 'rjb'

## Test
    
    $ ruby -v test/twkorean.rb

## Usage

     describe "Twkorean" do
        TEXT = "한국어를 처리하는 예시입니닼ㅋㅋㅋㅋㅋ #한국어"
        before do
          
        end

        it "Normalize" do
          twkorean = Twkorean::TwitterKoreanText.new
          p "Normlize"
          p twkorean.normalize(TEXT)
          # 한국어를 처리하는 예시입니다ㅋㅋ #한국어
        end

        it "Tokenize" do
          twkorean = Twkorean::TwitterKoreanText.new(true, false)
          p "#Tokenize"
          p twkorean.tokenize(TEXT)
          # ["한국어(Noun: 0, 3)", "를(Josa: 3, 1)", "처리(Noun: 5, 2)", "하는(Verb: 7, 2)", "예시(Noun: 10, 2)", "입니(Adjective: 12, 2)", "다(Eomi: 14, 1)", "ㅋㅋ(KoreanParticle: 15, 2)", "#한국어(Hashtag: 18, 4)"]
        end

        it "Stemming" do
          twkorean = Twkorean::TwitterKoreanText.new
          p "#Stemming"
          p twkorean.tokenize(TEXT)
          # ["한국어(Noun: 0, 3)", "를(Josa: 3, 1)", "처리(Noun: 5, 2)", "하다(Verb: 7, 2)", "예시(Noun: 10, 2)", "이다(Adjective: 12, 3)", "ㅋㅋ(KoreanParticle: 15, 2)", "#한국어(Hashtag: 18, 4)"]
        end

        it "Phrase extraction" do
          twkorean = Twkorean::TwitterKoreanText.new
          p "Phrase extraction"
          p twkorean.extract_phrases(TEXT)
          # ["한국어(Noun: 0, 3)", "처리(Noun: 5, 2)", "처리하는 예시(Noun: 5, 7)", "예시(Noun: 10, 2)", "#한국어(Hashtag: 18, 4)"]
        end

        it "Parser" do
           twkorean = Twkorean::TwitterKoreanText.new(true, false)
           p "#Tokenize Parse"
           p twkorean.tokenize(TEXT).map{|x| twkorean.parser(x) }
           #[["한국어(Noun: 0, 3)", "한국어", "Noun", "0", "3"], ["를(Josa: 3, 1)", "를", "Josa", "3", "1"], ["처리(Noun: 5, 2)", "처리", "Noun", "5", "2"], ["하는(Verb: 7, 2)", "하는", "Verb", "7", "2"], ["예시(Noun: 10, 2)", "예시", "Noun", "10", "2"], ["입니(Adjective: 12, 2)", "입니", "Adjective", "12", "2"], ["다(Eomi: 14, 1)", "다", "Eomi", "14", "1"], ["ㅋㅋ(KoreanParticle: 15, 2)", "ㅋㅋ", "KoreanParticle", "15", "2"], ["#한국어(Hashtag: 18, 4)", "#한국어", "Hashtag", "18", "4"]]
        end
     end
## Contributing

1. Fork it ( https://github.com/[my-github-username]/twkorean/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
