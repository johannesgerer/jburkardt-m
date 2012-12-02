function [ x, seed ] = dipole_sample ( a, b, seed )

%*****************************************************************************80
%
%% DIPOLE_SAMPLE samples the Dipole PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Knop,
%    Algorithm 441,
%    ACM Transactions on Mathematical Software.
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    A is arbitrary, but represents an angle, so only 0 <= A <= 2 * PI
%      is interesting,
%    and -1.0 <= B <= 1.0.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%

%
%  Find (X1,X2) at random in a circle.
%
  a2 = b * sin ( a );
  b2 = b * cos ( a );
  c2 = 1.0;

  [ x1, x2, seed ] = circle_sample ( a2, b2, c2, seed );
%
%  The dipole variate is the ratio X1 / X2.
%
  x = x1 / x2;

  return
end
