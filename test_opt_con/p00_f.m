function f = p00_f ( problem, m, n, x )

%*****************************************************************************80
%
%% P00_F returns the objective function value for a problem specified by index.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function values.
%
  if ( problem == 1 )
    f = p01_f ( m, n, x );
  elseif ( problem == 2 )
    f = p02_f ( m, n, x );
  elseif ( problem == 3 )
    f = p03_f ( m, n, x );
  elseif ( problem == 4 )
    f = p04_f ( m, n, x );
  elseif ( problem == 5 )
    f = p05_f ( m, n, x );
  elseif ( problem == 6 )
    f = p06_f ( m, n, x );
  elseif ( problem == 7 )
    f = p07_f ( m, n, x );
  elseif ( problem == 8 )
    f = p08_f ( m, n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Problem index out of bounds.\n' );
    error ( 'P00_F - Fatal error!' );
  end

  return
end
