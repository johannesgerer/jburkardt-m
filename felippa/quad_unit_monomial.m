function value = quad_unit_monomial ( expon )

%*****************************************************************************80
%
%% QUAD_UNIT_MONOMIAL integrates a monomial over the unit quadrilateral.
%
%  Discussion:
%
%    This routine integrates a monomial of the form
%
%      product ( 1 <= dim <= 2 ) x(dim)^expon(dim)
%
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
%
%    The integration region is defined as:
%
%    - 1.0 <= X <= 1.0
%    - 1.0 <= Y <= 1.0
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
%    Input, integer EXPON(2), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%
  value = 1.0;

  for i = 1 : 2

    if ( mod ( expon(i), 2 ) == 1 )
      value = 0.0;
    elseif ( expon(i) == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'QUAD_UNIT_MONOMIAL - Fatal error!\n' );
      fprintf ( 1, '  Exponent of -1 encountered.\n' );
      error ( 'QUAD_UNIT_MONOMIAL - Fatal error!' );
    else
      value = value * 2.0 / ( expon(i) + 1 );
    end

  end

  return
end
