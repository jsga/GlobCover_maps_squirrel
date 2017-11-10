[ WORK IN PROGRESS ]

This repository answers the following simple question.

> Can a squirrel cross from north to south spain without touching the ground?

The answer is: **obviously not**. But, another question arises, and this one is not so easy to answer:

> If a squirrel had to go from the north of Spain to the south, touching the ground as little as posisble: which way would it follow?

The answer is not trivial.

# The history

The legend says that Spain was once so thickly-forested that a squirrel could cross the peninsula hopping from tree to tree. Even though we all learned this at school as a ground truth, it seems that, in fact, this was just a [legend](https://copepodo.wordpress.com/2009/05/11/la-espana-de-la-ardilla-y-la-espana-del-conejo/). Spain was in fact "land of rabbits", as the Romans used to call it. 

Much [has been](https://www.facebook.com/Una-ardilla-podr%C3%ADa-cruzar-Espa%C3%B1a-saltando-de-gilipollas-en-gilipollas-185947181436539/) said about that squirrel, but none have prooved it analytically. Here you have found the asnwer!

# The procedure

I used the [GlovCover](http://due.esrin.esa.int/page_globcover.php) maps from the ESA to get information of the land use. The resolution is around 200m, accurate enough for this purpose. The map spans the whole world but here we are just interested in Spain. So the first step is to load the image raster and crop it.

![GlobCover map of the world](GlobCover2009_Preview.jpg)

The cropped raster image needs to be converted to a directed graph:

  * Each pixel is a node
  * Each node is connected to its adjacent pixels (edge)
  * The weights of each edge correspond to the "roughness" level of the destination pixel. Less roughness means more trees.
  
Having such a graph, the last step is to calculate the shortest path between two nodes - and there we have the path the smart squirrel would follow!

# The coding

The code is purely R and uses several packages: raster, rgdal, Matrix, igraph... Creating the network matrix runs really slow, so some optimziation needs to be done.

# The solution

[This is just a small example](example.html)

# Download path coordinates

Download then here