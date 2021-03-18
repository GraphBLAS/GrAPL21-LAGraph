# Review of ws_grapl106s1 by Reviewer 1

## Detailed Review

The paper introduces features of the LAGraph framework that allows the use of GraphBLAS library functions at the Basic mode (that emphasizes ease of implementation) or the Advanced mode (that allows for a specialized, performance sensitive, implementation). The GAP benchmarks are studied in this context.
The paper does not describe the advantages of LAGraph is technical terms. For example, how would the Algorithms 1-3 translate to LAGraph? What would the performance/programming complexity trade offs be for these algorithms in the basic and advanced modes?

## Modifications for Improving the Manuscript

As noted earlier, additional details on LAGraph are needed. Details such as those in Section IIC (and even in IIB) can be reduced.

## Scored Review Questions

Overall 	Conf 
ws_grapl106s1	weak accept (4)	medium (3)

# Review of ws_grapl106s1 by Reviewer 2

## Detailed Review

The paper describes the upcoming first "official" release of the LAGraph library, which uses the GraphBLAS API standard to implement a range of commonly used graph algorithms. LAGraph is aimed at the community of graph algorithm users, in contrast to GraphBLAS which is aimed at graph algorithm experts, developers, and coders. LAGraph itself is a broad and very useful open software effort, with the potential to bring access to high performance via GraphBLAS to a wide community of graph analytics. As such, the first actual release is a significant event and well worth announcing and describing at Grapl. I note, however, that as of today the LAGraph Github site still describes the public-facing version as "experimental"; it would be nice if the authors were a little more concrete about exactly what, and especially when, they mean by "released".

The paper also gives some performance results, comparing the LAGraph codes to the GAP benchmark codes on half a dozen algorithms run on five sample graphs on one machine. This is clearly not intended as a comprehensive performance analysis or benchmarking effort; rather, the intent is to illustrate that LAGraph is at least in the same ballpark performance-wise in many cases, and to exhibit some instances where further strides need to be made. Many of the results are really impressive, and there's a nice (if brief) projection of what some of those strides should consist of. I consider this the strongest part of the paper.

It's worth mentioning that the performance results use the SuiteSparse implementation of GraphBLAS, including some non-standard experimental features of that implementation (that may show up in later versions of the GraphBLAS standard). It was not clear to me whether or not LAGraph is able to run (even if not as fast) on other implementations of GraphBLAS. The authors should definitely answer this question; in the best case they would show that LAGraph works on the second conformant GraphBLAS C implementation, which is from IBM. (I would not ask that they repeat the performance experiments with the second implementation.)

The third stated contribution of the paper is the development of a notation to describe graph algorithms in the language of linear algebra, which is used to give pseudocode for most of the routines used in the performance study. This pseudocode combines features of semiring notation (various versions of which appear in the Kepner/Gilbert book and in the GraphBLAS math standard) with notation to represent things like masking options that are present in the GraphBLAS spec.

I have somewhat mixed feelings about this pseudocode notation. On one hand, it's nice to see a crisp, concise way to describe a complete algorithm (a listing of a C code that calls GraphBLAS includes an awful lot of uninteresting clutter). I guess another advantage is that the "pseudocode" really does capture all (or most of) the details necessary to get the good performance shown on the benchmarks, which is not the case with many short intuitive descriptions of graph algorithms in linear algebra. On the other hand, if one goal of a pseudocode is to make an algorithm understandable, this doesn't make it. For example, it took me a long time (and a couple of pattern-matching scans of the rest of the paper) to figure out what the heck "r" was in the 8-line BFS listing. For another example, I know the delta-stepping SSSP algorithm pretty well, and I can identify the two places in the pseudocode where edges are traversed (listing short edges and long edges to relax at each phase) by locating the semiring-notation foo.bar for matrix-vector multiplication. That's well and good; traversing edges is the expensive part of graph analysis, and the pseudocode shows that it's done by the most carefully optimized subroutines in GraphBLAS. But the rest of delta-stepping is about buckets and priorities, not about graphs or matrices, and I can't make head or tail of most of that pseudocode. Compare this with the beautifully understandable pseudocode in the original Meyer/Saunders delta-stepping-paper.

Maybe the way to sum up this last paragraph is that I am happy with the notation for matrices over semirings, and for foo.bar matrix operations, but I'm not convinced that the notation for indexed and masked assignment represents an advance. There are a lot of versions of the abstract data type "set" that can be implemented by sparse vectors with masks and indexing, and it's an interesting question to think about which "set" ADT's are harder and easier in that framework, but I'd rather not decode this level of notation to figure out what's going on.

Despite my mixed feelings about the notation, I think this is an important paper that definitely belongs in Grapl, and I recommend acceptance.

## Modifications for Improving the Manuscript

The ms is well written on the whole. I made several suggestions in the first review box.

In III.C.2, "effect" should be "affect".

End of III.C "at the same" should be "at the same time" (which I wouldn't have noticed if I hadn't been pattern-matching to figure out what the r in BFS meant).

## Scored Review Questions

Overall 	Conf 
ws_grapl106s1	accept (5)	expert (5)

# Review of ws_grapl106s1 by Reviewer 3

## Detailed Review

The paper presents the design, implementation and initial experimental evaluation of a higher-level abstraction layer called LAGraph over the GraphBLAS API. GraphBLAS is an API that enables many graph algorithms to be expressed in the language of linear algebra where standard operations like matrix-vector product and matrix-matrix product are generalized for other semirings beyond the standard multiplication/addition semiring. The rationale for developing LAGraph is that while GraphBLAS is a big step forward in enabling high productivity and high performance in developing a wide range of graph algorithms on various target platforms, it is still too low-level for users of graph algorithms who develop higher-level applications using graph algorithms.

The rationale for this work is very strong. The main weakness of the paper is that it does not clearly showcase the benefits of using the LAGraph abstraction versus directly using GraphBLAS in implementing graph applications. Section IV seems to express the algorithms at the lower GraphBLAS level. Section V describes a set of utility functions. Is the availability of these utility functions the main benefit over directly using GraphBLAS? The evaluation section compares performance of GraphBLAS implementations with hand-tuned implementations of teh GAP benchmark demonstrating a productivity versus performance trade-off. But I could not differentiate between LAGraph versus base GraphBLAS from the description.

In summary, the paper describes an important direction in enabling high-performance high-productivity and portability in developing graph applications. But the paper could be improved in more concretely contrasting the LAGraph versus GraphBLAS abstractions.

##  Modifications for Improving the Manuscript

Please see above.

## Scored Review Questions

Overall 	Conf 
ws_grapl106s1	weak accept (4)	high (4)
