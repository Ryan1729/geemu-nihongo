module Main exposing (..)

import Browser
import Browser.Events
import Definitions exposing (Definitions)
import Html exposing (Html, button, div, header, input, span, text)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onClick, onInput)
import Json.Decode as JD
import Random exposing (Seed)
import Set


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Flags =
    { seed : Int
    }


decodeFlags : JD.Decoder Flags
decodeFlags =
    JD.map Flags
        (JD.field "seed" JD.int)


with : b -> a -> ( a, b )
with b a =
    ( a, b )


type KanjiMenuState
    = Closed
    | Open


type alias SiteModel =
    { definitionsSpec : Definitions.Spec
    , kanjiMenuState : KanjiMenuState
    }


type alias Model =
    Result String SiteModel


init : JD.Value -> ( Model, Cmd Msg )
init flags =
    case JD.decodeValue decodeFlags flags of
        Ok { seed } ->
            Ok
                { definitionsSpec = { search = "" }
                , kanjiMenuState = Closed
                }
                |> with Cmd.none

        Err error ->
            "Error decoding flags: "
                ++ JD.errorToString error
                |> Err
                |> with Cmd.none


type Msg
    = ChangeSearch String
    | TypeIn String
    | ToggleKanjiMenuState


update msg model =
    case model of
        Ok site ->
            case msg of
                ChangeSearch search ->
                    let
                        definitionsSpec =
                            site.definitionsSpec
                    in
                    { site
                        | definitionsSpec = { definitionsSpec | search = search }
                    }
                        |> Ok
                        |> with Cmd.none

                TypeIn input ->
                    -- Looks like we'll need to use a port to insert at the cursor position :/
                    let
                        definitionsSpec =
                            site.definitionsSpec
                    in
                    { site
                        | definitionsSpec = { definitionsSpec | search = definitionsSpec.search ++ input }
                    }
                        |> Ok
                        |> with Cmd.none

                ToggleKanjiMenuState ->
                    { site
                        | kanjiMenuState =
                            case site.kanjiMenuState of
                                Closed ->
                                    Open

                                Open ->
                                    Closed
                    }
                        |> Ok
                        |> with Cmd.none

        Err err ->
            model
                |> with Cmd.none


subscriptions _ =
    Sub.batch
        []


definitionView : Definitions.Entry -> Html msg
definitionView entry =
    let
        lexeme : String
        lexeme =
            [ entry.includesKanji, entry.katakana, entry.hirigana ]
                |> List.filter (\s -> String.length s > 0)
                |> String.join " / "
    in
    div [ class "entry" ]
        [ span [] [ text <| lexeme ++ " (" ++ entry.romanji ++ ")" ]
        , span [] [ text entry.definition ]
        , span [] [ text <| "May indicate: " ++ entry.mayIndicate ]
        ]


definitionsView : Definitions -> Html msg
definitionsView definitions =
    definitions
        |> List.map definitionView
        |> div []


searchKeyboardKey : String -> Html Msg
searchKeyboardKey input =
    button [ onClick (TypeIn input) ]
        [ text input
        ]


view model =
    case model of
        Ok site ->
            let
                spec : Definitions.Spec
                spec =
                    site.definitionsSpec

                definitions : Definitions
                definitions =
                    Definitions.fromSpec spec

                kanjiMenu : Html Msg
                kanjiMenu =
                    case site.kanjiMenuState of
                        Closed ->
                            text ""

                        Open ->
                            Definitions.usedKanji definitions
                                |> Set.toList
                                |> List.map searchKeyboardKey
                                |> div []
            in
            div []
                [ header []
                    [ input [ placeholder "Search", value spec.search, onInput ChangeSearch ] []
                    , button [ onClick ToggleKanjiMenuState ] [ text "Kanji" ]
                    ]
                , kanjiMenu
                , Html.node "main"
                    []
                    [ definitionsView definitions ]
                ]

        Err err ->
            text err
