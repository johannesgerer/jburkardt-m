function exact = p55_exact ( )

%*****************************************************************************80
%
%% P55_EXACT returns the exact integral for problem 55.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  [ a, b ] = p55_lim ( );
  c = p55_param ( 'GET', 'C', [] );
  x0 = p55_param ( 'GET', 'X0', [] );

  exact = sqrt ( pi ) * ( erf ( c * ( b - x0 ) ) - erf ( c * ( a - x0 ) ) ) ...
    / ( 2.0 * c );

  return
end
