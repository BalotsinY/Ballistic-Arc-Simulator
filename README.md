# Ballistic-Arc-Simulator

This program takes in two parametric functions, one for the space curve and one for a parametric vector field, and graphs the path of a projectile launched at the origin. In a nutshell, that is it. More in depth, for every .01 "t", a new "Line" object is added to an arraylist, which is then displayed. Each of the lines is tiny, probably less than a pixel across, and finds its next position after another .01 "t". Inputting different functions in the x, y, and z function methods and the x, y, and z vector field methods will change the resulting graph. By setting the vector field to 0, this can also be used as a regular 3D grapher, though this is a sort of side-effect.

### Difficulties or opportunities encountered along the way.

The hardest part to figure out in this project was how to graph a curving arc in a 3-dimensional space. There are practically no sources or references on how to do so in Processing online, so I accidentally reinvented the modern graphing calculator. A graphing calculator graphs tiny lines together to make a curve that is perceived as smooth. I hadn't thought about that until after I coded up the segment, and talked to my math teacher, Mr. Bungert. So overall, it is a seemingly pretty crude solution, but it works, and it works well.

### Most interesting piece of code and explanation for what it does.

for (float i = startT; i < endT; i += .01) {
    lines.add(new Line (i));
}

This "for" loop is so simple, yet is the backbone of the entire program. All it really does is go through and make a "Line" object for every .01 "t", but in that simplicity is what allows the entire program to function. I think that is why I like this little piece the most; so simple, yet so powerful.

## Built With

* [Processing](https://processing.org/) - The IDE used

## Authors

**Balotsin, Yagor**

## Acknowledgments
plux on https://forum.processing.org/two/discussion/3080/rotating-cubes
Jonathan Pleiburg for his "peasycam" library for Processing
