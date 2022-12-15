-- Adapted from https://guide.elm-lang.org/architecture/buttons.html
--
-- https://elm-lang.org/examples/buttons function-specific helpers
-- lead me to https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes
-- which shows how

module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1



-- VIEW


view : Model -> Html Msg
view model =
  div 
    [ style "padding" "25%"
    , style "width" "100%"
    ]
    [ button [ style "font-size" "50px", onClick Decrement ] [ text "-" ]
    , div [ style "font-size" "250px" ] [ text (String.fromInt model)]
    , button [ style "font-size" "50px", onClick Increment ] [ text "+" ]
    ]
