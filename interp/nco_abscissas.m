function x = nco_abscissas ( n )

%*****************************************************************************80
%
%% NCO_ABSCISSAS computes the Newton Cotes Open abscissas.
%
%  Discussion:
%
%    The interval is [ -1, 1 ].
%
%    The abscissas are the equally spaced points between -1 and 1,
%    not including the endpoints.
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
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), the abscissas.
%
  for i = 1 : n
    x(i) = ( ( n - i + 1 ) * ( -1.0 )   ...
           + (     i     ) * ( +1.0 ) ) ...
           / ( n     + 1 );
  end

  return
end
