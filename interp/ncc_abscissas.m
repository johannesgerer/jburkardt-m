function x = ncc_abscissas ( n )

%*****************************************************************************80
%
%% NCC_ABSCISSAS computes the Newton Cotes Closed abscissas.
%
%  Discussion:
%
%    The interval is [ -1, 1 ].
%
%    The abscissas are the equally spaced points between -1 and 1,
%    including the endpoints.
%
%    If N is 1, however, the single abscissas is X = 0.
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
  if ( n == 1 )
    x(1) = 0.0;
    return
  end

  for i = 1 : n
    x(i) = ( ( n - i     ) * ( -1.0 )   ...
           + (     i - 1 ) * ( +1.0 ) ) ...
           / ( n     - 1 );
  end

  return
end
