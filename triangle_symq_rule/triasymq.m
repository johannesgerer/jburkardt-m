function [ rnodes, weights ] = triasymq ( n, vert1, vert2, vert3, numnodes )

%*****************************************************************************80
%
%% TRIASYMQ returns a symmetric quadrature formula for a user triangle.
%
%  Discussion:
%
%    This routine constructs (or rather retrieves) a symmetric
%    quadrature formula on the user-defined triangle in the plane
%    specified by its vertices (vert1,vert2,vert3).
%
%    The total number of nodes and weights to be created is numnodes.
%
%      n       1     2     3     4     5     6     7     8     9    10
%     -----------------------------------------------------------------
%    nodes     1     3     6     6     7    12    15    16    19    25
%
%
%      n      11    12    13    14    15    16    17    18    19    20
%     -----------------------------------------------------------------
%    nodes    28    33    37    42    49    55    60    67    73    79
%
%
%      n      21    22    23    24    25    26    27    28    29    30
%     -----------------------------------------------------------------
%    nodes    87    96   103   112   120   130   141   150   159   171
%
%
%      n      31    32    33    34    35    36    37    38    39    40
%     -----------------------------------------------------------------
%    nodes   181   193   204   214   228   243   252   267   282   295
%
%
%      n      41    42    43    44    45    46    47    48    49    50
%     -----------------------------------------------------------------
%    nodes   309   324   339   354   370   385   399   423   435   453
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer N, the degree of the quadrature (must not exceed 50).
%    Note that the total number of nodes to be created is numnodes.
%
%    Input, real VERT1(2), VERT2(2), VERT3(2), the vertices of
%    the triangle on which the quadrature rule is to be constructed.
%
%    Input, integer NUMNODES, the number of nodes.
%
%    Output, real RNODES(2,NUMNODES), the nodes in the plane
%    (all inside the user-supplied triangle)
%
%    Output, real WEIGHTS(NUMNODES), the quadrature weights.
%
  itype = 0;

  [ rnodes, weights ] = quaequad ( itype, n );

  [ rnodes, weights ] = trianmap ( numnodes, vert1, vert2, vert3, ...
    rnodes, weights );

  return
end
