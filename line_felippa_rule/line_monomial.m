function value = line_monomial ( a, b, alpha )

%*****************************************************************************80
%
%% LINE_MONOMIAL: monomial integral over a line segment in 1D.
%
%  Discussion:
%
%    This function returns the integral of X^ALPHA.
%
%    The integration region is:
%    A <= X <= B
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the lower and upper limits.
%
%    Input, integer ALPHA, the exponent of X.
%    ALPHA must not be -1.
%
%    Output, real VALUE, the integral of the monomial.
%
  if ( alpha == - 1 )
    fprintf ( 1, 'n' );
    fprintf ( 1, 'LINE_MONOMIAL - Fatal error!\n' );
    fprintf ( 1, '  ALPHA = -1 is not a legal input.\n' );
    error ( 'LINE_MONOMIAL - Fatal error!' );
  end

  value = ( b ^ ( alpha + 1 ) - a ^ ( alpha + 1 ) ) / ( alpha + 1 );

  return
end
