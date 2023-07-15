module DefinitionData exposing (all)

import DefinitionTypes exposing (Entry)


notApplicable =
    ""


all : List Entry
all =
    [ { hirigana = "げえむ"
      , katakana = "ゲーム"
      , includesKanji = notApplicable
      , romanji = "geemu"
      , definition = "game"
      , mayIndicate = "an option to start the game"
      }
    , { hirigana = "にほんご"
      , katakana = notApplicable
      , includesKanji = "日本語"
      , romanji = "nihongo"
      , definition = "The Japanese language."
      , mayIndicate = "an option to change what language is displayed"
      }
    , { hirigana = "なまえ"
      , katakana = notApplicable
      , includesKanji = "名前"
      , romanji = "namae"
      , definition = "First name"
      , mayIndicate = "an option to change a characters name"
      }
    , { hirigana = "ひらがな"
      , katakana = notApplicable
      , includesKanji = "平仮名"
      , romanji = "hiragana"
      , definition = "A set of Japanese symbols"
      , mayIndicate = "a menu option to switch symbols when entering names."
      }
    , { hirigana = "かたかな"
      , katakana = "カタカナ"
      , includesKanji = "片仮名"
      , romanji = "katakana"
      , definition = "A set of Japanese symbols"
      , mayIndicate = "a menu option to switch symbols when entering names."
      }
    , { hirigana = "かんじ"
      , katakana = notApplicable
      , includesKanji = "漢字"
      , romanji = "kanji"
      , definition = "A large set of Japanese symbols"
      , mayIndicate = "a menu option to switch symbols when entering names."
      }
    ]
