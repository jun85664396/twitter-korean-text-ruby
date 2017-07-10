# @name                twkorean-ruby
# @author              JunSangPil
# @version             0.0.4
# @url                 https://github.com/jun85664396/twkorean-ruby
# @license             Apache License 2.0

RSpec.describe Twkorean do
  let(:twkorean) { Twkorean::TwitterKoreanText.new }
  let(:text) { twkorean.normalize("한국어를 처리하는 예시입니닼ㅋㅋㅋㅋㅋ #한국어") }
  let(:tokens) { twkorean.tokenize(text) }

  context "Tokenize" do
    it "should split a sentence to list of strings " do
      expect(twkorean.tokens_to_string_list(tokens)).to eq(
        ["한국어", "를", "처리", "하는", "예시", "입니", "다", "ㅋㅋ", "#한국어"]
      )
    end

    it "should split a sentence to list of tokens" do
      expect(twkorean.tokens_to_token_list(tokens)).to eq([
        ["한국어(Noun: 0, 3)", "한국어", "Noun", "0", "3"],
        ["를(Josa: 3, 1)", "를", "Josa", "3", "1"],
        ["처리(Noun: 5, 2)", "처리", "Noun", "5", "2"],
        ["하는(Verb: 7, 2)", "하는", "Verb", "7", "2"],
        ["예시(Noun: 10, 2)", "예시", "Noun", "10", "2"],
        ["입니(Adjective: 12, 2)", "입니", "Adjective", "12", "2"],
        ["다(Eomi: 14, 1)", "다", "Eomi", "14", "1"],
        ["ㅋㅋ(KoreanParticle: 15, 2)", "ㅋㅋ", "KoreanParticle", "15", "2"],
        ["#한국어(Hashtag: 18, 4)", "#한국어", "Hashtag", "18", "4"]
      ])
    end
  end

  context "Stemming" do
    let(:stem) { twkorean.stem(tokens) }

    it "should split a sentence to list of strings stemmed" do
      expect(twkorean.tokens_to_string_list(stem)).to eq(
        ["한국어", "를", "처리", "하다", "예시", "이다", "ㅋㅋ", "#한국어"]
      )
    end

    it "should split a sentence to list of tokens stemmed" do
      expect(twkorean.tokens_to_token_list(stem)).to eq([
        ["한국어(Noun: 0, 3)", "한국어", "Noun", "0", "3"],
        ["를(Josa: 3, 1)", "를", "Josa", "3", "1"],
        ["처리(Noun: 5, 2)", "처리", "Noun", "5", "2"],
        ["하다(Verb: 7, 2)", "하다", "Verb", "7", "2"],
        ["예시(Noun: 10, 2)", "예시", "Noun", "10", "2"],
        ["이다(Adjective: 12, 3)", "이다", "Adjective", "12", "3"],
        ["ㅋㅋ(KoreanParticle: 15, 2)", "ㅋㅋ", "KoreanParticle", "15", "2"],
        ["#한국어(Hashtag: 18, 4)", "#한국어", "Hashtag", "18", "4"]
      ])
    end
  end

  context "Phrase extraction" do
    it "should extract phrases from a sentence" do
      expect(twkorean.extract_phrases(tokens)).to eq(
        [
          "한국어(Noun: 0, 3)",
          "처리(Noun: 5, 2)",
          "처리하는 예시(Noun: 5, 7)",
          "예시(Noun: 10, 2)",
          "#한국어(Hashtag: 18, 4)"
        ]
      )
    end
  end
end
