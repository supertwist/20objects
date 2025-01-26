Now that we can generate bang messages with the `metro` object, and we can generate numbers using the `counter` object, we are starting to see how we can generate performance and installation patches. However, at the heart of many generative performance systems is random generation. In this lesson, we will look at the many options available for playing with random numbers.

# The `random` object
Let's begin, as we often do, with a simple patch. Build this patch, start the metro and look at the output printed into the Max Window:

![Screenshot 2025-01-20 at 2 04 29 PM](https://github.com/user-attachments/assets/818564c6-ebed-4442-934a-8ab0fb636153)

You will notice that each time the `random` object receives a bang message it produces a `random` number. Looking at the Max Window, we see that the numbers range from 0 through 4. This may seem curious, since the random object has a "5" for its argument; you would probably expect the random numbers to run through the number five. Alas, you have just experienced one of the conventions that are common among programmers, but not among the rest of us.

This convention breaks down into two parts:

1. Often, when you are discussing number sets, you speak in terms of ranges rather than an absolute number. So, for example, with the `random` object, the argument "5" represents a range of five numbers rather than a count of numbers ending with five.

2. When programmers count, they almost always start with 0 (zero). This is important enough to repeat: in a programmer-driven world, counting starts with zero!

Given the above two points, we should be able to better understand the output of the `random` object. The `random` object was commanded to use a range of 5 numbers, and (being a programming language) it starts at zero, so the five numbers we will produce are: 0, 1, 2, 3 and 4. Generally, programmers use the statement "from 0 to n-1" to describe the numbers produced by a range-stated object.

You will notice that the `random` object has a second inlet - and it represents the way to change the range interactively. You will seldom need to change this in realtime, but it's just in case you do.

A more significant issue is that the `random` object only puts out integer (whole) numbers. What do you do if you want floating point numbers that go from 0.0 through 4.9999999999? The easiest way to do this is to generate a random number from a really large range, then mathematically scale the numbers to suit your needs. Here's an example:

![Screenshot 2025-01-20 at 2 05 31 PM](https://github.com/user-attachments/assets/e82de598-b53d-4713-ae00-91f2a7197855)

In this case, we generate a number between 0 and 999,999 (remember the n-1?), then dividing by 200,000, to reduce the range to the desire set of numbers. Since the number in the / (divide) object is a floating point number, Max knows to make the output floating point rather than integer.

# Exercise
Create a patch that has a single `metro` object, but that drives three random number generators: one that generates numbers between 0 and 9, one that generates numbers between 0.0 and 5000.0, and one that generates numbers between -1.0 and 1.0 (a very common range for audio, which we shall see in a future lesson).

# Related Object: `urn`
So what do you do if you want to generate random numbers across a range, but you don't want any duplicates? Trying to do this with the random object would be pretty difficult, but Max provides the `urn` object for just this case: it keeps track of the numbers it has generated, and won't duplicate any of them unless you clear its memory.

Here's an example:

![Screenshot 2025-01-20 at 2 06 12 PM](https://github.com/user-attachments/assets/a0ba35a0-3fa9-4359-bdf0-9719bcc662ef)

You will notice that when you start the `metro` it generates 10 number then stops. Why does it stop? Because it has exhausted the range you have given it. If you click on the clear button, you will see that it will generate another 10 numbers - again, without duplication. This can be really useful if you are trying to create serial music, avant-garde video shuffles - or just want an interesting alternative to normal random number generation.

The right outlet of the `urn` object also does something interesting: it sends a bang message when we've exhausted our number range. You can easily use that bang message to clear the memory and restart number output.

![Screenshot 2025-01-20 at 2 06 52 PM](https://github.com/user-attachments/assets/28e23553-e731-48ef-b30e-0f62fc900558)

# Exercise
Create a patch where one `metro` object drives two random number generators: one using the `random` object, and one using the `urn` object. Set the range for each to "20". Using the `==` object (see the help file) and the select object, write a message to the Max window each time the two numbers are equal. How long do you have to wait for a match? Change the range to "50" and see how long you have to wait. 200?

# Related Object: `drunk`
One of the more interesting variants on random number generation is the "random walk". One of the best examples of a random walk is the way a financial (stock) market works - a company like IBM will have day-to-day changes in its stock valuation, but it is never a "huge" jump, like from $50 to $4000. Rather, it moves in smaller random steps.

Create the following patch, start the `metro`, and watch the results in the Max Window:

![Screenshot 2025-01-20 at 2 07 18 PM](https://github.com/user-attachments/assets/f1870da0-5515-470a-842c-a177722f3496)

The values move about, and sometimes seem to have an upward or downward trajectory. But the jumps are never that large, and somehow seem more "meaningful". You will notice that the `drunk` object (responsible for this drunken walk) has two argumets: the first is the overall range of the output, and the second is the range of individual steps. If you change the second number to a larger value, like 10, you will see that the step size can now be much larger, and the result is more volatile.

You can change the range and step size using the second and third inlets respectively. You can also set the current output position (and the starting point of the next step) by sending a number into the left inlet:

![Screenshot 2025-01-20 at 2 08 01 PM](https://github.com/user-attachments/assets/709b0489-b99a-43b4-877e-326a18a427d1)

By default, the `drunk` object is allowed to output duplicate numbers, since a step size of zero is always within the acceptable range values. If you want to avoid duplicate numbers from being output, you can make the step size a negative number. Therefore, a step size of "-4" would represent steps from 1 to 3 - you would never have a step size of 0, since this would produce a duplicate output.

![Screenshot 2025-01-20 at 2 10 24 PM](https://github.com/user-attachments/assets/4ca95cf4-6c15-4977-a348-169cfca6224d)

In this case, we are using a `slider` to show the output value - this gives a good visualization of the overall changes to the values as well as the smaller movement of the individual steps.

# Exercise
Create a patch with a single `metro` that generates two drunken walks between 0 and 127 (a common range in the MIDI world). Force one to start at 0, and the other to start at 127. Have the steps size be "-4" (so there are not duplicates). How long does it take for the two values to become equal (as in the last exercise)? What if you change the step size to "4" (allowing duplicates)?

# More Information
Perhaps the King of Random Numbers in the Max world is Dr. Peter Castine, an educator, composer and developer based in Berlin. He created a set of Max object, called Litter Power, that is a exhaustive examination of the possibilities for random number and noise (random audio) generation. Please check out his site at this [link](https://github.com/pcastine-lp/LitterPower). There is a free starter pack, but if you get into random numbers, you will love the complete collection. *Note: the original link is dead, but I linked to the github repo for Litter.*

Generating number and looking at them is fun. Generating numbers and hearing them is even more fun. In the next lesson, we will learn about MIDI and generating MIDI data for synth output.
