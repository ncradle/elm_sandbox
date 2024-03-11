module RandomDice exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Random
import Svg exposing (Svg, circle, rect, svg)
import Svg.Attributes exposing (cx, cy, fill, height, r, rx, ry, stroke, strokeWidth, viewBox, width, x, y)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { dieFace : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model 1
    , Cmd.none
    )



-- UPDATE


type Msg
    = Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model
            , Random.generate NewFace (Random.int 1 6)
            )

        NewFace newFace ->
            ( Model newFace
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Roll ] [ text "Roll" ]
        , dice_svg model.dieFace
        ]


dice_svg : Int -> Html Msg
dice_svg num =
    case num of
        1 ->
            dice_1

        2 ->
            dice_2

        3 ->
            dice_3

        4 ->
            dice_4

        5 ->
            dice_5

        6 ->
            dice_6

        _ ->
            dice_none


dice_1 : Html Msg
dice_1 =
    dice [ face_circle "60" "60" "red" ]


dice_2 : Html Msg
dice_2 =
    dice
        [ face_circle "35" "35" "black"
        , face_circle "85" "85" "black"
        ]


dice_3 : Html Msg
dice_3 =
    dice
        [ face_circle "35" "35" "black"
        , face_circle "60" "60" "black"
        , face_circle "85" "85" "black"
        ]


dice_4 : Html Msg
dice_4 =
    dice
        [ face_circle "35" "35" "black"
        , face_circle "35" "85" "black"
        , face_circle "85" "35" "black"
        , face_circle "85" "85" "black"
        ]


dice_5 : Html Msg
dice_5 =
    dice
        [ face_circle "35" "35" "black"
        , face_circle "35" "85" "black"
        , face_circle "60" "60" "black"
        , face_circle "85" "35" "black"
        , face_circle "85" "85" "black"
        ]


dice_6 : Html Msg
dice_6 =
    dice
        [ face_circle "35" "35" "black"
        , face_circle "35" "85" "black"
        , face_circle "85" "35" "black"
        , face_circle "85" "85" "black"
        , face_circle "35" "60" "black"
        , face_circle "85" "60" "black"
        ]


dice_none : Html Msg
dice_none =
    dice []


svg_view : List (Svg.Attribute msg)
svg_view =
    [ width "120"
    , height "120"
    , viewBox "0 0 120 120"
    ]


face_rect : Svg msg
face_rect =
    rect
        [ x "10"
        , y "10"
        , width "100"
        , height "100"
        , rx "15"
        , ry "15"
        , fill "white"
        , stroke "black"
        , strokeWidth "2"
        ]
        []


face_circle : String -> String -> String -> Svg msg
face_circle x y color =
    circle
        [ cx x
        , cy y
        , r "10"
        , fill color
        ]
        []


dice : List (Svg msg) -> Html msg
dice face_circles =
    svg
        svg_view
        (face_rect :: face_circles)
