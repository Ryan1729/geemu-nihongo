module Definitions exposing (Definition, Spec, fromSpec)


type alias Definition =
    String


type alias Spec =
    {}


fromSpec : Spec -> List Definition
fromSpec _ =
    [ "placeholder" ]
