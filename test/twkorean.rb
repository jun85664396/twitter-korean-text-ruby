# @name                twkorean-ruby
# @author              JunSangPil
# @version             0.0.2
# @url                 https://github.com/jun85664396/twkorean-ruby
# @license             Apache License 2.0
require_relative 'test_helper'
require 'twkorean'

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

end
