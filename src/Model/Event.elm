module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval, compare)
import Model.Util exposing (chainCompare)
import List exposing (sort)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"

compareByInterval a b =
    Interval.compare a.interval b.interval

sortByInterval : List Event -> List Event
sortByInterval events =
    List.sortWith compareByInterval events
    --Debug.todo "Implement Event.sortByInterval"

eventImportant: Bool -> String
eventImportant eventType =
    if eventType then 
        "event event-important" 
    else 
        "event"

view : Event -> Html Never
view event =
     div [class <| eventImportant <| event.important] [
        h2 [class "event-title"][text event.title]
        ,ul[][
        div [class "event-description"][event.description]
        ,div [class "event-category"][categoryView event.category]
        ,div [class "event-interval"][Interval.view event.interval]
        , case event.url of
            Just url -> div [class "event-url"][a [href url][text url]]
            Nothing ->  div[][]
        ]
     ]
    --Debug.todo "Implement the Model.Event.view function"
