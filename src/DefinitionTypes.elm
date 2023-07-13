module DefinitionTypes exposing
    ( Definition
    , Entry
    , Hirigana
    , IncludesKanji
    , Katakana
    , Romanji
    , Spec
    )


type alias Hirigana =
    String


type alias Katakana =
    String


type alias IncludesKanji =
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


type alias Spec =
    {}
