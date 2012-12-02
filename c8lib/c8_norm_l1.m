function value = c8_norm_l1 ( x )

%*****************************************************************************80
%
%% C8_NORM_L1 evaluates the L1 norm of a C8.
%
%  Discussion:
%
%    Numbers of equal norm lie along diamonds centered at (0,0).
%
%    The L1 norm can be defined here as:
%
%      C8_NORM_L1(X) = abs ( real (X) ) + abs ( imag (X) )
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
%    Output, real VALUE, the norm of X.
%
  value = abs ( real ( x ) ) + abs ( imag ( x ) );

  return
end
