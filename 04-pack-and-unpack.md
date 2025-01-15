In the last lesson, we learned the basics of lists: they act as a container for sending multiple values as a single message. However, the process of building up lists one value at a time (using append and prepend objects) is just too painful for words - and luckily Max provides us with several better approaches.

# The pack object
The pack object is our first, and most used, option. The pack object allows you to assemble lists of up to 250 items by specifying the appropriate number of arguments. Let's build an example patch.

Start by creating a new patcher window, then adding five integer number boxes. Then add a pack object with five zeroes as arguments. This will create a pack object with five inlets. Connect the five number boxes to the pack object, and connect the pack outlet to a print object. Your patch should look like this:

![Screenshot 2025-01-15 at 8 13 40 AM](https://github.com/user-attachments/assets/15d6e45f-41a3-4bca-9b65-f2da45621c2b)

When you connected the number boxes, you should have noticed that only the leftmost inlet is a "hot" inlet - all of the others are "cold", meaning that they will collect input but not generate output. You can verify this by entering values into the number boxes; the only time that a list is output is when a value is sent into the left inlet.

How can we force any of the inputs to generate a message? Perhaps the easiest way is to connect the "cold"-connected number boxes to a button object so that it generates output every time a value changes. One thing to double check, though, is that the value gets into the pack object before the bang message is received. This is what we normally do to generate a pack output:

![Screenshot 2025-01-15 at 8 14 46 AM](https://github.com/user-attachments/assets/fa7605e1-bc9a-474b-9932-ff3f2aade62e)

> [!NOTE]
> This is a pattern that we will often use for forcing output. Remember it!

The arguments that we use do two things: they determine the type of data that is expected from an inlet, and acts as a default for the value. If we build a pack object with some useful number, but only change one of them, you can easily create complex messages with a few replaceable values.

![Screenshot 2025-01-15 at 8 20 54 AM](https://github.com/user-attachments/assets/0589f09b-091e-4543-96f7-bec22c9215e3)


We can also feed a list into one of the inlets of a pack object to load up the values. This exposes one of the interesting features of using lists: if an object has multiple inlets, feeding it a list will load up the inlet contents in order. This is another concept that is easier to show than to explain, so let's create a patch:

![Screenshot 2025-01-15 at 8 21 55 AM](https://github.com/user-attachments/assets/ea70aec6-01b3-4db5-842d-6c2472a37c79)

If you click on any of the message boxes, a list is sent into one of the pack inlets. You will notice that the contents of the message box's list is used, in order, to fill the pack object's values. The left message box is most interesting: it sends a list into the first inlet, while loads all the values then creates and output list without requiring a bang. Do you remember why a bang message isn't required? (The answer is: because that is a "hot" inlet.)

Remember that we said that the arguments of the pack object determine the type of data expected in an inlet? Let's play with that a little more. Create the following patch:

__img__

Our pack object has a mix of symbols, integers and floating-point number, giving us a mixed-data list. Each of the inlets has an input connected to it. You can test the function of the pack object by entering some data, then either clicking on the "generate" button or by entering something into the left inlet. The values remain true to their type, producing symbol, float or integer values for the list output.

What happens when we send the wrong type into a pack inlet? The answer is: it depends. The results is described by the following table:

__img__

So, for example, if you send an integer into a float inlet, the value (say, 6) will be converted into a floating-point value (6.0 in this case) and inserted into the list. Most of these will make sense, but one to watch out for is this: the truncation of a floating point number into an integer. You might expect a number like 6.9 to be rounded up to 7, but the result will actually be 6 - the decimal part of the number is stripped right off.

# Exercises
1. Create a pack object that will combine a name (symbol), age (integer) and income level (float) for a set of professional athletes. Use number boxes and flonums for the value inputs, and message boxes for the symbol inputs. Write the output to the Max Window.

2. Create a pack object that will collect three color values, all between 0.0 and 1.0, and display the output in a message box. Force the output to occur whenever any value is changed.

# Friend object: unpack
In our last lesson, we used the $1 replaceable parameter to get a value and insert it into a message. In actuality, there are 9 replaceable parameters available: $1 - $9. These numbers refer to the location within a list (the first through ninth element in a list), and can be used anytime we are receiving list contents.

Create the following patch to see how this works:

__img__

You can see that the output of the pack object feeds a number of message boxes, each of which uses one of the $n parameters to create a new value. However, there are a few problems with this:

1. We are limited to retrieving only the first nine elements of the list. Longer lists cannot be interrogated.

2. We don't have any way to enforce the type of value used.

3. It's rather inconvenient to do this if you want to completely split the list.

A companion object to the pack object is the unpack object. It is very similar to the pack object: you enter arguments to determine the type and default of each value that is expected, and the appropriate number of outlets will be created - one for each list element.

Now, when a list comes in, the pieces are split into individual messages and sent out the appropriate outlet. Let's make a simple patch that is sort of useless but shows how things operate.

__img__

As you can see, anytime we enter a number, a list is created, sent out the pack object, received by the unpack object and split apart again. This may not seem very interesting, but it is the key to many different operations in Max.

The unpack message can decode messages coming from any object that creates a list. For example, if we create a list in a message box, we can easily pull it apart with an unpack object - as long as we know the element types in advance. Here's an example of a patch that builds lists in three different ways, but decodes them all with a single unpack object:

__img__

# Exercises
1. Create an unpack object that will take a variety of lists and output the third value of the list. You will want to make the third list value consistent in type through all of your input.

2. The unpack object requires arguments to determine the type of each output. Create a patch that will show the results of the wrong type appearing in the list - we will want to use this to determine what happens if, for example, a symbol is in the list where the unpack message expects an integer. Also, determine what happens if the list is the wrong length for the unpack statement (i.e., it has either too many or too few elements). Finally, show what happens when an unpack object receives a bang message.

# Related object: the zl object
The pack object helps us build up a list, and the unpack object allows us to tear it down. What about all of the other things we might want to do with a list: reverse it, split it or even compare it to another list? There is a single "super-object", the zl object, that does all of this and more.

How could one object perform all of these functions? The zl object takes an argument that defines how it operates. The easiest way to see all of the options for zl is to open the zl help file.

Create an instance of the zl object (by creating a generic object and entering zl into it), selecting it, and then selecting "Open zl help" in the help menu. The following screen appears:

__img__

Let's look at one of the variations of zl use. Perhaps the most often used mode is the "slice" mode, where a list is split into two parts for separate processing. You will find an example of zl slice at the bottom left of the help file screen, using a list with "beep 1 2.3 137 bap" as the test list.

If you click on the list's message box, you will see "beep 1" in the Max Window; this is showing the main output of the zl slice mode, which uses the second argument (in this case, 2) to split off the first two elements of the list. We are going to examine this more closely, and learn about how to use the help files as well.

The help file is a Max patch, and one of the interesting things about it is that the developers did not prevent us from unlocking and manipulating the patch. Obviously, we wouldn't want to change the help patch directly, since our changes would get overwritten on the next update. But what we can do is copy interesting sections out of a help patch and paste it into our own patch.

Unlock the zl help patch and select all of the objects in the slice area: the message box, the zl object and the print object. Copy them to the clipboard (using the Copy command in the Edit menu) and go back to our recently created patcher window. Click on that window to make it the focused window, then paste the clipboard, giving us a new version of the help files slice content. Lock your patch and click on the message box - you should see that it acts just as it did in the help file.

Let's check out all of the functionality of the zl in slice mode by using the rest of the inlets and outlets. If you hover your mouse over the right inlet of zl, you should see a callout that says "size of left slice". You can put in a number, and it will change the size of the left hand list slice. Create a number box, and attach its output to the right inlet of the zl object. Change the value to 3, then click the message box. You should now see "beep 1 2.3" in the Max Window - by changing the slice value, we've changed the output to contain three list elements.

The zl object also has an unused outlet. If we hover our mouse over that outlet, we can see that it tells us we can get the "right slice of input list". Connect a print object named "remainder" to that outlet, then lock the patch and click on the message box. The Max Window will now have two entries, one with the first three elements (because our 3 value from above is still active), and a second with "137 bap" - the remainder of the list.

__img__

The nice thing about using the zl object, rather than the unpack object or replaceable parameters, is that the zl object doesn't care about the length of the incoming list - it will do its set job regardless of list length. If not enough elements come in to process (like if you did a "slice 10", but the incoming list only had five elements), it will work with as much as it was given. This is very powerful as you build larger patches - you will be able to accomplish a task without having to constantly verify every list that is sent, and can use it in cases where the data is widely variant.

While going through all of the modes of zl would be overwhelming, you should remember the following rule:

If you need to change a list, the zl object is likely to have a mode that will help you.

That one rule will solve 90% of your list processing requirements.

# Exercise
Create a patch that has five different message boxes (filled with lists) feeding into a single zl object. See what happens when you use the following modes: slice, iter, nth, sort and group. You will need to use the help file (and look at some of the help file's subpatches) to make this work.

# Related object: pak
It is going to seem sort of weird to have saved this for the end, but it was done to prevent mishaps with overproduction of messages. There is a variant of the pack object, called pak, that is identical to pack in every way except one: all of its inputs are "hot", and you don't have to mess around with bang object to generate list messages. Here is an example:

__img__

The reason that this was left until the end was that it has the potential to produce a lot of unwanted messages. Let's say that you were building up a list of colors for an object. In the patch above, you would send a new color command to the object each time you entered a value, and might get unwanted interim color states. The pak object can be very efficient and handy when it is being used for a specific purpose. But to gain simplicity you lose control of the object's output.

# More Information
As we've seen, the help files for objects are powerful tools - they provide us with template code as well as showing us how to use an object. You may want to dig back into the earlier lessons and look at the help files for each of the objects we covered; you will find additional options and functions hidden within the help system.

Perhaps the master of list manipulation is **Peter Elsea,** a professor at the Music Center of UC-Santa Cruz. He has a set of list manipulation objects called the Lobjects that take the ideas presented above and works them to a tee. His work can be found [here.](http://peterelsea.com/lobjects.html)
