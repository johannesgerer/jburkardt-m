function value = znorm2 ( z )

%*****************************************************************************80
%
%% ZNORM2 evaluates the normal CDF from Z to +oo.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    013 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Z, the lower limit.
%
%    Output, real VALUE, the probability that a standard
%    normal variable will lie between Z and +oo.
%
  value = 0.5 * erfc ( z / sqrt ( 2.0 ) );

  return
end
