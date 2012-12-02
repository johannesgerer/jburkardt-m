function tetra_neighbor = tet_mesh_neighbor_tets ( tetra_order, tetra_num, ...
  tetra_node )

%*****************************************************************************80
%
% TET_MESH_NEIGHBOR_TETS determines tetrahedron neighbors.
%
%  Discussion:
%
%    A tet mesh of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each tetrahedron.  In the most common case, four nodes are used.
%    There is also a 10 node case, where nodes are also placed on
%    the midsides of the tetrahedral edges.
%
%    This routine can handle 4 or 10-node tetrahedral meshes.  The
%    10-node case is handled simply by ignoring the six midside nodes,
%    which are presumed to be listed after the vertices.
%
%    The tetrahedron adjacency information records which tetrahedron
%    is adjacent to a given tetrahedron on a particular face.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 4 * TETRA_NUM
%    data items.
%
%    The neighbor tetrahedrons are indexed by the face they share with
%    the tetrahedron.
%
%    Each face of the tetrahedron is indexed by the node which is NOT
%    part of the face.  That is:
%
%    * Neighbor 1 shares face 1 defined by nodes 2, 3, 4.
%    * Neighbor 2 shares face 2 defined by nodes 1, 3, 4;
%    * Neighbor 3 shares face 3 defined by nodes 1, 2, 4;
%    * Neighbor 4 shares face 4 defined by nodes 1, 2, 3.
%
%    For instance, if the (transposed) TETRA_NODE array was:
%
%    Row       1      2      3      4
%    Col
%
%      1       4      3      5      1
%      2       4      2      5      1
%      3       4      7      3      5
%      4       4      7      8      5
%      5       4      6      2      5
%      6       4      6      8      5
%
%    then the (transposed) TETRA_NEIGHBOR array should be:
%
%    Row       1      2      3      4
%    Col
%
%      1      -1      2     -1      3
%      2      -1      1     -1      5
%      3      -1      1      4     -1
%      4      -1      6      3     -1
%      5      -1      2      6     -1
%      6      -1      4      5     -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TETRA_ORDER, the order of the tetrahedrons.
%
%    Input, integer TETRA_NUM, the number of tetrahedrons.
%
%    Input, integer TETRA_NODE(TETRA_ORDER,TETRA_NUM), the nodes that make up
%    each tetrahedron.
%
%    Output, integer TETRA_NEIGHBOR(4,TETRA_NUM), the four tetrahedrons that
%    are direct neighbors of a given tetrahedron.  If there is no neighbor
%    sharing a given face, the index is set to -1.
%

%
%  Step 1.
%  From the list of nodes for tetrahedron T, of the form: (I,J,K,L)
%  construct the four face relations:
%
%    (J,K,L,1,T)
%    (I,K,L,2,T)
%    (I,J,L,3,T)
%    (I,J,K,4,T)
%
%  In order to make matching easier, we reorder each triple of nodes
%  into ascending order.
%
  for tetra = 1 : tetra_num

    i = tetra_node(1,tetra);
    j = tetra_node(2,tetra);
    k = tetra_node(3,tetra);
    l = tetra_node(4,tetra);

    [ a, b, c ] = i4i4i4_sort_a ( j, k, l );

    faces(1:5,4*(tetra-1)+1) = [ a, b, c, 1, tetra ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, k, l );

    faces(1:5,4*(tetra-1)+2) = [ a, b, c, 2, tetra ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, l );

    faces(1:5,4*(tetra-1)+3) = [ a, b, c, 3, tetra ]';

    [ a, b, c ] = i4i4i4_sort_a ( i, j, k );

    faces(1:5,4*(tetra-1)+4) = [ a, b, c, 4, tetra ]';

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1:3; the routine we call here
%  sorts on rows 1 through 5 but that won't hurt us.
%
%  What we need is to find cases where two tetrahedrons share a face.
%  By sorting the columns of the FACES array, we will put shared faces
%  next to each other.
%
  faces = i4col_sort_a ( 5, 4*tetra_num, faces );
%
%  Step 3. Neighboring tetrahedrons show up as consecutive columns with
%  identical first three entries.  Whenever you spot this happening,
%  make the appropriate entries in TETRA_NEIGHBOR.
%
  tetra_neighbor(1:4,1:tetra_num) = -1;

  face = 1;

  while ( 1 )

    if ( 4 * tetra_num <= face )
      break
    end

    if ( faces(1:3,face) == faces(1:3,face+1) )
      face1 = faces(4,face);
      tetra1 = faces(5,face);
      face2 = faces(4,face+1);
      tetra2 = faces(5,face+1);
      tetra_neighbor(face1,tetra1) = tetra2;
      tetra_neighbor(face2,tetra2) = tetra1;
      face = face + 2;
    else
      face = face + 1;
    end

  end

  return
end
