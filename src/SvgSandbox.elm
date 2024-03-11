module SvgSandbox exposing (..)

import Html exposing (Html, div)
import Svg exposing (Svg, circle, rect, svg)
import Svg.Attributes exposing (cx, cy, fill, height, r, rx, ry, stroke, strokeWidth, viewBox, width, x, y)


main : Html msg
main =
    div []
        [ dice [ face_circle "60" "60" "red" ]
        , dice
            [ face_circle "35" "35" "black"
            , face_circle "85" "85" "black"
            ]
        , dice
            [ face_circle "35" "35" "black"
            , face_circle "60" "60" "black"
            , face_circle "85" "85" "black"
            ]
        , dice
            [ face_circle "35" "35" "black"
            , face_circle "35" "85" "black"
            , face_circle "85" "35" "black"
            , face_circle "85" "85" "black"
            ]
        , dice
            [ face_circle "35" "35" "black"
            , face_circle "35" "85" "black"
            , face_circle "60" "60" "black"
            , face_circle "85" "35" "black"
            , face_circle "85" "85" "black"
            ]
        , dice
            [ face_circle "35" "35" "black"
            , face_circle "35" "85" "black"
            , face_circle "85" "35" "black"
            , face_circle "85" "85" "black"
            , face_circle "35" "60" "black"
            , face_circle "85" "60" "black"
            ]
        ]


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
