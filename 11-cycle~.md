It's time to start looking at audio processing. This is going to be a long lesson, since we will have to introduce a load of friend objects in order to make our first sound. Don't worry, though - it all comes together in pretty quick fashion, and many of the concepts will be similar to the things you've learned about Max.

# The cycle~ object
The cycle~ object is the first object that we will use from the MSP portion of Max/MSP/Jitter. MSP (short for Max Signal Processing) is the part of Max that is used to produce realtime audio output. Most of the MSP objects end with a tilde (~) to help you notice them within a patch.

You instantiate a cycle~ object just like any other Max object: you create a new object box and type cycle~ into it. Max will see this object name and understand that it is an audio object rather than a standard Max object. The cycle~ object uses an options argument that we are going to start with; this argument determines the default frequency of the audio output. We'll use 440.0 as a default frequency:

__img__