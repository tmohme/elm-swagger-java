module Login exposing (Msg, Model, init, update, view)

import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (Options, onClick, onInput, onWithOptions)


type Msg
    = UserId String
    | Password String
    | Login


type alias Model =
    { userId : String
    , password : String
    , authorized : Bool
    }


init : Model
init =
    Model "" "" False


update : Model -> Msg -> Model
update model msg =
    case msg of
        UserId userId_ ->
            { model | userId = userId_ }

        Password password_ ->
            { model | password = password_ }

        Login ->
            let
                authorized_ =
                    (model.userId == model.password)
            in
                { model | authorized = authorized_ }


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "UserId", onInput UserId ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , button [ onClick Login ] [ text "Login" ]
        ]
