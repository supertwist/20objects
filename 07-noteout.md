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

The makenote object manufactures the note-on and note-off messages necessary to support MIDI playback. We can also vary the playback by altering the velocity and duration of the notes as they are being generated. Create the following patch to make a more controllable music generator:

__img__

This is much easier to program, and much easier to understand when we look at it. You should notice that the makenote object has two additional inlets, allowing you to change the velocity and duration programmatically. Let's try out these options in the following exercise.

# Exercise
Modify the makenote playback patch in the following ways:
- Change the random object into a drunk object, and keep the note number within the range of 36 to 96.
- Using the same metro, use random objects to alter the velocity between 20 and 100, and alter the duration from 100 to 800 milliseconds.

# Related Objects: midiformat and midiout
Max includes objects for all of the MIDI message types, including CC's (continuous controllers), program changes and aftertouch. But once you venture beyond note generation, you will probably want to graduate into using a more flexible set of objects: midiformat and midiout.

The midiout object does what you would expect - it sends MIDI data to the selected device. However, it expects to receive "raw" MIDI data: an arcane binary message format that you don't even want to imagine creating. In order to format a common Max message set into raw MIDI, the midiformat object is provided.

__img__

These two objects are commonly found together, and represent the easiest way to send lots of data types to a single MIDI device. Each of the inputs to midiformat expect a different data combination; we will look at the first inlet (note input) and the third inlet (continuous controllers).

First, let's change your exercise patch to use the midiformat/midiout combination. This is a pretty straight-forward operation, except that midiformat expects a list containing the note and velocity values rather than individual values. To make this list, it is easiest to use a pack object:

__img__

Alter your patch to match, then turn on the playback. You should hear the MIDI note playback just like you did with your original patch. Now, we will add a MIDI CC message to the mix. The most universally supported MIDI CC message is for controller 7, which controls the playback volume. This is somewhat different than the velocity setting, since it controls the synth volume rather than the playback velocity of an individual note. Let's use a slider object as a volume control, and built a patch that allows us to control the synth volume:

__img__

You will notice that the various changes that occur with different velocity levels are still heard, but the overall volume of playback is changed with the slider changes. The message box connected to the slider transforms its output to a list in the form of "7 nn", where nn is the current slider volume.

I'm sure that you are already sick of hearing your random sound generation using the default piano sound. You could change this sound by connecting and using a MIDI synthesizer (and changing the patch using the front panel of the device), but we can also change the sound by sending program change messages. This uses the fourth inlet, and requires a number in the range of 0-127. A slider object is perfect for this, so let's add that to the patch to give us a change in sonic environment.

__img__

Now, using the slider, you can change the sound - giving your ears a break as needed!

*One important suggestion: turn off the metro's toggle before you close this patch. If you don't, some of your MIDI notes will surely get stuck, and you will really hate this patch!*

# Related Objects: midiin and midiparse
Just like there are noteout, ctlout and pgmout objects that we've ignored (preferring to use midiformat and midiout), there are a set of "in" objects as well. We are going to forget about all of them and focus on a flexible input pairing: midiin and midiparse.

The midiin object is the input corollary to the midiout object: it receives raw MIDI and gives it to our Max patch. Since we don't want to have to deal with raw binary MIDI code, we use the midiparse object to break things up into messages that we can use.

If you have a MIDI device connected to your computer, you can create a simple MIDI note monitor to show the notes coming into Max. It would look something like this:

__img__

Now, any incoming note will show both the note number and velocity. This is very useful when you first hook up a device and want to make sure that it is operational.

# Exercise
Extend the note monitor to show all of the MIDI messages that are received by Max. Test it with a device that produces notes, aftertouch, CC's and program changes (if you can find one).

# More Information
Once you start working with MIDI, and especially when you are working with MIDI CC's, you will want access to a list of CC's and their use. You can find all of the gritty details from the MIDI Manufacturers Association, which provides a message [spec](https://midi.org/specs) at this site.

However, when I really need a quick reference, I will almost always use the CC list found at TweakHeadz Lab or the list of commonly used CC's at [The Void](https://www.voidaudio.net/controller.html). Either of these are easier to deal with, and should help you alter the controls that you need. *Note: TweakHeadz Lab link appears to be gone.**

www.tweakheadz.com/midi_controllers.htm
http://www.voidaudio.net/controller.html
