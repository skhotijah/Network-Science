# Network-Science

## Girvan Newman Algorithm

The Girvan- Newman method for the detection and analysis of community structure is based on the iterative elimination of edges with the highest number of the shortest paths that go through them. By eliminating edges the network breaks down into smaller networks, i.e. communities.


### Sample 
```
ceb <- cluster_edge_betweenness(net)
dendPlot(ceb, mode="hclust")
plot(ceb, net)
# Let's examine the community detection igraph object:
class(ceb)
length(ceb) # number of communities
membership(ceb) # community membership for each node
crossing(ceb, net) # boolean vector: TRUE for edges across communities
modularity(ceb) # how modular the graph partitioning is
```

### Sample output 

![image](https://user-images.githubusercontent.com/53899191/123135146-a937bb80-d47b-11eb-99ae-0deb5ea242bd.png)
