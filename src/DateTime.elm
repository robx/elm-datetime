module DateTime exposing
    ( DateTimeFormat, localNumericDateTime
    , format
    )

{-| A library for formatting dates in a locale sensitive way.

This module binds to
[Intl.DateTimeFormat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat).


# Create

@docs DateTimeFormat, localNumericDateTime


# Formatting Dates

@docs format

-}

import Elm.Kernel.DateTime
import Maybe exposing (Maybe)
import Time exposing (Posix)


{-| A DateTimeFormat object, for formatting dates in a language sensitive way.
-}
type DateTimeFormat
    = DateTimeFormat


{-| Create a DateTimeFormat using user locale and timezonerules.
-}
localNumericDateTime : DateTimeFormat
localNumericDateTime =
    Elm.Kernel.DateTime.localNumericDateTime ()


{-| Format a Date according to the rules of the DateTimeFormat.
-}
format : DateTimeFormat -> Posix -> String
format dateTimeFormat posix =
    Elm.Kernel.DateTime.format dateTimeFormat (Time.posixToMillis posix)
