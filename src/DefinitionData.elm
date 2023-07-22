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
    , { hirigana = "はい"
      , katakana = notApplicable
      , includesKanji = notApplicable
      , romanji = "hai"
      , definition = "yes; affirmative statement."
      , mayIndicate = "that an option to answer yes to a question is presented"
      }
    , { hirigana = "いいえ"
      , katakana = notApplicable
      , includesKanji = notApplicable
      , romanji = "iie"
      , definition = "no; negative statement"
      , mayIndicate = "that an option to answer no to a question is presented"
      }
    , { hirigana = "きん"
      , katakana = notApplicable
      , includesKanji = "金"
      , romanji = "kin"
      , definition = "gold"
      , mayIndicate = "in-game money"
      }
    , { hirigana = "らんく"
      , katakana = "ランク"
      , includesKanji = notApplicable
      , romanji = "ranku"
      , definition = "rank"
      , mayIndicate = "an option to go to a ranking screen"
      }
    , { hirigana = "うける"
      , katakana = notApplicable
      , includesKanji = "受ける"
      , romanji = "ukeru"
      , definition = "get/receive"
      , mayIndicate = "an option to take an item"
      }
    , { hirigana = "ことわる"
      , katakana = notApplicable
      , includesKanji = "断る"
      , romanji = "kotowaru"
      , definition = "refuse/reject"
      , mayIndicate = "an option to refuse an item"
      }
    , { hirigana = "つづける"
      , katakana = notApplicable
      , includesKanji = "続ける"
      , romanji = "tsuzukeru"
      , definition = "continue"
      , mayIndicate = "option to continue/unpause"
      }
    , { hirigana = "やりなおす"
      , katakana = notApplicable
      , includesKanji = "やり直す"
      , romanji = "yarinaosu"
      , definition = "to redo/start over/resume"
      , mayIndicate = "option to resume or restart"
      }
    , { hirigana = "あきらめる"
      , katakana = notApplicable
      , includesKanji = "諦める"
      , romanji = "akirameru"
      , definition = "to abandon/to resign/give up"
      , mayIndicate = "an option to quit/give up"
      }
    , { hirigana = "えらぶ"
      , katakana = notApplicable
      , includesKanji = "選ぶ"
      , romanji = "erabu"
      , definition = "to select/to choose"
      , mayIndicate = "that particular controls are used to select menu options"
      }
    , { hirigana = "けってい"
      , katakana = notApplicable
      , includesKanji = "決定"
      , romanji = "kettei"
      , definition = "determination/decision"
      , mayIndicate = "that particular controls are used to input menu options"
      }
    , { hirigana = "ぱずる"
      , katakana = "パズル"
      , includesKanji = notApplicable
      , romanji = "pazuru"
      , definition = "puzzle"
      , mayIndicate = "an option for a puzzle mode"
      }
    , { hirigana = "じっくり"
      , katakana = notApplicable
      , includesKanji = notApplicable
      , romanji = "jikkuri"
      , definition = "deliberately, slowly and carefully"
      , mayIndicate = "an untimed or slower game mode"
      }
    , { hirigana = "はいすこあ"
      , katakana = "ハイスコア"
      , includesKanji = notApplicable
      , romanji = "haisukoa"
      , definition = "high score"
      , mayIndicate = "that the player got a high score, or the presence of a high score table"
      }
    , { hirigana = "すすむ"
      , katakana = notApplicable
      , includesKanji = "進む"
      , romanji = "susuma"
      , definition = "go forward/advance"
      , mayIndicate = "option to move to the next screen/level/stage"
      }
    , { hirigana = "すてーじくりあ"
      , katakana = "ステージクリア"
      , includesKanji = notApplicable
      , romanji = "suteeji kuria"
      , definition = "stage clear"
      , mayIndicate = "that the player has cleared the stage/level/screen"
      }
    , { hirigana = "こうしん"
      , katakana = notApplicable
      , includesKanji = "更新"
      , romanji = "koushin"
      , definition = "breaking a record/update/replacement"
      , mayIndicate = "a record was broken. See ハイスコア"
      }
    ]
