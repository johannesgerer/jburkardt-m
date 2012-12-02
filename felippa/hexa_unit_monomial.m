function value = hexa_unit_monomial ( expon )

%*****************************************************************************80
%
%% HEXA_UNIT_MONOMIAL integrates a monomial over the unit hexahedron.
%
%  Discussion:
%
%    This routine integrates a monomial of the form
%
%      product ( 1 <= dim <= 3 ) x(dim)^expon(dim)
%
%    The combination 0^0 should be treated as 1.
%
%    The integration region is defined as:
%
%    - 1.0 <= X <= 1.0
%    - 1.0 <= Y <= 1.0
%    - 1.0 <= Z <= 1.0
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
%    Input, integer EXPON(3), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%
  value = 1.0;

  for i = 1 : 3

    if ( mod ( expon(i), 2 ) == 1 )
      value = 0.0;
    elseif ( expon(i) == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HEXA_UNIT_MONOMIAL - Fatal error!\n' );
      fprintf ( 1, '  Exponent of -1 encountered.\n' );
      error ( 'HEXA_UNIT_MONOMIAL - Fatal error!' );
    else
      value = value * 2.0 / ( expon(i) + 1 );
    end

  end

  return
end
