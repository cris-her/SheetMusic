\version "2.25.17"
%\include "definitions.ly"
% could keep each instrument.ily file
\language "english"

\header {
  title = "My Score"
  composer = "Composer"
  subtitle = "for solo viola"
}

global = {
  \key ef \major
  \time 4/4
}

%will be instrument names
myviolin = \relative c'' {
  \global %Applying global to the variable
  ef g f f | f d bf bf
}

mycello = \relative c' {
  \global
  \clef "bass"
  d f g g | bf af f f
}

%simultaneous
%\score{
<<
\new Staff { \myviolin }
\new Staff { \mycello }
>>
%}

ives = { c4 g f f }


% Paper block //Page formating
\paper {
  #(set-paper-size "legal" )% 'landscape ... function
  top-margin = 10 
}
% legal, letter, tabloid, 11x17


\drums {
  \time 2/4
  sn16^"L" sn8_"R" sn16 sn8 sn8:32 %drum rolls with tremolo notation, at least 8
}

% staves
\relative c'
{
  <<
  \new Staff \with {instrumentName = "Oboe"} 
    { \clef "treble" \time 4/4 c2.( d8 e ) }
  \new Staff \with {instrumentName = "Cello"} 
    \mycello
  >>
}


\score {

  <<
  \relative c' %middle C
  %only one music expression
  {
    \time 2/2
    r4 c\pp-3 e8[ f,8] d'8[ e8] | %m1
    \numericTimeSignature \time 4/4
    r1^"Intense" | %m2
    <cs e>1 | %m3
    \clef alto
    \ives | %m4
    \tuplet 3/2 { f4 g f } c' c | %m5
    \clef treble
    \relative c''
    <<{ g4 b8( g) a4 g } \\ { e4 c c8 f e4 }>> | %m6
  }
  \addlyrics { Hi my name is Jack }
  >>
  %identation, spacing
  \layout { }
  \midi { }
}

\relative c'
{
  c4 g'\snappizzicato e\harmonic f | %m1
  d_\flageolet g a, f | %m2
}

%{
engrave

case sensitive
bar checks (shift + \)

DEFAULT 
is
es 
isis
eses

ENGLISH
s
f
ss
ff

\time 3/2
\numericTimeSignature \time 3/2
\tempo "Andante"
\tempo "Presto" 4 = 120

\clef alto
\key d \major

\relative -> closest to the previous note
by adding or removing quotes or commas
change the starting octave

[] to beam notes toguether manually

Tools - Quick Insert - Select note(s) - Click mark

\< manually end crescendo \!

-3 fingering

() slur

-> accent
-. staccato
\fermata

Score wizard
Save as template, new from template

LilyPond -> engrave (custom)
svg is vector graphic, Ink scape to open svg files
for your own graphic notation

Variables to break complex music expressions

Combine voices
<<{...} \\ {...}>>



Tools -> Snippets //docked
+ -> MyHeader
\version "$LILYPOND_VERSION"
\header {
  title = "title"
  composer = "composer"
  tagline = ##f
  copyright = "Copyright 2013. All Rights reserved"
}

Use custom shortcut
ctrl + backspace

Convert selected pitches into Quintuplet
\tuplet 5/4 {$SELECTION}


New from template -> Basic Leadsheet [chords]

View -> Folding -> Enable
View -> Line numbers


Edit -> Preferences -> Tools --> Magnifier size 250/scale 250
CTRL + Click to enable magnification


Snapshot, right click/drag Copy to image
Right clic and Edit in place
Tools -> documentation browser
Edit -> Replace
Tools -> pitch -> convert relative to absolute
Tools -> rythms -> double durations
Tools -> pitch -> transpose .. c ef
Tools -> quick remove -> remove articulations


2.0.11
Tools -> Preview Options -> select some .. docked

Dimond shape or circle above/below
Natural harmonic \harmonic \flageolet
Artifitial harmonic 
one normal note head that indicates stopped position
other open diamand indicates harmonic position

No duration dots by defaults
property first
\set harmonicDots = ##t

Snapped pizz - bartok
\snappizzicato


https://code.google.com/archive/p/lilypond/
for label:Fixed_2_xx_xx

Lilypond -> Auto-engrave
Tools -> SVG viewer



Score (output) is top level expression like \book or \paper

-version
-header
-optional tweaks
-definitions (instrumentation, vars for sections/all music)
-score (compound music expression)

\layout block
\midi block
\new staff with instrument name



\book {
\score {
\new Staff {
\new Voice {
\relative c'' {
c4 a b c
        }
      }
    }
/layout{}
  }
}

Insert -> score


Solarized color schemes
Edit -> Preferences -> Fonts

Editor preferences -> Highlighting options -> 2 sec

Auto engrave .. Tools -> Hide automatic engraving jobs


MIDI Settings.
Player output
Input
Enable close unused

Tools midi input
Chord mode
Relative mode capturing

For player the section can be moved to listen

\break for line breaks

https://lilypond.org/doc/v2.23/Documentation/notation/chord-name-chart
https://lilypond.org/doc/v2.23/Documentation/notation/displaying-chords

Common Jazz Chord Notations
Major: c1 (C major)
Minor: c:m1 (C minor)
Dominant 7th: c:7 (C7)
Major 7th: c:maj7 (Cmaj7)
Minor 7th: c:m7 (Cm7)
Half-Diminished (Minor 7 flat 5): c:m7.5- (Cm7♭5)
Diminished: c:dim (Cdim or C°)
Augmented: c:aug (Caug or C+)
Suspended 4th: c:sus4 (Csus4)
Suspended 2nd: c:sus2 (Csus2)
9th Chord: c:9 (C9)
Minor 9th: c:m9 (Cm9)
Major 9th: c:maj9 (Cmaj9)
Dominant 13th: c:13 (C13)
Minor 13th: c:m13 (Cm13)
Major 13th: c:maj13 (Cmaj13)
c:13.9- | % C 13 flat 9

https://lilypond.org/doc/v2.24/Documentation/notation/common-chord-modifiers

\tweak color #(rgb-color 0.5 0 0.5) b % purple

https://lilypond.org/doc/v2.25/Documentation/notation/lyrics-and-repeats

%}
%