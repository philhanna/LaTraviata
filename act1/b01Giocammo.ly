giocammo = \relative c' {
  <<
    \new CueVoice \relative c'' {
      \cueClef "treble"
      b2. \trill ( gis'8-. ) fis-.	| %30
      e8-. r gis-. cis-. b8-. r <e, e'>4->	| %31
      dis'8-. b-. _\markup \small \italic
      "Tenors: Dell' invito ..."
      \acciaccatura { dis8 } cis4->
      b8-. d-. \acciaccatura { b8 } a4->	| %32
      gis8-. _\markup \small \italic
      "voi tardaste?"
      e-. fis-. b,-. e8-. r r4	| %33
      \cueClefUnset
    }
    \context Voice {
      s1*4				| %30-33
    }
  >>
  \break
  r4 r8 b b4 b8 b			| %34
  cis8 b r4 b8 r e r			| %35
  dis8 r cis8. cis16 b8 r a8. a16	| %36
  gis4 r4 r2 				| %37
}

giocammoLyrics = \lyricmode {
  Gio cam -- mo da Flo -- ra,
  e gio -- can -- do quel -- l'o -- re vo -- lar.
}