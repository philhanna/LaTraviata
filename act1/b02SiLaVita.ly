siLaVita = \relative c' {
  <<
    \new CueVoice \relative c' {
      \cueClef "treble"
      e2. \trill ( cis'8-. ) b-.		| %50
      a8-. r cis-. fis-. e-. r <a, a'>4->| %51
      gis'8-. e-.
      \acciaccatura { gis8 } fis4->
      e8 cis
      \acciaccatura { e8 } d8-. b-.	| %52
      \cueClefUnset
    }
    \context Voice \relative c' {
      s1*3				| %50-52
      \clef bass
    }
  >>
  \break
  r2 gis4-> r8. gis16			| %53
  fis4 d8. d16 b4 e8-. e-.		| %54
  \break
  a,4 r gis' r8. gis16			| %55
  fis4 d8. d16 b4 e8-. e-.		| %56
  \break
  a,4 r r2				| %57
}
silavitaLyrics = \lyricmode { 
  Sì, la vi -- ta s'ad -- dop -- pia__al gio -- ir.
  Sì, la vi -- ta s'ad -- dop -- pia__al gio -- ir.
}