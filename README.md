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

![image](https://user-images.githubusercontent.com/53899191/123135296-d4220f80-d47b-11eb-8502-e43bd48811d7.png)
