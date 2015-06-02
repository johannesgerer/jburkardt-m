function value = pyramid01_integral ( expon )

%*****************************************************************************80
%
%% PYRAMID01_INTEGRAL: monomial integral in a unit pyramid.
%
%  Discussion:
%
%    This routine returns the integral of
%
%      product ( 1 <= I <= 3 ) X(I)^EXPON(I)
%
%    over the unit pyramid.
%
%    The unit pyramid is defined as:
%
%    - ( 1 - Z ) <= X <= 1 - Z
%    - ( 1 - Z ) <= Y <= 1 - Z
%              0 <= Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer EXPON(3), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%
  value = 0.0;

  if ( mod ( expon(1), 2 ) == 0 && mod ( expon(2), 2 ) == 0 )

    i_hi = 2 + expon(1) + expon(2);

    for i = 0 : i_hi
      value = value + r8_mop ( i ) * r8_choose ( i_hi, i ) / ( i + expon(3) + 1 );
    end

    value = value * 2.0 / ( expon(1) + 1 ) * 2.0 / ( expon(2) + 1 );

  end

  return
end