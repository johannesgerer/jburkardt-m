function string = debruijn ( m, n )

%*****************************************************************************80
%
%% DEBRUIJN constructs a de Bruijn sequence.
%
%  Discussion:
%
%    Suppose we have an alphabet of M letters, and we are interested in
%    all possible strings of length N.  If M = 2 and N = 3, then we are
%    interested in the M**N strings:
%
%      000
%      001
%      010
%      011
%      100
%      101
%      110
%      111
%
%    Now, instead of making a list like this, we prefer, if possible, to
%    write a string of letters, such that every consecutive sequence of
%    N letters is one of the strings, and every string occurs once, if
%    we allow wraparound.
%
%    For the above example, a suitable sequence would be the 8 characters:
%
%      00011101(00...
%
%    where we have suggested the wraparound feature by repeating the first
%    two characters at the end.
%
%    Such a sequence is called a de Bruijn sequence.  It can easily be
%    constructed by considering a directed graph, whose nodes are all
%    M**(N-1) strings of length N-1.  A node I has a directed edge to
%    node J (labeled with character K) if the string at node J can
%    be constructed by beheading the string at node I and adding character K.
%
%    In this setting, a de Bruijn sequence is simply an Eulerian circuit
%    of the directed graph, with the edge labels being the entries of the
%    sequence.  In general, there are many distinct de Bruijn sequences
%    for the same parameter M and N.  This program will only find one
%    of them.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of letters in the alphabet.
%
%    Input, integer N, the number of letters in a codeword.
%
%    Output, integer STRING(M**N), a deBruijn string.
%

%
%  Construct the adjacency information.
%
  nnode = m^(n-1);
  nedge = m^n;

  iedge = 0;

  for i = 1 : nnode

    ivec(1:n-1) = index_unrank0 ( n-1, m, i );

    for k = 1 : m
      jvec(1:n-2) = ivec(2:n-1);
      jvec(n-1) = k;
      j = index_rank0 ( n-1, m, jvec );
      iedge = iedge + 1;
      inode(iedge) = i;
      jnode(iedge) = j;
      knode(iedge) = k;
    end

  end
%
%  Determine a circuit.
%
  [ success, trail ] = digraph_arc_euler ( nnode, nedge, inode, jnode );
%
%  The string is constructed from the labels of the edges in the circuit.
%
  string(1:nedge) = knode(trail(1:nedge));

  return
end
