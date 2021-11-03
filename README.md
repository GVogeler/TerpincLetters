Terpinc Letters
===============

Student project in the [MA programm "Digital Humanities" at Graz University](https://informationsmodellierung.uni-graz.at/de/studieren/masterstudium-digitale-geisteswissenschaften), by Joze Glavic, supervised by Georg Vogeler, 2020/2021.

# How to use the stylesheets

Single transcriptions should be processed with [trpcl-object.xsl](https://github.com/GVogeler/TerpincLetters/blob/main/trpcl-object.xsl).

[simulated_objectlist.xml](https://github.com/GVogeler/TerpincLetters/blob/main/simulated_objectlist.xml) is a mock up helper to create a list of letters to be processed with [trpcl-context.xsl](https://github.com/GVogeler/TerpincLetters/blob/main/trpcl-context.xsl) that reads in all XML files from the folder in `/data/@directory` and converts them into a sparql result as used in [GAMS context objects](http://gams.uni-graz.at/o:gams.doku#cmcontext)

All XSL stylesheets include [trpcl-static.xsl](https://github.com/GVogeler/TerpincLetters/blob/main/trpcl-static.xsl) which contains common variables, common html:head content, and the wireframe of the web site.

[templates-features.xsl](https://github.com/GVogeler/TerpincLetters/blob/main/templates-features.xsl) is a sample xsl including many extended features you could copy to your project. You will see them 'in action' when you assign this stylesheet instead of the standard trpcl-object to a TEI/XML file.
