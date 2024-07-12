\version "2.25.17"

\header {
  title = "Misty"
  tagline = #f
}

% Piano setup
upper = \relative c'' {
  \clef treble
  \key c \major
  \numericTimeSignature \time 4/4
  
  f4 g( a b) |
  g4 g e e |
}

lower = \relative c {
  \clef bass
  \key c \major
  \numericTimeSignature \time 4/4
  
  a2 c |
  a2 c |
  a2 c |
  a2 c | \break
  < f, a b c >1 |
}

% Score block
\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
    midiInstrument = "piano"
  } <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout {}
  \midi {}
}