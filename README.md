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


## Lovain

The Louvain algorithm is a hierarchical clustering algorithm, that recursively merges communities into a single node and executes the modularity clustering on the condensed graphs.

### Sample 
```
cluster_louvain(net, weight=NULL)
plot(net,vertex.label="", vertex.color=rainbow(119))

```
### Sample output 

![image](https://user-images.githubusercontent.com/53899191/123135881-835ee680-d47c-11eb-8c72-e99ca1799a9d.png)


## Clique
(Derenyi, Palla,Vicsek 2005), Introduced the concept of clique percolation, where the network is viewed as a union of cliques.
In order to find the k-clique communities, a two-phase algorithm is proposed. First, all the maximal k-cliques in the graph are found. Second, the
best subset of the k-cliques is chosen to cover the vertices of the graph. 

### Sample 
```
cliques(net,min=3, max=3)
plot(net,vertex.label="", vertex.color=rainbow(29))

```
### Sample output 

![image](https://user-images.githubusercontent.com/53899191/123135923-91146c00-d47c-11eb-98ee-8dc1b0872bf5.png)


## References
This section provides more resources on the topic if you are looking to go deeper.
- https://www.ccs.neu.edu/home/vip/teach/DMcourse/6_graph_analysis/notes_slides/06859714.pdf
- https://neo4j.com/docs/graph-data-science/current/algorithms/louvain/#:~:text=The%20Louvain%20algorithm%20is%20a,clustering%20on%20the%20condensed%20graphs.
- https://core.ac.uk/download/pdf/61419711.pdf
