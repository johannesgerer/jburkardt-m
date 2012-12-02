function ntree = tree_enum ( n )

%*****************************************************************************80
%
%% TREE_ENUM enumerates the trees on N nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of nodes in each tree.
%    N must normally be at least 3, but for this routine,
%    any value of N is allowed.
%
%    Output, integer NTREE, the number of distinct elements.
%
  if ( n < 1 )
    ntree = 0;
  elseif ( n == 1 )
    ntree = 1;
  elseif ( n == 2 )
    ntree = 1;
  else
    ntree = n^( n - 2 );
  end

  return
end
