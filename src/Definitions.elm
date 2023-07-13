module Definitions exposing (Entry, Spec, fromSpec)

import DefinitionData
import DefinitionTypes


type alias Entry =
    DefinitionTypes.Entry


type alias Spec =
    DefinitionTypes.Spec


fromSpec : Spec -> List Entry
fromSpec _ =
    DefinitionData.all
