In order to work with 3-D graphics, we will need to learn a number of different objects. They all use the jit.gl.render object to do their work, but we will need to have several other objects at work in order to make it all come together. All of these objects carry the jit.gl prefix, and they all are used to render OpenGL graphics into a Jitter window.

# Object: jit.gl.render
Create the following patch, which is a basic rendering system:

__img__

There are a number of new objects here: let's start from the bottom and work our way up.

# Related Object: jit.window
To this point, we've always used a jit.pwindow to display our video content. There is another window, called jit.window, that places the window outside the patcher. In our patch, we've called with window "nextgl", and told it to provide a depth buffer - something that we will need for our rendering.

There are a few messages connected to the jit.window. The most important one is the fullscreen message, which expands the window to fill the entire screen. We are using a key/select/toggle combination to allow us to toggle fullscreen mode with the escape key.

Just above the jit.window object is the jit.gl.render that is the basis for our lesson. You will notice that it does not have any connection to the window; rather, it points to the destination window by name (nextgl, in this case). An "axes" message allows us to turn the visible axis pointers on and off when we need them.

The jit.gl.render object is "driven" by a qmetro, just like a standard video or jit.matrix object. However, we need to do something to the renderer that we will see later in more detail - we have to erase the renderer each time we are about to display a frame. That is the point of the trigger object between the qmetro and the jit.gl.render object.

# Related Object: jit.gl.gridshape
In order to see anything out of the renderer, we have to place something into the OpenGL space. The jit.gl.gridshape allows us to have access to all the OpenGL simple shapes (spheres, cubes, planes) without any unnecessary coding. In this case, we are using attributes to set up all of the gridshape functions. We also use the "nextgl" name to tell it to use the nextgl renderer (and therefore, window).

The shape attribute is obvious - it determines the shape that will be displayed. The polymode attribute is less clear: its use is to set the way the shape will be displayed, with the "1 1" values representing a wireframe display.

The scale object is a little different, in that it has three values. These values represent the X, Y and Z (or depth) scaling of the object. X is width, Y is height and Z is the depth - the movement away from you in space. Finally, a color value is provided. Color in OpenGL is a little different that in video: it is in RGBA format, with the alpha channel at the end instead of at the beginning.

If you turn on the qmetro object, you will see a large wireframe display.

__img__

It's a torus, although you can't really tell that from our vantage point. In order to better see the object, we need to be able to manipulate it in space. Let's add another object to our patch to help us:

__img__

The jit.gl.handle object provides a way to grab the image and move it around. If you click in the window and drag, you will see that you can change our view of the torus. Getting it back to where we started could be difficult, but the reset command, when sent to the jit.gl.handle, will force it to jump back to our original position.

With a fairly small amount of Max code, we've just created a significant amount of work - as you can tell by looking at the wireframe, the figure is made up of many small polygons, and they are stitched together to create a rounded figure.

In our example, we've created a basic torus shape and we able to manipulate it by dragging in the window. When we do that dragging, we aren't moving the object - rather, we are moving our position in the world in order to view the object from various angles.

In fact, we may want to manipulate the location, rotation, size and color of the object with messages. We may also even want to change the shape we are using. All of these changes can be done by sending messages to the jit.gl.gridshape object. Modify your previous example patch by adding the following:

__img__

Now we can change the shape, display, scale, position, rotation, color and polygon count with simple Max messages sent to the object. This is quite powerful - in fact, many of the 3-D games you see depend on this set of messages to create comples figures and characters.

__img__

Play around with moving the object around; in places where we are dealing with X, Y and Z coordinates, I've colored the objects red, green and blue (using the inspector).

# Exercise
Since we can alter the object using Max messages, we can also automate some changes. Try modifying your patch to cause changes in the rotation and color using a counter-based automation scheme.

# Related Object: jit.gl.texture
Playing with shapes is fun, but how can we integrate that into the video-based world that we learn about in earlier chapters? You do it be having a movie become a texture (or skin) for the shape, then "wrap" the texture around the shape. Create this patch:

__img__

In this patch, we are using a basic movie player - but the output, instead of going to a window, is going into a jit.gl.texture object. As with other OpenGL objects, we have to tell the texture object what rendering context we are going to use, and we have to give it a name.

The jit.gl.render object worries about the details of rendering a shape, but it also creates a texture map that will hold the video frames. When we send a "texture" message to the jit.gl.gridshape, we will force it to wrap the image around the shape. The wrapping methos are explained in the reference manual; however, if you are planning on doing a lot of this type of work, you will probably want to study up on OpenGL for the greatest level of detail.

__img__

This lesson only lightly touches on the many capabilities of the Jitter OpenGL implementation. More options are available for generative 3-D visuals, using your computer's graphics card to speed up output, and ways of further manipulating the environment of the GL rendering context. But we'll save all of this for the intermediate lessons soon to be available...