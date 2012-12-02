function value = c8_norm_li ( x )

%*****************************************************************************80
%
%% C8_NORM_LI evaluates the L-infinity norm of a C8.
%
%  Discussion:
%
%    Numbers of equal norm lie along squares whose centers are at (0,0).
%
%    The L-infinity norm can be defined here as:
%
%      C8_NORM_LI(X) = max ( abs ( real (X) ), abs ( imag (X) ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex X, the value whose norm is desired.
%
%    Output, real VALUE, the infinity norm of X.
%
  value = max ( abs ( real ( x ) ), abs ( imag ( x ) ) );

  return
end
