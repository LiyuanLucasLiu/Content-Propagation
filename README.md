#Content Propagation

Code for the paper [Community Detection Based on Structure and
Content: A Content Propagation Perspective](http://home.ustc.edu.cn/~llychina/papers/CommunityICDM15.pdf)

A framework of community detection
which combines the network structure and node attributes
from the perspective of content propagation. It treats a network
as a dynamic system and considers its community structure
as a consequence of interactions among nodes.

##Requirement

Matlab

##Data

the Cora Dataset has been put into the `data/` directory, saved as `cora.mat`

##Model

This toolkit includes four algorithm under the community detection framework Content Propagation, CPIP_PI CPIP_SI, CPRW_PI and CPRW_SI. More details could be found at the ICDM paper.

##Usage

The code includes a runnable example, you can run it in matlab by:
```
demo
```