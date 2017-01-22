module Main exposing (..)

import Html exposing (Attribute, Html, a, body, br, button, div, h2, img, li, nav, p, program, span, text, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (Options, onClick, onWithOptions)
import Json.Decode as Decode


-- own Modules

import Login


-- Types


type Msg
    = MainMsg NavMsg
    | LoginMsg Login.Msg



--    | ConversationMsg
--    | UrlChange Location


type NavMsg
    = ToHome



--    | ToSearch
--    | ToConversation


type Page
    = Login



--    | Search
--    | Conversation


targetPage : NavMsg -> Page
targetPage navMsg =
    case navMsg of
        ToHome ->
            Login



--    ToSearch -> Search
--    ToConversation -> Conversation
-- APP


main : Program Never AppModel Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \model -> Sub.none
        }



-- MODEL


type alias AppModel =
    { currentPage : Page
    , loginModel : Login.Model
    }


initialModel : AppModel
initialModel =
    { currentPage = Login
    , loginModel = Login.init
    }


init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        MainMsg navMsg ->
            navigate navMsg model

        LoginMsg loginMsg ->
            let
                loginModel_ =
                    Login.update model.loginModel loginMsg
            in
                ( { model | loginModel = loginModel_ }, Cmd.none )


navigate : NavMsg -> AppModel -> ( AppModel, Cmd Msg )
navigate navMsg model =
    ( { model | currentPage = targetPage navMsg }, Cmd.none )



-- VIEW


view : AppModel -> Html Msg
view model =
    case model.currentPage of
        Login ->
            Html.map LoginMsg (Login.view model.loginModel)



--    Search -> Html.map SearchMsg (Login.view model.loginModel)
