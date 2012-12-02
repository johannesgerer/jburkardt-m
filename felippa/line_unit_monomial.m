function value = line_unit_monomial ( alpha )

%*****************************************************************************80
%
%% LINE_UNIT_MONOMIAL: monomial integral in a unit line.
%
%  Discussion:
%
%    This function returns the integral of X^ALPHA over the unit line.
%
%    The integration region is defined as:
%
%    - 1.0 <= X <= 1.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ALPHA, the exponent of X.
%    ALPHA must not be -1.
%
%    Output, real value, the integral of the monomial.
%
  if ( alpha == - 1 )
    fprintf ( 1, 'n' );
    fprintf ( 1, 'LINE_UNIT_MONOMIAL - Fatal error!\n' );
    fprintf ( 1, '  ALPHA = -1 is not a legal input.\n' );
    error ( 'LINE_UNIT_MONOMIAL - Fatal error!' );
  elseif ( mod ( alpha, 2 ) == 1 )
    value = 0.0;
  else
    value = 2.0 / ( alpha + 1 );
  end

  return
end
