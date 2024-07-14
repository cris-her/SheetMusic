\version "2.25.17"
\language "english"

\header {
  title = "Tune up" 
  tagline = #f
}

\paper {
  #(set-paper-size "legal" )
}

global = {
  \key d \major
  \numericTimeSignature \time 4/4
  \tempo 4=120 %100 - 120
}

chordSymbols = \chordmode {
  
  \repeat volta 2 {
    %A
    e1:m7 | 
    a:7 | 
    d:maj7 | 
    s | 
    
    d:m7 |
    g:7 |
    c:maj7 | 
    s | %m8
    
    %B
    c:m7 |
    f:7 |
    bf:maj7 |
    ef:maj7 |
  }

  \alternative {
    {
      e1:m7 |
      f:7 |
      bf:maj7 |
      a:7 |
    }
    {
      e1:m7 |
      a:7 |
      d:maj7 |
      \tweak color #(rgb-color 0.5 0.5 0.5) e2:m7 \tweak color #(rgb-color 0.5 0.5 0.5) a:7 |
    }
  }
  
}

analysis = \lyricmode {
  %A
  ii1 |
  V |
  I_ |
  
  ii/bVII |
  V/bVII |
  bVII_ |
  
  %B
  ii/bVI |
  V/bVI |
  bVI |
  IV/bVI |
  
  ii |
  V/bVI |
  bVI |
  V |
  
  ii |
  V |
  I |
  (ii V) |
}

% Piano setup
upper = \relative c'' {
  \global
  \clef treble

  \repeat volta 2 {
    %A
    <a-4 d,-7 g,-3>2. g4-3 |
    <ef-5 cs-3 g-7>2 e-5 |
    <fs-3 cs-7 fs,-3>1 ~ |
    <fs cs fs,> | \break
    
    <g-4 c,-7 f,-3>2. f4-3 |
    <cs-11 b-3 f-7>2 d-5 |
    <e-3 b-7>1 ~ |
    <e b>2. e4 | \break
    
    %B
    <ef-3 bf-7>1 ~ |
    <ef-7 a,-3>4 ef f-1 g-2 |
    <d'-3 a-7 d,-3>1 ~ |
    <d-7 g,-3 d-7>2 d4 c-6 | \break
  }
  
  \alternative {
    {
      <a-11 d,-7 g,-3>1 ~ |
      <a-3 ef-7 a,-3>4. g8-2 a c-5 a g |
      <a-7 d,-3>1 |
      <fs-13 cs-3 b-9 g-7>2 r8 c'4-3 bf8-9 | \break
    }
    {
      <a-11 d,-7 g,-3>1 ~ |
      <a-1 cs,-3 g-7>1 |
      <fs-3 cs-7 fs,-3>1 |
      <fs-9 d-7 b-5 g-3>2 <fs-13 cs-3 b-9 g-7>2 |
    }
  } 
 
  \bar "|."
}

lower = \relative c, {
  \global
  \clef bass
  
  \repeat volta 2 {
    %A
    e1 | 
    a | 
    d, ~ | 
    d | 
    
    d |
    g |
    c, ~ |
    c |
    
    %B
    c' |
    f, |
    bf |
    ef, |
  }

  \alternative {
    {
      e1 |
      f |
      bf |
      a1 |
    }
    {
      e1 |
      a |
      d, |
      e2 a |
    }
  }
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