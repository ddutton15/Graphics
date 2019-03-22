module First exposing (..)

import GraphicSVG exposing (..)
import GraphicSVG.App exposing (..)
import Tuple exposing (..)

type Msg = Tick Float GetKeyState 

main = gameApp Tick { model = init, title = "My Title", view = view, update = update }

init = { time = 0, velocity = (2,3), position = (0,0)  }

frontFlipper model = 
    curve (0,0) [Pull (3,10) (-15,13)]
      |> filled lightGreen
      |> rotate (degrees <| 15 + (15 * (cos (2*model.time))))
      |> scale 1.8
      |> move (-15.0, 10.0)

backFlipper model =
  group
    [ curve (0,0) [Pull (-2,-10) (-10,-10)]
      |> filled lightGreen
      |> scale 2
      |> move (-15.0, -17.0)
    , curve (0,0) [Pull (-2,2) (-10,-10)]
      |> filled lightGreen
      |> scale 2
      |> move (-15.0, -17.0)
    ] |> rotate (degrees <| 5 + (8 * (cos (2*model.time))))

head model = group
  [ oval 10 15
      |> filled lightGreen
      |> scale 1.1
      |> scaleX 2
      |> move (0.0, 32.0 + 0.5 * cos (2*model.time))
  ,circle 10
    |> filled darkCharcoal
    |> scale 0.15
    |> move (-5.0, 35.0 + 0.5 * cos (2*model.time))
  ,circle 10
    |> filled darkCharcoal
    |> scale 0.15
    |> move (5.0, 35.0 + 0.5 * cos (2*model.time))
  ] 

view model = collage 192 128
    [ frontFlipper model
    , mirrorX (frontFlipper model)
    , backFlipper model
    , mirrorX (backFlipper model)
    , head model
     ,roundedRect 10 15 5
      |> filled lightGreen
      |> scale 2
      |> scaleX 2
      |> scaleY 1.8

     ,roundedRect 10 15 5
      |> outlined (solid 1) darkGreen
      |> scale 1.8
      |> scaleX 1.85
      |> scaleY 1.85

     ,ngon 5 10
      |> outlined (solid 1) darkGreen
      |> scale 1

     ,line (0,0) (5,0)
       |> outlined (solid 1) darkGreen
       |> move (10.0, 0.0)

     ,line (-6.5,-9.4) (5,-18)
       |> outlined (solid 1) darkGreen
       |> move (10.0, 0.0)

      ,line (-7,9) (5,18)
       |> outlined (solid 1) darkGreen
       |> move (10.0, 0.0)

      ,line (-17.8,-5.5) (-24,-20)
       |> outlined (solid 1) darkGreen
       |> move (10.0, 0.0)

      ,line (-17.8,6) (-27,13)
       |> outlined (solid 1) darkGreen
       |> move (10.0, 0.0)

  
    ]

update msg model =
    case msg of
        Tick t _ -> { model | time = t } 
        -- Tick t _ -> { model | time = t, position = newPos (t - model.time) model.position model.velocity }

newPos deltaT (x,y) (vx,vy) = (x + deltaT * vx, y + deltaT * vy)