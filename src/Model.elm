module Model exposing (..)

import Html exposing (b, div, p, text)
import Model.Date as Date
import Model.Event as Event exposing (Event)
import Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected)
import Model.Interval as Interval
import Model.PersonalDetails exposing (DetailWithName, PersonalDetails)
import Model.Repo exposing (Repo)


type alias Model =
    { personalDetails : PersonalDetails
    , events : List Event
    , selectedEventCategories : SelectedEventCategories
    , repos : List Repo
    }


academicEvents : List Event
academicEvents =
    [ { title = "Absolvirea Liceului ''Colegiul National Ioan Slavici'' "
      , interval = Interval.withDurationYears (Date.onlyYear 2017) 4
      , description = div [] [ text "Am absolvit la Colegiu National Ioan Slavici, la profilul Matematica-Informatica intensiv cu media de bac: 9.37"]
      , category = Academic
      , url = Nothing
      , tags = []
      , important = True
      }
    , { title = "Student in cadrul Facultatii de Automatica si Calculatoare"
      , interval = Interval.withDurationYears (Date.onlyYear 2021) 4
      , description = div [] [text "Specializarea ", b[][text "Calculatoare si Tehnologia Informatiei"], text "din Cluj-Napoca"]
      , category = Academic
      , url = Nothing
      , tags = []
      , important = True
      }
    ]


workEvents : List Event
workEvents =
    [ { title = "Internship "
      , interval = Interval.withDurationMonths 2022 Date.Jul 3
      , description = text "Internship in cradrul companiei Bosch"
      , category = Work
      , url = Nothing
      , tags = []
      , important = False
      }

    ]


projectEvens : List Event
projectEvens =
    [ { title = "Implementarea unei cozi de asteptare"
      , interval = Interval.withDurationMonths 2022 Date.May 1
      , description = text "Aplicatie Java"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "Calculator de polinoame"
      , interval = Interval.withDurationMonths 2022 Date.Mar 1
      , description = text "Aplicatie Java"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "Implementarea Unui sistem de gestiune a unui spitalelor"
      , interval = Interval.withDurationMonths 2021 Date.Oct 3
      , description = text "Aplicatie Java + MySQL"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
        , { title = "Memorie Virtuala interactiva"
      , interval = Interval.withDurationMonths 2023 Date.Nov 1
      , description = text "Aplicatie Java"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
       , { title = "Procesor MIPS"
      , interval = Interval.oneYear 2022
      , description = text "Aplicatie VHDL"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
      , { title = "CV Online"
      , interval = Interval.withDurationMonths 2023 Date.Nov 1
      , description = text "Aplicatie elm"
      , category = Project
      , url = Nothing
      , tags = []
      , important = True
      }
    ]

awardEvents : List Event
awardEvents =
    [ { title = "Cambridge"
      , interval = Interval.withDurationMonths 2020 Date.Jul 1 
      , description = text "Cambridge FCE"
      , category = Award
      , url = Nothing
      , tags = []
      , important = True
      }

    ]

personalDetails : PersonalDetails
personalDetails =
    { name = "Maghiar-Cionca Antoniu"
    , intro = "Student la Facultatea de Automatica si Calculatoare"
    , contacts = [ DetailWithName "email" "antoniumaghiar@gmail.com", DetailWithName "telefon" "0741197497" ]
    , socials = [ DetailWithName "facebook" "https://www.facebook.com/profile.php?id=100006295488624&locale=ro_RO", DetailWithName "github" "https://github.com/Antoniu12" ]
    }


initModel : Model
initModel =
    { personalDetails = personalDetails
    , events = Event.sortByInterval <| academicEvents ++ workEvents ++ projectEvens ++ awardEvents
    , selectedEventCategories = allSelected
    , repos = []
    }
