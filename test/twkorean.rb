# @name                twkorean-ruby
# @author              JunSangPil
# @version             0.0.4
# @url                 https://github.com/jun85664396/twkorean-ruby
# @license             Apache License 2.0
require_relative 'test_helper'
require 'twkorean'

describe "Twkorean" do
  text = "한국어를 처리하는 예시입니닼ㅋㅋㅋㅋㅋ #한국어"
  twkorean = Twkorean::TwitterKoreanText.new
  text = twkorean.normalize(text)
  tokens = twkorean.tokenize(text)

  it "Tokenize" do
    p "#Tokenize"
    p twkorean.tokens_to_string_list(tokens)
    # ["한국어", "를", "처리", "하는", "예시", "입니", "다", "ㅋㅋ", "#한국어"]
    p twkorean.tokens_to_token_list(tokens)
    # ["한국어(Noun: 0, 3)", "를(Josa: 3, 1)", "처리(Noun: 5, 2)", "하는(Verb: 7, 2)", "예시(Noun: 10, 2)", "입니(Adjective: 12, 2)", "다(Eomi: 14, 1)", "ㅋㅋ(KoreanParticle: 15, 2)", "#한국어(Hashtag: 18, 4)"]
  end

  it "Stemming" do
    p "#Stemming"
    stem = twkorean.stem(tokens)
    p twkorean.tokens_to_string_list(stem)
    # ["한국어", "를", "처리", "하다", "예시", "이다", "ㅋㅋ", "#한국어"]
    p twkorean.tokens_to_token_list(stem)
    # ["한국어(Noun: 0, 3)", "를(Josa: 3, 1)", "처리(Noun: 5, 2)", "하다(Verb: 7, 2)", "예시(Noun: 10, 2)", "이다(Adjective: 12, 3)", "ㅋㅋ(KoreanParticle: 15, 2)", "#한국어(Hashtag: 18, 4)"]
  end

  it "Phrase extraction" do
    p "Phrase extraction"
    p twkorean.extract_phrases(tokens)
    # ["한국어(Noun: 0, 3)", "처리(Noun: 5, 2)", "처리하는 예시(Noun: 5, 7)", "예시(Noun: 10, 2)", "#한국어(Hashtag: 18, 4)"]
  end

end
