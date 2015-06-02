function num = tree_rb_enum ( n )

%*****************************************************************************80
%
%% TREE_RB_ENUM returns the number of rooted binary trees with N nodes.
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
%    Input, integer N, the number of nodes in the rooted 
%    binary tree.  N should be odd.
%
%    Output, integer NUM, the number of rooted binary trees 
%    with N nodes.
%
  if ( n < 0 )

    num = 0;

  elseif ( n == 0 )

    num = 1;

  elseif ( mod ( n, 2 ) == 0 )

    num = 0;

  else

    c = catalan ( ( n - 1 ) / 2 );

    num = c(1+((n-1)/2));

  end

  return
end
