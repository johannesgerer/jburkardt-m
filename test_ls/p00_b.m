function b = p00_b ( prob, m )

%*****************************************************************************80
%
%% P00_B returns the right hand side B for any least squares problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer M, the number of equations.
%
%    Output, real B(M,1), the right hand side.
%
  if ( prob == 1 )
    b = p01_b ( m );
  elseif ( prob == 2 )
    b = p02_b ( m );
  elseif ( prob == 3 )
    b = p03_b ( m );
  elseif ( prob == 4 )
    b = p04_b ( m );
  elseif ( prob == 5 )
    b = p05_b ( m );
  elseif ( prob == 6 )
    b = p06_b ( m );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_B - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROB = %d\n', prob );
    error ( 'P00_B - Fatal error!' );
  end

  return
end
