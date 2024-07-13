\version "2.25.17"

\header {
  title = "Misty"
  tagline = #f
}

analysis = \lyricmode {
  ii V |
  i i
}

chordSymbols = \chordmode {
  c1
  r1
  g1
  R1
  c1
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
    %instructs to use GM MIDI piano sound
    midiInstrument = "piano"
  } <<
    <<
    %\chords { c2 g:sus4 f e }
    \new ChordNames \chordSymbols
    \new Staff \upper
    >>
    <<
    \new Staff \lower
    \addlyrics \analysis
    >>

  >>
  \layout {}
  \midi {}
}