function [ c, s ] = spherical_harmonic ( l, m, theta, phi )

%*****************************************************************************80
%
%% SPHERICAL_HARMONIC evaluates spherical harmonic functions.
%
%  Discussion:
%
%    The spherical harmonic function Y(L,M,THETA,PHI)(X) is the
%    angular part of the solution to Laplace's equation in spherical
%    coordinates.
%
%    Y(L,M,THETA,PHI)(X) is related to the associated Legendre
%    function as follows:
%
%      Y(L,M,THETA,PHI)(X) = FACTOR * P(L,M)(cos(THETA)) * exp ( i * M * PHI )
%
%    Here, FACTOR is a normalization factor:
%
%      FACTOR = sqrt ( ( 2 * L + 1 ) * ( L - M )! / ( 4 * PI * ( L + M )! ) )
%
%    In Mathematica, a spherical harmonic function can be evaluated by
%
%      SphericalHarmonicY [ l, m, theta, phi ]
%
%    Note that notational tradition in physics requires that THETA
%    and PHI represent the reverse of what they would normally mean
%    in mathematical notation; that is, THETA goes up and down, and
%    PHI goes around.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Eric Weisstein,
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 1999.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input, integer L, the first index of the spherical harmonic function.
%    Normally, 0 <= L.
%
%    Input, integer M, the second index of the spherical harmonic function.
%    Normally, -L <= M <= L.
%
%    Input, real THETA, the polar angle, for which
%    0 <= THETA <= PI.
%
%    Input, real PHI, the longitudinal angle, for which
%    0 <= PHI <= 2*PI.
%
%    Output, real C(1:L+1), S(1:L+1), the real and imaginary
%    parts of the functions Y(L,0:L,THETA,PHI).
%
  m_abs = abs ( m );

  plm(1:l+1) = legendre_associated_normalized ( l, m_abs, cos ( theta ) );

  c(1:l+1) = plm(1:l+1) * cos ( m * phi );
  s(1:l+1) = plm(1:l+1) * sin ( m * phi );

  if ( m < 0 )
    c(1:l+1) = -c(1:l+1);
    s(1:l+1) = -s(1:l+1);
  end

  return
end
