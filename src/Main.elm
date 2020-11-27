module Main exposing (..)

import Browser
import Html exposing (Html, a, button, div, h1, img, text)
import Html.Attributes exposing (href, src)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { greeting : String, picture : String, text : Html Msg }


init : Model
init =
    { greeting = "Welcome to My App!", picture = "Click to Start", text = splashPage }



-- UPDATE


type Msg
    = ShowPic
    | ShowText


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowPic ->
            { model | greeting = "Please choose the weather.", picture = "", text = viewofWeather }

        ShowText ->
            { model | greeting = "", picture = "", text = thankyou }



-- VIEW


view : Model -> Html Msg
view model =
    model.text


splashPage : Html Msg
splashPage =
    div []
        [ h1 [] [ text "Welcome to My App" ]
        , button [ onClick ShowPic ] [ text "Click to Start" ]
        ]


viewofWeather : Html Msg
viewofWeather =
    div []
        [ h1 [] [ text "Please Choose the Weather" ]
        , a [ onClick ShowText ] [ img [ src "/sunny.jpg" ] [] ]
        , a [] [ img [ src "/snowy.png" ] [] ]
        ]


thankyou : Html Msg
thankyou =
    div []
        [ h1 [] [ text "Thank you!" ]
        ]
