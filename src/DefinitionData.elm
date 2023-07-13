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
    ]
