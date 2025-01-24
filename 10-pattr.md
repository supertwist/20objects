As our Max patches become more feature-filled, it becomes more important to find a way to access and save our settings for use the next time open the patch. While a simple preset mechanism is provided for small patches, it has fallen out of use in preference to "the pattr system". Using pattr is more than using a single object - it's really about buying into a system of objects used for creating and supporting presets.

# The `pattr` object

At its most basic level, the pattr object acts as an "alias" for another object. By attaching a pattr object to any other value-storing object, you can set or retrieve that object's contents remotely. We can do that by attaching a pattr object's middle outlet to a UI object.

__img__

In this patch, we have a slider connected to a pattr object named "slingblade". We also have a pattr object named "mypattr" that is has an addition parameter attaching it to our slingblade object. When we change the slider, we can see the mypattr object output that value; likewise, if we change the numberbox connected to mypattr's inlet, it will change the slider.

This object communications can allow us to access the user interface object without having to make a physical connection, which can be useful. It is also critical for storage and automation options found in Max for Live devices.

While all of this setup is interesting, having an object under remote control may seem to have limited use, and it really doesn't help us create presets. Or does it? Imagine if there was an object that was able to "see" all of the pattr objects in a patch and store the values as a single preset. This would make the remote access a lot more valuable.

# Friend object: pattrstorage
Well, there is such an object: pattrstorage. All we have to do to start using the pattrstorage object is to drop one into our patch and give it a name. Do that, naming the object "dada":

__img__

If you lock the patch and double-click on the object, a window will come up showing us the names, values and other information about all of the pattr objects currently in the patch. This shows how the object is able to track down - or set values on - the objects connected to pattr objects. Within the window, you can double click on any value and change it, then see the results in your patch.

One of the cool things that pattrstorage can do is to create presets for our patch. You store a preset by sending pattrstorage a "store" message, and retrieve a preset by sending it a number that represents an existing preset. Let's create a simple 3-slot preset mechanism for our patch by adding the following:

__img__

If we make some changes and store the results in one of the slots, we can get back our values at any time - just by sending an integer message to pattrstorage. You can also use a floating-point number, but that has an interesting result: any floating point number will create an interpolated value between adjacent presets. So, for example, the value 1.5 will give us values halfway between preset 1 and preset 2.

__img__

Now, of course, making presets doesn't help us much if we can't restore them when we reopen the patch. The pattrstorage object has a number of ways to try to "autosave" the preset contents, but it is wise to control this function yourself whenever possible. You can save the pattrstorage contents to a file by calling the "write" message, and read it from disk using the "read" message. If you like, you can append a filename that will be used for the read and write messages. Here is how we would cause the pattrstorage object to implement a read and write command for our work:

__img__

# Exercise
Create a patch that has 5 sliders, and create a preset mechanism that will store 5 presets. Have it save and restore presets to a file named "MyFive" on your disk, and show the presets saving and restoring.

# Friend object: autopattr
Hopefully, using the pattr system is beginning to make sense to you - you tag your objects with a named pattr object and let the pattrstorage object control preset saving, selection and disk storage. But what do you do if you have a large patch built and need to save the state as a preset. Do you really have to create all those pattr objects?

Not really. If you are willing to give up a little control, a new object called autopattr can help. The autopattr object, when instantiated, will search your patch for value-storing objects, automatically name them, then creates "virtual" pattr connections to pattr storage.

Let's take a closer look at this. Create the following patch:

__img__

We've got 6 interface object, none of them connected to the pattrstorage object. If you double-click pattrstorage, you will see that it has no connections to anything - it's an empty slate at this point. Now, add a new "autopattr" object to the patch and double-click on the pattrstorage. There is no change. Why? Because autopattr, by default, will only connect to items that have a "scripting name".

If we change the autopattr to include a new parameter set - "@autoname 1" - we will now see that all of the sliders have been given names and are exposed to the pattrstorage object. The names aren't overly descriptive (normally, they are the type of object with an array identifier after the type), but you should be able to see that the UI elements are well covered.

__img__

Sometimes, you will want to exclude certain items from autopattr's view. You can do this by connecting the second outlet of autopattr to the inlet of the object to be excluded. Do that to one of the sliders, then check that it is gone from the pattrstorage listing.

# Related objects: send and receive

Sometimes you will want to transmit the value of an object from one place to another, or from one patch to another, without having the whole structure of the pattr system. There are two widely used objects - send and receive - that do this. The objects use names to determine where a sender's value will be received, allowing you to control this functionality across a number of objects.

Create the following patch:

__img__

Now, whenever you move the slider, its value is transmitted to both the number box and the Max window. When you are looking at someone else's patch, you may find situations where there seems to be no connection between logic blocks. You will want to search the patch for send and receive combinations (generally abbreviated as "s" and "r") to track the connection.

__img__
