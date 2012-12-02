function fx = p00_fun ( problem, n, x )

%*****************************************************************************80
%
%% P00_FUN evaluates the integrand for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(2,N), the evaluation points.
%
%    Output, real FX(N,1), the integrand values.
%
  fx = zeros ( n, 1 );

  if ( problem == 1 )
    fx = p01_fun ( n, x );
  elseif ( problem == 2 )
    fx = p02_fun ( n, x );
  elseif ( problem == 3 )
    fx = p03_fun ( n, x );
  elseif ( problem == 4 )
    fx = p04_fun ( n, x );
  elseif ( problem == 5 )
    fx = p05_fun ( n, x );
  elseif ( problem == 6 )
    fx = p06_fun ( n, x );
  elseif ( problem == 7 )
    fx = p07_fun ( n, x );
  elseif ( problem == 8 )
    fx = p08_fun ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index = %d\n', problem );
    error ( 'P00_FUN - Fatal error!\n' );
  end

  return
end
