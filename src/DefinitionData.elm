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
    , { hirigana = "もどる"
      , katakana = notApplicable
      , includesKanji = "戻る"
      , romanji = "modoru"
      , definition = "To go back"
      , mayIndicate = "the delete/backspace option when entering text, or option to return to the previous menu"
      }
    , { hirigana = "おわり"
      , katakana = notApplicable
      , includesKanji = "終わり"
      , romanji = "owari"
      , definition = "close, end, ending"
      , mayIndicate = "the submit option when entering text"
      }
    , { hirigana = "せいべつ\u{3000}は"
      , katakana = notApplicable
      , includesKanji = "性別 は"
      , romanji = "seibetsu ha"
      , definition = "gender and/or sex"
      , mayIndicate = "that a choice of player gender and/or sex is being presented"
      }
    , { hirigana = "おとこ"
      , katakana = notApplicable
      , includesKanji = "男"
      , romanji = "otoko"
      , definition = "man/male"
      , mayIndicate = "that an option to select for a character to be of masculine gender and/or male sex is presented"
      }
    , { hirigana = "おんな"
      , katakana = notApplicable
      , includesKanji = "女"
      , romanji = "onna"
      , definition = "woman/female"
      , mayIndicate = "that an option to select for a character to be of feminine gender and/or female sex is presented"
      }

    -- TODO add something like エックスジェンダ if we actually observe it in a game.
    -- A different way to say the same thing may be what is actually used in practice.
    ]
