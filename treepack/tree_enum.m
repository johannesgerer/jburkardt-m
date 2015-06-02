function ntree = tree_enum ( nnode )

%*****************************************************************************80
%
%% TREE_ENUM enumerates the labeled trees on NNODE nodes.
%
%  Discussion:
%
%    The formula is due to Cauchy.
%
%  Example:
%
%    NNODE      NTREE
%
%    0              1
%    1              1
%    2              1
%    3              3
%    4             16
%    5            125
%    6           1296
%    7          16807
%    8         262144
%    9        4782969
%   10      100000000
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NNODE, the number of nodes in each tree.
%    NNODE must normally be at least 3, but for this routine,
%    any value of NNODE is allowed.  Values of NNODE greater than 10
%    will probably overflow.
%
%    Output, integer NTREE, the number of distinct labeled trees.
%
  if ( nnode < 0 )
    ntree = 0;
  elseif ( nnode == 0 )
    ntree = 1;
  elseif ( nnode == 1 )
    ntree = 1;
  elseif ( nnode == 2 )
    ntree = 1;
  else
    ntree = nnode ^ ( nnode - 2 );
  end

  return
end
