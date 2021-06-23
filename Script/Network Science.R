# Install the package "igraph" if you don't have its latest version (1.0.1) 
# The package (www.igraph.org) is maintained by Gabor Csardi and Tamas Nepusz.

install.packages("igraph") 

# First we load the ipgrah package
library(igraph)

rm(list = ls()) # clear the workspace again

# Set the working directory to the folder containing the workshop files:
setwd("D:/network/NS")  

# DATASET: edgelist 

nodes <- read.csv("nodebaru.csv", header=T, as.is=T)
links <- read.csv("edgeA.csv", header=T, as.is=T)

# Examine the data:
head(nodes)
head(links)

nrow(nodes); length(unique(nodes$username))
nrow(links); nrow(unique(links[,c("source", "target")]))

links <- links[order(links$source, links$target),]

net <- graph_from_data_frame(d=links, vertices=NULL, directed=T) 
#plot baru
l <- layout_with_kk(net)
plot(net, layout=l,vertex.label="", edge.arrow.size=0.1, vertex.size=2, vertex.color= rainbow(123))

#plot
plot(delete.vertices(simplify(net), degree(net)==0),vertex.label="", edge.arrow.size=0.2,layout=layout_randomly, vertex.size=2, vertex.color= rainbow(123))


#  ------->> Communities --------

# A number of algorithms aim to detect groups that consist of densely connected nodes
# with fewer connections across groups. 

# Community detection based on edge betweenness (Newman-Girvan)
# High-betweenness edges are removed sequentially (recalculating at each step)
# and the best partitioning of the network is selected.
ceb <- cluster_edge_betweenness(net) 
dendPlot(ceb, mode="hclust")
plot(ceb, net) 

# Let's examine the community detection igraph object:
class(ceb)
length(ceb)     # number of communities
membership(ceb) # community membership for each node
crossing(ceb, net)   # boolean vector: TRUE for edges across communities
modularity(ceb) # how modular the graph partitioning is

# High modularity for a partitioning reflects dense connections within communities 
# and sparse connections across communities.


# Community detection based on propagating labels
# Assigns node labels, randomizes, and replaces each vertex's label with
# the label that appears most frequently among neighbors. Repeated until
# each vertex has the most common label of its neighbors.
clp <- cluster_label_prop(net)
plot(clp, net)

# Community detection based on greedy optimization of modularity
cfg <- cluster_fast_greedy(as.undirected(net))
plot(cfg, as.undirected(net))

# We can also plot the communities without relying on their built-in plot:
V(net)$community <- cfg$membership
colrs <- adjustcolor( c("gray50", "tomato", "gold", "yellowgreen"), alpha=.6)
plot(net, vertex.color=colrs[V(net)$community])

#Louvain
cluster_louvain(net, weight=NULL)
plot(net,vertex.label="", vertex.color=rainbow(119))

#Clique
cliques(net,min=3, max=3)
plot(net,vertex.label="", vertex.color=rainbow(29))
