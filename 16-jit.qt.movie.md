> [!NOTE]
> In modern versions of Max, the `jit.qt.movie` object is deprecated, and has been replaced by `jit.movie`. If you are replicating any of the examples below, you can remove the .qt part of jit.qt.movie.

# The fundamentals of Quicktime Movies
Well, it's time to enter the brave world of visuals. In Max, this is primarily done using the objects that are part of the Jitter package. Most of these objects start with a prefix of `jit.`, so are easily identified when you are looking at help files and documentation.

We are going to start with video content. The video playback system depends on Apple's QuickTime environment being installed on your system, and uses QuickTime for both video conversion and movie playback. In order to use QuickTime movies, we need to understand a few things about them.

Movie files will have a number of pre-defined internal settings. They have a size (height and width), duration and a frame rate (the number of frames per second that they contain). The movie will also use a "codec" that is used to determine the storage format and (optional) compression that is used to store the visual data. This is all information that is used to play back the record and/or play back the video data, and will be used by Jitter for movie manipulation.

# The `jit.qt.movie` object
With that slight introduction, let's take a look at our first object: the `jit.qt.movie` object. As its name implies, it is a Jitter object (jit.), works with QuickTime (qt.) and plays a movie. In order to make it work, we need to surround it with a few extra Max objects. Create this patch:

**img-01**

One of the things you should notice is that a `jit.qt.movie` object depends on getting `bang` message. The `metro` object produces those bangs, which tells the `jit.qt.movie` object to send out the movie frame. Since we are assuming that any movie file will produce no more than 30 frames/second, we use 33 as a convenient `metro` time. You should also notice that our `jit.qt.movie` object has a pair of numbers as arguments. These numbers represent the output size of the movie that will be produced. If the source material is not the same size, it will be converted into the size shown by the arguments. These arguments represent the width and height of the visuals that will be produced.

When you click on the `read` messagebox, you will get a dialog for selecting a movie file. You can find a number of movie files in the "patches" folder that comes with Max: the media folder contains a number of different types of media that Jitter can work with. Select the movie file called "blading.mov" to be loaded.

**img-02**

> [!NOTE]
> In modern versions of Max on the Apple OS, the patches folder is hidden within the application package:
> `user/Applications/Max.app/Contents/Resources/C74/media/jitter/bball.mov`
> But, you can navigate to any handy quicktime file using the `open` dialog. And, even more easily, you can access the sample movies from the video browser icon in the left margin of the Max window:
> **img-02b**
> This adds a `jit.playlist` object to the patch which can be viewed when connected to a `jit.pwindow` object, which we'll look at in the next section.
> **img-02c**

Regardless of the settings of the rest of the patch, you will immediately begin to hear the output of the movie. That is because the movie automatically starts whenever it is loaded. If the `metro` is turned on, you will find that the movie continuously loops, since looping is on by default. Finally, and most importantly, you will notice that we can't see anything; that's because we don't have the output of the `jit.qt.movie` object connected to any display window. Let's do that now.

# The `jit.pwindow` object
There are two display windows that we can use - in this case, we will use the `jit.pwindow` object. This is the icon with the small cat with eyeglasses; it creates a window in our patch that will display the output of the movie object.

**img-03**

The window starts off with a default (and rather small) size; you can resize it to make a more visible viewer. As with other objects, you can do this by grabbing the handle at the lower-right and dragging it to the appropriate size. You don't have to worry about matching the size of the `jit.qt.movie` object; the movie will resize to fit properly in the screen. What you will want to pay attention to is the aspect ratio of the pwindow - otherwise, the movie output will appear warped.

Once you've resized the `jit.pwindow`, you can hook up a patchcord between the `jit.qt.movie` object and the `pwindow`. If the `metro` object is running, you will immediately see the output of the movie that is currently playing.

**img-04**

There are a few things we should understand about this patch. First, the patchcord that connects the `jit.qt.movie` and the `jit.pwindow` is a curiously fuzzy/green version - similar to an MSP patchord, but a different color. This gives us a visual clue that this patchcord is carrying a different "load" than a normal patchcord.

If we connect up a green Jitter patchcord to a print object, we will see that the Max window doesn't try to display an image (it couldn't even if we wanted it to). Instead, it displays a very curious string of characters:

