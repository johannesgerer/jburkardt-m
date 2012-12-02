function x = nco_abscissas_ab ( a, b, n )

%*****************************************************************************80
%
%% NCO_ABSCISSAS_AB computes the Newton Cotes Open abscissas for [A,B].
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
  for i = 1 : n
    x(i) = ( ( n - i + 1 ) * a   ...
           + (     i     ) * b ) ...
           / ( n     + 1 );
  end

  return
end
