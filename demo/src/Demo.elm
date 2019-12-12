module Demo exposing (main)

import Browser
import DateTime
import Html
import Task
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
    , format : Maybe DateTime.DateTimeFormat
    }


type Msg
    = Tick Time.Posix
    | NewFormat DateTime.DateTimeFormat


init : () -> ( Model, Cmd Msg )
init flags =
    ( { time = Nothing, format = Nothing }
    , Task.perform NewFormat DateTime.localNumericDateTime
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick posix ->
            ( { model | time = Just posix }, Cmd.none )

        NewFormat fmt ->
            ( { model | format = Just fmt }, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "puzzle"
    , body =
        case ( model.time, model.format ) of
            ( Just posix, Just fmt ) ->
                let
                    format =
                        DateTime.format fmt
                in
                [ Html.div [] [ Html.text <| String.fromInt <| Time.posixToMillis <| posix ]
                , Html.div [] [ Html.text <| format posix ]
                ]

            _ ->
                [ Html.div [] [ Html.text "..." ] ]
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 1000 Tick