**img-05**

These characters represent a "pointer" to a block of data that is a video frame. Rather than sending the whole graphical frame from one object to the next, Max/Jitter creates a storage spot for the frame, then just passes the name of the frame from one object to the next. This is an efficient way for the system to move data around without overwhelming the computer with data transfer overhead.

# Movie Control
Now that we have a movie playing, the next step is to control its playback. We are going to change our initial patch a little to support better video playback. Can you see a difference in this patch?

**img-06**

Hopefully you saw that the `metro` object was changed to a `qmetro`...

# Friend object: `qmetro`
The `qmetro` object is a "Jitter-aware" version of `metro`; if Jitter becomes too backed up with video processing demands, the `qmetro` will wait (defer) its bang message until the Jitter system is done processing the previous request. It's useful to start using `qmetro` (instead of metro) any time you are creating a Jitter patch. It won't really help us now - because our patches are pretty basic - but when you start doing more effects and video mashups, you will want qmetro to be used for any timing needs.

Next, let's add a control for playback speed. The easiest way to control playback speed is to create a `rate n.nn`, where n.nn is any positive or negative floating point value. How do these values relate to playback speed?

**img-07**

Much like with audio and the `groove~` object, standard playback is a rate of 1.00. Any value greater than 1.00 will speed up the playback, so a rate of 2.00 would play the movie back at double-speed. Values less than one slow down playback, so a rate of 0.50 would play it back at half speed. What about negative numbers?

A negative rate will reverse playback, with a -1.00 playing back the movie backwards at normal speed. This leaves us with one remaining mystery value - 0. A rate of zero will stop the movie at its current position and simply reproduce the current frame over and over again.

Hopefully this also explains why we have to send a `bang` message to produce output from the `jit.qt.movie` object; if we depended on QuickTime to automatically output a frame whenever one was available, very slow (or stopped) rates would not produce much in the way of visual output. By separating the playback speed from the output of frames, we get the greatest amount of flexibility for movie playback.

# Theory: Using movie info
Some interesting things we can do to alter the playback of the movie requires some information about the movie. For example, let's say that we want to change the loop points (the start and end points of the looped playback) of the movie. We would need to know the duration of the movie so that we can properly set the loop points.

To get the length, we have to interrogate the `jit.qt.movie` object about the movie it has read in. We can do that by sending it a `get???` message, where you replace the "???" with the attribute you want to receive. So, for example, sending `getduration` will return the duration of the movie. Do this with the following patch to see what happens:

**img-08**

Note that we get a value, but it is a rather weird number. In my example, the result was the value 7240, which doesn't look right for any timebase that we've used to this date. The reason? Because it isn't in milliseconds, samples or days; rather, it is in "QuickTime Units". In order to figure out how many QuickTime Units represent a second (and this is specific to the movie), we need to query `jit.qt.movie` again - this time with a `gettimescale` message. If we use the route object to separate the messages, we get a patch like this:

**img-09**

The timescale is the number of QuickTime Units per second, so we can find out the duration of the movie (in seconds) by dividing the duration by the timebase, giving us a value of 12.067. We will want to work in milliseconds (a timescale we are familiar with), so we will also need to multiply the value by 1000. We can then use the result to adjust some scale objects that will alter the results of an `rslider` - giving us (finally!) the loop points we need in milliseconds increments.

Why would we bother converting this to milliseconds? The reason is that this is the timescale that we've used throughout our explorations with Max, and many of the time values that we will get from other objects are in milliseconds. By converting from the QuickTime Units system to milliseconds, we can do all sorts of work combining Max, MSP (audio) and Jitter functions without worrying about the timescales not matching.

So, to set the looppoints, we will have to use the timebase as well, so we can multiply by that same value. We also have to divide by 1000, since the timebase is in units per seconds. Whoosh!

**img-10**

In reality, there aren't that many movie attributes that we will need to know - and I've created two abstractions for you to use. They are available in the downloads section, and in future lessons, we will be using the `myqtinfo` and `myms2qtu` abstractions extensively.

**img-11**

This gives us the information that we most desperately need, and allows us to create patches that are movie-aware without a lot of abstract message handling. It also sets us up perfectly for the next lesson, which delves into the world of the matrix - the data structure used to move movie information between Jitter objects.
