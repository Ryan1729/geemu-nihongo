module Main exposing (..)

import Browser
import Browser.Events
import Definitions exposing (Definition)
import Html exposing (Html, div, text)
import Json.Decode as JD
import Random exposing (Seed)


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias SiteModel =
    { definitionsSpec : Definitions.Spec
    }


type alias Model =
    Result String SiteModel


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


init : JD.Value -> ( Model, Cmd Msg )
init flags =
    case JD.decodeValue decodeFlags flags of
        Ok { seed } ->
            Ok
                { definitionsSpec = {}
                }
                |> with Cmd.none

        Err error ->
            "Error decoding flags: "
                ++ JD.errorToString error
                |> Err
                |> with Cmd.none


type Msg
    = Tick


update msg model =
    case msg of
        Tick ->
            model
                |> with Cmd.none


subscriptions _ =
    Sub.batch
        []


definitionView : Definition -> Html msg
definitionView definition =
    text definition


view model =
    case model of
        Ok site ->
            Definitions.fromSpec site.definitionsSpec
                |> List.map definitionView
                |> div []

        Err err ->
            text err
