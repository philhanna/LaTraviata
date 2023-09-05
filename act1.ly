\version "2.22.1"

\header {
  title = "La Traviata"
  subtitle = "(Bass Chorus Score)"
  composer = "G. Verdi"
}

global = {
  \key e \major
  \time 4/4
}

bassVoice = \relative c {
  \global
  \dynamicUp
  % Music follows here.
  
}

verse = \lyricmode {
  % Lyrics follow here.
  
}

\score {
  \new Staff \with {
    instrumentName = "Bass"
    midiInstrument = "choir aahs"
  } { \clef bass \bassVoice }
  \addlyrics { \verse }
  \layout { }
  \midi {
    \tempo 4=100
  }
}
