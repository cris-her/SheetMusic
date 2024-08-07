\version "$LILYPOND_VERSION"
\language "english"

\header {
  title = "Title" 
  tagline = #f
}

\paper {
  #(set-paper-size "legal" )
}

global = {
  \key c \major
  \numericTimeSignature \time 4/4
  \tempo 4=80
}

chordSymbols = \chordmode {
  c1 |
}

analysis = \lyricmode {
  I1 |
}

% Piano setup
upper = \relative c'' {
  \global
  \clef treble
  
  c1 |
  \bar "|."
}

lower = \relative c, {
  \global
  \clef bass
  
  c1 | 
}

upperPart = <<
  \new ChordNames \chordSymbols
  \new Staff \upper
>>

lowerPart = \new Staff \lower

music = \new PianoStaff \with {
    instrumentName = "Piano"
    midiInstrument = "piano"
  } <<
    \upperPart
    <<
      \lowerPart
    >>
  >>

musicAndAnalysis = \new PianoStaff \with {
    instrumentName = "Piano"
    midiInstrument = "piano"
  } <<
    \upperPart
    <<
      \lowerPart
      \addlyrics \analysis
    >>
  >>

\score {
  \musicAndAnalysis
  \layout { 
    \context {
      \ChordNames
      \override ChordName.color = #black
    }
  }
}

\score {
  \unfoldRepeats {
    \music
  }
  \midi {
    \context {
      \ChordNames
      \remove "Staff_performer"
    }
  }
}