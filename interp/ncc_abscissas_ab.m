function x = ncc_abscissas_ab ( a, b, n )

%*****************************************************************************80
%
%% NCC_ABSCISSAS_AB computes the Newton Cotes Closed abscissas for [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), the abscissas.
%
  if ( n == 1 )
    x(1) = 0.5 * ( b + a );
    return
  end

  for i = 1 : n
    x(i) = ( ( n - i     ) * a   ...
           + (     i - 1 ) * b ) ...
           / ( n     - 1 );
  end

  return
end
