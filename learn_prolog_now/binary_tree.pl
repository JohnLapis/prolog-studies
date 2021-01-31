%% Binary trees are trees where all internal nodes have exactly two
%% children. The smallest binary trees consist of only one leaf node. We will
%% represent leaf nodes as leaf(Label) . For instance, leaf(3) and leaf(7) are
%% leaf nodes, and therefore small binary trees. Given two binary trees B1 and
%% B2 we can combine them into one binary tree using the functor tree/2 as
%% follows: tree(B1,B2) . So, from the leaves leaf(1) and leaf(2) we can build
%% the binary tree tree(leaf(1),leaf(2)) . And from the binary trees
%% tree(leaf(1),leaf(2)) and leaf(4) we can build the binary tree
%% tree(tree(leaf(1), leaf(2)),leaf(4)) .

%% Now, define a predicate swap/2 , which produces the mirror image of the
%% binary tree that is its first argument. For example:
%% ?-  swap(tree(tree(leaf(1),  leaf(2)),  leaf(4)),T).
%% T  =  tree(leaf(4),  tree(leaf(2),  leaf(1))).
%% yes

leaf(Number).
tree(leaf(X), leaf(Y)).
tree(tree(Node1, Node2), leaf(X)).
tree(leaf(X), tree(Node1, Node2)).

swap(leaf(N), Node2):- Node2 = leaf(N).
swap(tree(Node1, Node2), MirrorTree):-
    swap(Node2, SNode2),
    swap(Node1, SNode1),
    MirrorTree = tree(SNode2, SNode1),
