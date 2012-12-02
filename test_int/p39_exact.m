function exact = p39_exact ( )

%*****************************************************************************80
%
%% P39_EXACT returns the exact integral for problem 39.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  alpha = p39_param_get ( );

  exact = ( ( 2.0 / 3.0 )^( alpha + 1.0 ) ...
          + ( 1.0 / 3.0 )^( alpha + 1.0 ) ) / ( alpha + 1.0 );

  return
end
