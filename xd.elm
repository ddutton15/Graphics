module First exposing (..)

import GraphicSVG exposing (..)
import GraphicSVG.App exposing (..)
import Tuple exposing (..)

type Msg = Tick Float GetKeyState 

main = gameApp Tick { model = init, title = "My Title", view = view, update = update }

init = { time = 0, velocity = (2,3), position = (0,0)  }

view model = collage 192 128
  [ square 2000.0
        |> filled (rgb 230 125 50)
      ,circle 100.0
        |> filled yellow
        |> move  (0.0, (-50.0))
      ,rect 2000.0 35.0
        |> filled blue
        |> move (0.0, (-20.0))
      ,rect 2000.0 30.0
        |> filled blue
        |> move (0.0, (-50.0))
      ,oval 30.0 15.0
        |> filled grey 
        |> move ((-70.0), 40.0)
      ,circle 10.0
        |> filled grey
        |> move ((-70.0), 45.0)
      ,oval 30.0 15.0
        |> filled grey
        |> move (70.0, 40.0)
      ,circle 10.0
        |> filled grey
        |> move (70.0, 45.0)
      ,circle 11
        |> filled darkBrown
        |> scale 1
        |> scaleX 2
        |> scaleY 2
      ,triangle 10
        |> filled darkBrown
        |> scale 2
        |> scaleX 2
        |> scaleY 2
        |> rotate (degrees 90)
        |> move (0.0, (-25.0))
      ,circle 6
        |> filled black
        |> move ((-10.0), 4.0)
      ,circle 6
        |> filled black
        |> move (10.0, 4.0)
      ,circle 4
        |> filled darkCharcoal
        |> move ((-8.0), 4.0)
      ,circle 4
        |> filled darkCharcoal
        |> move (8.0, 4.0)
      ,circle 3
        |> filled white
        |> move ((-11.0), 6.0)
      ,circle 3
        |> filled white
        |> move (11.0, 6.0)
      ,triangle 3
        |> filled black  
        |> rotate (degrees 30)
        |> move (0.0, (-2.0))
      ,rect 1 3
        |> filled darkCharcoal
        |> scale 1
        |> move (0.0, (-5.0))
      ,rect 1 3
       |> filled darkCharcoal
       |> scale 1
       |> rotate (degrees 30)
       |> move (1.0, (-7.5))
      ,rect 1 3
       |> filled darkCharcoal
       |> scale 1
       |> rotate (degrees -30)
       |> move ((-1.0), (-7.5))
      ,rect 1 3
       |> filled darkCharcoal
       |> scale 2
       |> rotate (degrees -60)
       |> move (8.0, 12.0)
     ,rect 1 3
       |> filled darkCharcoal
       |> scale 2
       |> rotate (degrees 60)
       |> move ((-8.0), 12.0)


      ,text "HELLO WORLD!"
        |> filled (rgb 230 125 50)
        |> scale 0.5
        |> scaleX 2
        |> scaleY 2
        |> move ((-45.0), 25.0)
    ]

update msg model =
    case msg of
        Tick t _ -> model
        -- Tick t _ -> { model | time = t, position = newPos (t - model.time) model.position model.velocity }

newPos deltaT (x,y) (vx,vy) = (x + deltaT * vx, y + deltaT * vy)