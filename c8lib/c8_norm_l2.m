function value = c8_norm_l2 ( x )

%*****************************************************************************80
%
%% C8_NORM_L2 evaluates the L2 norm of a C8.
%
%  Discussion:
%
%    Numbers of equal norm lie on circles centered at (0,0).
%
%    The L2 norm can be defined here as:
%
%      C8_NORM_L2(X) = sqrt ( ( real (X) )**2 + ( imag ( X ) )**2 )
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
%    Output, real VALUE, the 2-norm of X.
%
  value = sqrt ( ( real ( x ) ).^2 + ( imag ( x ) ).^2 );

  return
end
