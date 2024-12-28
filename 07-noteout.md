To this point, we've been watching Max work by viewing the Max window, watching number boxes change and filling message boxes. However, it is a lot more interesting (and fun) to hear the results of our patches as music playback. This tutorial is going to focus on using the various MIDI objects to hear the results of our Max work.

# The noteout object
The simplest way to hear our work is to use the noteout object. This takes numeric data and formats it as a set of MIDI values that synthesizers (including the computer's built-in synth) can use to play a note. The way MIDI notes work requires a pair of numbers in the range of 0 to 127: the note number and a number for the velocity (i.e., how hard the note was hit). There are two types of MIDI note message: note-on and note-off messages. A note-off message is the same as a note-on, but with a velocity of zero (0). The notes always have to be produced in pairs, with a note-off to match each note-on, otherwise a note will "stick" on forever.

To make a simple random note player, build the following patch.

__img__

This is very similar to the basic random number patch from the last lesson, but with a dual connection to a noteout message. The left-hand connection creates a note-on pairing, with the random note number first followed by a velocity of 100. The right-hand connection supplies the matching note-off message, driven by a new object, pipe, that delays the numeric output by 500 milliseconds. For every note-on that is generated, this patch will generate a note-off 1/2 second later.

In this case, we are using noteout's default output device, which is your computer's built-in synthesizer. If you aren't hearing any notes being generated, you can double-click on the noteout object (when the patch is locked) to see the list of available devices. Make sure that the internal synthesizer is selected, and make sure that the synthesizer's volume is turned up within your OS.

This is quite a lot of patching to create a simple note, so we are going to immediately introduce the most important friend object for note creation: the makenote object.

# Friend object: makenote
The makenote object takes most of the drudgery out of playing generated notes. The object takes two arguments: the first is the default velocity, and the second is the default note duration (in milliseconds). Create the following patch, which should function identically to the first:

__img__

