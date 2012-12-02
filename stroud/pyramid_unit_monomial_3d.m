function value = pyramid_unit_monomial_3d ( alpha, beta, gamma )

%*****************************************************************************80
%
%% PYRAMID_UNIT_MONOMIAL_3D: monomial integral in a unit pyramid in 3D.
%
%  Discussion:
%
%    This routine returns the integral of X^ALPHA Y^BETA Z^GAMMA over
%    the unit pyramid.
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
%    05 April 2008
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
%    Input, integer ALPHA, BETA, GAMMA, the exponents of
%    X, Y and Z in the monomial.
%
%    Output, real PYRAMID_UNIT_MONOMIAL_3D, the volume of the pyramid.
%
  value = 0.0;

  if ( mod ( alpha, 2 ) == 0 & mod ( beta, 2 ) == 0 )

    i_hi = 2 + alpha + beta;

    for i = 0 : i_hi
      value = value + r8_mop ( i ) * r8_choose ( i_hi, i ) / ( i + gamma + 1 );
    end

    value = value * 2.0 / ( alpha + 1 ) * 2.0 / ( beta + 1 );

  end

  return
end
