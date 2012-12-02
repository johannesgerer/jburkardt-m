function value = p00_f ( prob, n, x )

%*****************************************************************************80
%
%% P00_F evaluates the function for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the number of the desired test problem.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real VALUE(N), the function values.
%
  if ( prob == 1 )
    value = p01_f ( n, x );
  elseif ( prob == 2 )
    value = p02_f ( n, x );
  elseif ( prob == 3 )
    value = p03_f ( n, x );
  elseif ( prob == 4 )
    value = p04_f ( n, x );
  elseif ( prob == 5 )
    value = p05_f ( n, x );
  elseif ( prob == 6 )
    value = p06_f ( n, x );
  elseif ( prob == 7 )
    value = p07_f ( n, x );
  elseif ( prob == 8 )
    value = p08_f ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    value = 0.0
    error ( 'P00_F - Fatal error!' );
  end

  return
end
