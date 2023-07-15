module Main exposing (..)

import Browser
import Browser.Events
import Definitions
import Html exposing (Html, div, header, input, span, text)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onInput)
import Json.Decode as JD
import Random exposing (Seed)


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


type alias SiteModel =
    { definitionsSpec : Definitions.Spec
    }


type alias Model =
    Result String SiteModel


init : JD.Value -> ( Model, Cmd Msg )
init flags =
    case JD.decodeValue decodeFlags flags of
        Ok { seed } ->
            Ok
                { definitionsSpec = { search = "" }
                }
                |> with Cmd.none

        Err error ->
            "Error decoding flags: "
                ++ JD.errorToString error
                |> Err
                |> with Cmd.none


type Msg
    = Tick
    | ChangeSearch String


update msg model =
    case model of
        Ok site ->
            case msg of
                Tick ->
                    site
                        |> Ok
                        |> with Cmd.none

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


definitionsView : Definitions.Spec -> Html msg
definitionsView spec =
    Definitions.fromSpec spec
        |> List.map definitionView
        |> div []


view model =
    case model of
        Ok site ->
            div []
                [ header []
                    [ input [ placeholder "Search", value site.definitionsSpec.search, onInput ChangeSearch ] []
                    ]
                , Html.node "main"
                    []
                    [ definitionsView site.definitionsSpec ]
                ]

        Err err ->
            text err
