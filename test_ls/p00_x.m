function x = p00_x ( prob, n )

%*****************************************************************************80
%
%% P00_X returns the least squares solution X for any least squares problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer N, the number of variables.
%
%    Output, real X(N,1), the least squares solution.
%
  if ( prob == 1 )
    x = p01_x ( n );
  elseif ( prob == 2 )
    x = p02_x ( n );
  elseif ( prob == 3 )
    x = p03_x ( n );
  elseif ( prob == 4 )
    x = p04_x ( n );
  elseif ( prob == 5 )
    x = p05_x ( n );
  elseif ( prob == 6 )
    x = p06_x ( n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_X - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROB = %d\n', prob );
    error ( 'P00_X - Fatal error!' );
  end

  return
end
