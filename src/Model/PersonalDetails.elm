module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
     div [] [
        h1 [id "name"][text details.name]
        , em [id "intro"][text details.intro]
        , ul[]
        (details.contacts |> List.map (\x->li [class "contact-detail"][text x.detail]))
        , ul[] 
        (details.socials |> List.map(\x->li [class "social-link"][a [href x.detail][text x.detail]]))
     ]
