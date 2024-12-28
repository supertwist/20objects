We are starting to see our patches become more complicated - and sometimes downright confusing. In this tutorial, we are going to look at several ways to reduce the visual complexity of a patch without reducing the functionality of it.

# The patcher object
The easiest way to hide patch complexity is to move it into another patch. What do I mean? Let's take a look at a simple patch made that is similar to our MIDI playing device from the previous tutorial.

__img__

When we start the patch, it creates the same random note generation that we heard in our previous patch, but the on-screen programming is much less complex. There is the strange object called "p notemaker" that must be making notes, but this is something that we've not encountered before.

This is a "patcher" object containing another patch. With your patch locked, double-click on the "p notemaker" object. It will open another patcher window containing the "guts" of our note making process.

__img__

The patcher object (almost always abbreviated as "p") doesn't have to have a name, but it is useful to name it in order to label its function. It also features some new objects at the top and the bottom that we will dig into shortly. The process of moving program logic into patcher objects (often called "subpatchers") is known as encapsulation, and is a key concept in creating complex patches that are still understandable.

In order to properly work with the patcher object, we also have to learn about two closely related friend objects: the inlet and the outlet.

# Friend objects: inlet and outlet
An inlet object serves one purpose: to create a way to funnel data into a subpatcher from the main patch. This is easier shown than it is discussed, so let's try using the inlet. Start with a new patch and add a patcher object by creating a new object box, then typing "p mytest" for a name. This will open a new, blank subpatcher window for you to work with. Slide the mytest window over so that you can see the original patcher.

__img__

Double-click on a blank space in the subpatcher window and select the inlet object. This is the square box with the lower-case "i". As soon as it is created in the subpatcher window, you will also notice that a new inlet appears on the "p mytest" object in the main window. This is how we can move data from the main patcher window to the subpatcher.

Let's hook up some number boxes to the main window's patcher object and the subpatcher's inlet:

__img__

Now, if we move the windows so that we can see each of the number boxes, we will see that changing the value at the main level transmits the data to the subpatcher. If we follow the routing, we can see that a number comes out of the main patch's number box, down the patchcord into the patcher object's inlet. This is transferred to the inlet object in our subpatcher, down the patchcord and into the subpatcher's number box.

If you change the data in the subpatcher, however, it does not change the value back at the main level. Inlets are uni-directional, and only accept incoming data. To send something out of a subpatcher, you have to use an outlet. Unlock the patcher and double-click inside the mytest window. Select an outlet object (the box with the lower-case "o"). As soon as it is created, you should see that our "p mytest" object has sprouted an outlet.

Within the subpatcher, connect the output of the number box to the outlet, then on your main patch connect the new patcher outlet to another number box. Now, when you change the first number box, you will see that the number box in the subpatcher changes. It also sends the same information to the outlet, where it is transferred to our second top-level number box. Magical!

__img__

Let's do something a little more significant now: let's have our subpatcher do a string of math operations on the incoming data. Inside the subpatcher, add a series of "+ 50", "/ 4" and "* 3" objects to create a string of calculations.

__img__

Now, instead of passing the data straight through the subpatcher, calculations are actually done on the data - creating a new value to be displayed in the second number box.

You can have more than one inlet and/or outlet in a subpatcher. Let's alter our previous patcher by adding a second set of calculations to be displayed. Change your subpatcher to look like this:

__img__

At the top-level patch, attach a number box to the newly created outlet. When you change the first number box, you can see that both calculations are performed, since the subpatcher is splitting the incoming data into two calculations and performing them both for output.

We will be using subpatchers extensively throughout the remaining tutorials, so it is important to really understand their creation and editing.

# Exercise
Start with three number boxes - two integers and one floating point. Make one subpatcher that inputs both integers and adds them, then divides the result by 2. Make a second subpatcher that accepts the floating point number and outputs three floating point number: the original divided by 2.5, the original unchanged and the original multiplies by 500. Display all of the results on your top-level patch.

# Theory: abstractions
Using subpatchers is a convenient way to encapsulate a subset of your work and hide it from view. You can even copy and paste the patcher object to reuse your work. But what if you want to make something that is reused in many patches? And what if you want a change in one subpatcher to change the contents in all your patchers?

The way to do this is through the creation of abstractions. Abstractions are subpatchers that are saved in a separate file, but have inlets and outlets that communicate through the patches that use them. You create an abstraction by creating a new patch, creating a patch with inlets and outlets, then saving the result as its own file (and in the file paths defined in Max). Now, any patch can use this logic without any recoding - you just type the name of the abstraction as if it was a standard object, and your code will be included in the patch.

Let's try this out. First, create a new patch, add an inlet and outlet, and put a "+ 60" object between them. This will be a simple abstraction that will add 60 to any incoming number.

__img__

Save the patch as "add60.maxpat" into a Max folder and close the patch. Next, open a new patch, create a new object box, and enter the "add60" into the box. You will see it is created with one inlet and one outlet. Put number boxes above and below it, and connect them up with patch cords. Change the value at the top and see it change at the bottom. You've created a reusable logic block!

__img__

Now, what if you wanted to add any number, not just 60? Well, there is a way to have parameters in an abstraction that can be used for just this purpose. Let's reopen our add60 patch and change it a little. Change the number 60 in the "+" object to the text "#1".

__img__

This will tell the abstraction to take the first argument listed and use it in this location. Save this altered patch as "addany.maxpat", the we'll try to use it.

Crate a new patch, and instantiate the addany abstraction. You will need to give it the argument that determines the number you want to add. In this case, let's add 20 to incoming numbers. We do this by creating the object as "addany 20" - the number 20 will replace the "#1" text in our abstraction, and should operate as expected:

__img__

You can use up to 9 replaceable parameters in your abstractions - they are numbered #1 through #9, and will match up with up to nine arguments that you give to your abstraction. If you don't give enough arguments to match the replaceable parameters, they will be replaced with blanks in your patcher.

# Exercise
You can use multiple versions of an abstraction with different parameters to produce varying results. Create a patch and an abstraction that emulates the following patch:

__img__

# Related object: bpatcher
One of the downsides to using subpatchers and abstractions is that you cannot see any of the user controls that are in the object. This is fine if you are just doing calculations, but not so great if you want to monitor values or create a reusable user interface. Luckily, Max has an answer for this: the bpatcher object.

A bpatcher is an abstraction that has a user interface. You create it like any other abstraction, but you will want the user interface to be visible at the top left of the patch. Save the abstraction, then open a new patch. You can select the bpatcher object from the object list (typically at the top-right of the object palette).

__img__

Let's build a bpatcher. Start by making a patch that creates a metro-based bang train called "BangUI.maxpat". It should look something like this:

__img__

Save it as an abstraction, then create a new patch. Select a bpatcher object, which creates a blank square on the patch. Open the inspector, and scroll down to the "Patcher File" entry. Click on the "Chooseâ€¦" button, and select your new abstraction. The bpatcher object may not show enough of the abstraction, so you should resize it to suit. You will also note that this now has an outlet at the bottom. Let's connect it to a big button so we can see the bang messages show up from the bpatcher:

__img__

There you go - we now have a reusable bang timer, complete with user interface. There are ways to clean up the UI, including hiding the patch cords and using the Presentation Mode. You can look at the Max documentation to find out how to accomplish this.
