function a = p00_a ( prob, m, n )

%*****************************************************************************80
%
%% P00_A returns the matrix A for any least squares problem.
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
%    Input, integer N, the number of variables.
%
%    Output, real A(M,N), the matrix.
%
  if ( prob == 1 )
    a = p01_a ( m, n );
  elseif ( prob == 2 )
    a = p02_a ( m, n );
  elseif ( prob == 3 )
    a = p03_a ( m, n );
  elseif ( prob == 4 )
    a = p04_a ( m, n );
  elseif ( prob == 5 )
    a = p05_a ( m, n );
  elseif ( prob == 6 )
    a = p06_a ( m, n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_A - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROB = %d\n', prob );
    error ( 'P00_A - Fatal error!' );
  end

  return
end
