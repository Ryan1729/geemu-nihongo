module DefinitionTypes exposing
    ( Definition
    , Entry
    , Hirigana
    , IncludesKanji
    , Katakana
    , OnlyKanji
    , Romanji
    , Spec
    , entryStrings
    )


type alias Hirigana =
    String


type alias Katakana =
    String


type alias IncludesKanji =
    String


type alias OnlyKanji =
    String


type alias Romanji =
    String


type alias Definition =
    String


type alias MayIndicate =
    String


type alias Entry =
    { hirigana : Hirigana
    , katakana : Katakana
    , includesKanji : IncludesKanji
    , romanji : Romanji
    , definition : Definition
    , mayIndicate : MayIndicate
    }


entryStrings : Entry -> List String
entryStrings entry =
    [ entry.hirigana
    , entry.katakana
    , entry.includesKanji
    , entry.romanji
    , entry.definition
    , entry.mayIndicate
    ]


type alias Spec =
    { search : String
    }
