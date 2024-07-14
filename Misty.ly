\version "2.25.17"
\language "english"

\header {
  title = "Misty" 
  tagline = #f
}

% Paper block //Page formating
\paper {
  #(set-paper-size "legal" )% 'landscape ... function
  %top-margin = 10 
}
% legal, letter, tabloid, 11x17

chordSymbols = \chordmode {
  s1 |% Use a skip to indicate no chord for a whole measure
  %A
  \repeat volta 2 {
    ef1:maj7 |
    bf2:m7 ef2:13.9- |
    af1:maj7 |
    af2:m9 df:13.11 |
    ef:maj7 c:m7 |
    f:m7 bf:7 |
  }
  \alternative {
    {
      g2:7 c:7 |
      f:m7 bf:13.11
    }
    % A'
    {
      ef2:6 bf:9sus4 |
      ef1:6
    }
  }
  %B
  bf2:m7 bf:m7+ |
  bf:m7 ef2:13.9- |
  af1:maj7 |
  af:6 | %m4
  a:m11 |
  d2:7.9+ f:7 |
  bf:7 e:dim7 |
  f:m7 bf:13.11 |
  
  %A
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  s1 |
  ef1:6 |
  \tweak color #(rgb-color 0.5 0.5 0.5) f2:m7 \tweak color #(rgb-color 0.5 0.5 0.5) bf:7 | % gray 
}

analysis = \lyricmode {
  |
  %A
  I |
  ii/IV V/IV |
  IV |
  (backdoor ii-V) |  
  I vi |
  ii V |
  
  III VI |
  ii V |
  %A'
  I V |
  I |
  
  %B
  ii/IV |
  _ V/IV |
  IV |
  _ |
  ii/III |
  V/III (backdoor_V) |
  ii/? V/? |
  ii V |
  
  %A
  _ |
  _ _ |
  _ |
  _ _ | 
  _ _ | 
  _ _ | 
  I________________(ii-V) |
}

% Piano setup
upper = \relative c'' {
  \clef treble
  \key ef \major
  \numericTimeSignature \time 4/4
  
  r2. bf8-1 g-13 | % anacrusis
  % A
  \repeat volta 2 {
    < d-7 g,-3 >2. bf8-1 c-2 | %1
    df8-3 c'-9 c c <c-6 g-3 df-7> bf-5 g-3 ef-1 | 
    c2-3 \tuplet 3/2{r8 g-7 af-1} \tuplet 3/2{c8-3 ef-5 g-7}  | %3
    <bf-9 gf-7 cf,-3>8 bf bf af-1 <bf-6 f-3 cf-7>4. af8-5 | %m4
    
    <g-3 d-7 g,-3>4 ~ \tuplet 3/2{g8 af-4 bf-5} <ef,-3 bf-7>4 ~ \tuplet 3/2{ef8 f-4 g-5} | %5
    <af-3 ef-7 af,-3>8 c,4-5 c8 \tuplet 3/2{d4-3 ef-4 f-5} | %6
  }
  \alternative {
    {
      <g-1 b,-3>2 <e-3 bf-7> |%7
      <ef-7 a,-3>2 <d-3 af-7>4 bf'8-1 g-13| %m8
    }
    % A'
    {
      <ef-1 c-6 g-3>2 <ef-4 c-9 af-7> |%7
      \tuplet 3/2{<c-6 g-3>4 ef-1 f-2} \tuplet 3/2{g-3 bf-5 c-6} | \break %m8
    }
  }
  

  % B
  df8-3 df df df ~ df2 ~ |
  df4 df8 ef8-4 \tuplet 3/2{ff4-9 ef-1 df-7} |
  <c-3 g-7 c,-3>8 c c c ~ c2 | %m3
  \tuplet 3/2{<c,-3 f,-6>4 ef-5 f-6} \tuplet 3/2{af-1 bf-2 c-3} | \break
  
  <d-11 g,-7 c,-3>8 d d d ~ d2 ~ |
  d8-1 d d c-7 \tuplet 3/2{<f-1 a,-3>4 d-6 c-5} |
  <bf-1 d,-3>2 <bf df, bf> |
  <bf-11 ef,-7 af,-3> d,4-3 bf'8-1 g-13 | \break
  
  % A
  < d g, >2. bf8 c | %1
  df8 c' c c <c g df> bf g ef | 
  c2 \tuplet 3/2{r8 g af} \tuplet 3/2{c8 ef g}  | %3
  <bf gf cf,>8 bf bf af <bf f cf>4. af8 | %m4
  
  <g d g,>4 ~ \tuplet 3/2{g8 af bf} <ef, bf>4 ~ \tuplet 3/2{ef8 f g} | %5
  <af ef af,>8 c,4 c8 \tuplet 3/2{d4 ef f} | %6
  ef1-1 ~ |%7
  ef| %m8
  \bar "|."
}

lower = \relative c, {
  \clef bass
  \key ef \major
  \numericTimeSignature \time 4/4
  
  r1 | % anacrusis
  % A
  \repeat volta 2 {
    ef1 |
    <bf' af'-7>2 ef, | %2
    <af g'-7>1 | 
    af2 df, | \break %m4
    ef c |
    f <bf af'-7> | %6
  }
  \alternative {
    {
      <g f'-7> c, |
      f bf | %8
    }
    % A'
    {
      ef, bf' |
      ef,1 | \break%8
    }
  }
  
  % B
  <bf' af'-7>2 ~ <bf a'>2  |
  <bf af'>2 <ef g-3 df'-7> |
  af,1 |
  af | \break
  a |
  <d fs-3 c'-7>2 <f, ef'-7> |
  <bf f'-5 af-7> <e g> |
  <f, c'-5 g'-9>2 <bf f'-5 af-7> | \break
  
  % A
  ef,1 |
  <bf' af'>2 ef, | %2
  <af g'>1 | 
  af2 df, | \break %m4
  ef c |
  f <bf af'> | %6
  ef,1 ~ |
  ef | %8
  \bar "|."
}

music = \new PianoStaff \with {
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
    >>
  >>

musicAndAnalysis = \new PianoStaff \with {
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

% Score blocks
\score {
  \musicAndAnalysis
  \layout { 
    \context {
      \ChordNames
      % This context is necessary to allow the tweaks
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
    \tempo 4=80
  }
}