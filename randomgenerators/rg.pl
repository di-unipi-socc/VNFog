node(edge0, 20, OpB, [t4]).
node(edge1, 6, OpB, [t3]).
node(edge2, 25, OpB, [t2, t1]).
node(cloud3, 10000, OpA, []).
node(edge4, 38, OpB, [t5]).
link(edge0, edge1, 63, 8).
link(edge1, edge0, 5, 8).
link(edge0, edge2, 144, 43).
link(edge2, edge0, 132, 40).
link(edge0, cloud3, 44, 30).
link(cloud3, edge0, 33, 28).
link(edge0, edge4, 141, 35).
link(edge4, edge0, 37, 45).
link(edge1, edge2, 24, 18).
link(edge2, edge1, 71, 33).
link(edge1, cloud3, 123, 45).
link(cloud3, edge1, 17, 14).
link(edge2, cloud3, 14, 19).
link(cloud3, edge2, 73, 19).
link(edge2, edge4, 66, 6).
link(edge4, edge2, 118, 16).
link(cloud3, edge4, 148, 33).
link(edge4, cloud3, 109, 21).