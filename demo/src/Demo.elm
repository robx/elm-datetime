module Demo exposing (main)

import Browser
import DateTime
import Html
import Time


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { time : Maybe Time.Posix
    }


type Msg
    = Tick Time.Posix


init : () -> ( Model, Cmd Msg )
init flags =
    ( { time = Nothing }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick posix ->
            ( { model | time = Just posix }, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    let
        format =
            DateTime.format DateTime.localNumericDateTime
    in
    { title = "puzzle"
    , body =
        case model.time of
            Just posix ->
                [ Html.div [] [ Html.text <| String.fromInt <| Time.posixToMillis <| posix ]
                , Html.div [] [ Html.text <| format posix ]
                ]

            _ ->
                [ Html.div [] [ Html.text "..." ] ]
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 1000 Tick
