# @name                twkorean-ruby
# @author              JunSangPil
# @version             0.0.1
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
  end

  it "Tokenize" do
    twkorean = Twkorean::TwitterKoreanText.new(true, false)
    p "#Tokenize"
    p twkorean.tokenize(TEXT)
  end

  it "Stemming" do
    twkorean = Twkorean::TwitterKoreanText.new
    p "#Stemming"
    p twkorean.tokenize(TEXT)
  end

  it "Phrase extraction" do
    twkorean = Twkorean::TwitterKoreanText.new
    p "Phrase extraction"
    p twkorean.extract_phrases(TEXT)
  end

end
