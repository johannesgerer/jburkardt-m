function x = cc_abscissas_ab ( a, b, n )

%*****************************************************************************80
%
%% CC_ABSCISSAS_AB computes Clenshaw Curtis abscissas for the interval [A,B].
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
    theta(i) = ( n - i ) * pi ...
             / ( n - 1 );
  end

  x(1:n) = 0.5 * ( ( b + a ) + ( b - a ) * cos ( theta(1:n) ) );

  return
end
