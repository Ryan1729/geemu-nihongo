module Definitions exposing (Entry, Spec, fromSpec)

import DefinitionData
import DefinitionTypes exposing (entryStrings)


type alias Entry =
    DefinitionTypes.Entry


type alias Spec =
    DefinitionTypes.Spec


fromSpec : Spec -> List Entry
fromSpec spec =
    DefinitionData.all
        |> List.filter (matchesSearch spec.search)


matchesSearch : String -> Entry -> Bool
matchesSearch search entry =
    if search == "" then
        True

    else
        entryStrings entry
            |> List.any (String.contains search)
