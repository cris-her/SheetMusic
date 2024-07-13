\version "2.25.17"
\language "english"

\header {
  title = "Misty"
  tagline = #f
}

chordSymbols = \chordmode {
  s1 |% Use a skip to indicate no chord for a whole measure
  %A
  ef1 |
  bf2 ef2 |
  af1 |
  af1 |
}

analysis = \lyricmode {
  |
  %A
  I |
  ii/IV V/IV |
  IV |
  iv
}

% Piano setup
upper = \relative c'' {
  \clef treble
  \key ef \major
  \numericTimeSignature \time 4/4
  
  r2. bf8 g | % anacrusis
  % A
  \repeat volta 2 {
    < d g, >2. bf8 c | %1
    df8 c' c c <c g df> bf g ef | 
    c2 \tuplet 3/2{r8 g af} \tuplet 3/2{c8 ef g}  | %3
    <bf gf cf,>8 bf bf af <bf f cf>4. af8 | %m4
    
    <g d g,>4 ~ \tuplet 3/2{g8 af bf} <ef, bf>4 ~ \tuplet 3/2{ef8 f g} | %5
    <af ef af,>8 c,4 c8 \tuplet 3/2{d4 ef f} | %6
  }
  \alternative {
    {
      <g b,>2 <e bf> |%7
      <ef a,>2 <d af>4 bf'8 g| %m8
    }
    % A'
    {
      <ef c g>2 <ef c af> |%7
      \tuplet 3/2{<c g>4 ef f} \tuplet 3/2{g bf c} | \break %m8
    }
  }
  

  % B
  df8 df df df ~ df2 ~ |
  df4 df8 ef8 \tuplet 3/2{ff4 ef df} |
  <c g c,>8 c c c ~ c2 | %m3
  \tuplet 3/2{<c, f,>4 ef f} \tuplet 3/2{af bf c} | \break
  
  <d g, c,>8 d d d ~ d2 ~ |
  d8 d d c \tuplet 3/2{<f a,>4 d c} |
  <bf d,>2 <bf df, bf> |
  <bf ef, af,> d,4 bf'8 g | \break
  
  % A
  < d g, >2. bf8 c | %1
  df8 c' c c <c g df> bf g ef | 
  c2 \tuplet 3/2{r8 g af} \tuplet 3/2{c8 ef g}  | %3
  <bf gf cf,>8 bf bf af <bf f cf>4. af8 | %m4
  
  <g d g,>4 ~ \tuplet 3/2{g8 af bf} <ef, bf>4 ~ \tuplet 3/2{ef8 f g} | %5
  <af ef af,>8 c,4 c8 \tuplet 3/2{d4 ef f} | %6
  ef1 ~ |%7
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
    <bf' af'>2 ef, | %2
    <af g'>1 | 
    af2 df, | \break %m4
    ef c |
    f <bf af'> | %6
  }
  \alternative {
    {
      <g f'> c, |
      f bf | %8
    }
    % A'
    {
      ef, bf' |
      ef,1 | \break%8
    }
  }
  
  % B
  <bf' af'>2 ~ <bf a'>2  |
  <bf af'>2 <ef g df'> |
  af,1 |
  af | \break
  a |
  <d fs c'>2 <f, ef'> |
  <bf f' af> <e g> |
  <f, c' g'>2 <bf f' af> | \break
  
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
    \addlyrics \analysis
    >>

  >>

% Score blocks
\score {
  \music
  \layout { }
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
    \tempo 4=100
  }
}