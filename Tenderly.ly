\version "2.25.17"
\language "english"

\header {
  title = "Tenderly" 
  tagline = #f
}

\paper {
  #(set-paper-size "legal" )
}

global = {
  \key ef \major
  \numericTimeSignature \time 4/4
  \tempo 4=100
}

chordSymbols = \chordmode {
  
  s1 |
  %A
  ef:maj7 |
  af:9.11+ |
  ef:m9 |
  af:11.13 |
  
  f:m9 |
  df:9.11+ |
  ef:maj7 |
  g2:m7 c:7 |
  
  %B
  f1:m7.5- |
  bf:13 |
  f:m7.5-|
  bf2:13 b:dim7 |
  
  c1:m7 |
  f:13.11 |
  f:m7 |
  bf:7 |
  
  %A
  s1 |
  s |
  s |
  s |
  
  s |
  s |
  s |
  s |
  
  %B'
  f1:m7.5- |
  bf2:13 b:dim7 |
  c1:m7 |
  f2:13.11 fs:dim7 |
  
  g2:m7 c:7.5+ |
  f:m9 bf:7 |
  ef1:6 |
  \tweak color #(rgb-color 0.5 0.5 0.5) f2:m7 \tweak color #(rgb-color 0.5 0.5 0.5) bf:7 |
  
}

analysis = \lyricmode {
  I1 |
}

% Piano setup
upper = \relative c'' {
  \global
  \clef treble
  
  r2 r8 bf c ef |
  %A
  <d g, d>2 ~ d8 bf c ef | 
  <d gf, c, >2. bf8 gf | 
  <f df gf,>1 ~ | 
  <f c>2 r8 ef f af | \break
  
  <g ef af,>2 ~ g8 af f af | 
  <g b, f>2. ef8 cf | 
  <bf g d>1 ~ | 
  bf2 <bf e,>4 bf | \break
  
  %B
  <cf af>2. bf'4 |
  <g d>2. bf,4 |
  <cf af>2 ef4 bf' |
  <g d>2 ~ <g d>4 f | \break
  
  <ef bf>2 g4 f' |
  d2. f,4 |
  <bf ef, af,>1 ~ |
  <bf d,>2 r8 bf c ef | \break
  
  %A
  <d g, d>2 ~ d8 bf c ef | 
  <d gf, c, >2. bf8 gf | 
  <f df gf,>1 ~ | 
  <f c>2 r8 ef f af | \break
  
  <g ef af,>2 ~ g8 af f af | 
  <g b, f>2. ef8 cf | 
  <bf g d>1 ~ | 
  bf2 <bf e,>4 bf | \break
  
  %B'
  <cf af>2 ef4 bf' |
  <g d>2 ~ <g d>4 f |
  <ef bf>2 g4 f' |
  d2 ~ d8 ef c d | \break
  
  bf2 ~ bf8 c af bf |
  <g ef af,>2 ~ <g d>8 f af d, |
  <ef g,>1 |
  r | \break
  
  \bar "|."
}

lower = \relative c, {
  \global
  \clef bass
  
  r1 |   
  %A
  ef |
  <af gf'> | 
  ef | 
  <af gf'> | 
  
  f | 
  <df> | %'
  ef | 
  <g f'>2 c, | 
    
  %B
  <f ef'>1 | 
  <bf af'> | 
  <f ef'> | 
  <bf af'>2 ~ <b af'> | 
  
  c1 | 
  <f, ef' a> | 
  f | 
  <bf af'> | 
  
  %A
  ef, |
  <af gf'> | 
  ef | 
  <af gf'> | 
  
  f | 
  <df> | %'
  ef | 
  <g f'>2 c, |
  
  %B'
  <f ef'>1 | 
  <bf af'>2 ~ <b af'> | 
  c1 | 
  <f, ef' a>2 <fs' a c ef> | 
  
  <g, f'> <c e bf'> | 
  f, <bf f' af> | 
  <ef, bf'>1 | 
  r | 
}

upperPart = <<
  \new ChordNames \chordSymbols
  \new Staff \upper
>>

lowerPart = \new Staff \lower

music = \new PianoStaff \with {
  instrumentName = "Piano"
} <<
  \upperPart
  <<
    \lowerPart
  >>
>>

musicAndAnalysis = \new PianoStaff \with {
  instrumentName = "Piano"
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