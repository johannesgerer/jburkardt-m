function value = znorm1 ( z )

%*****************************************************************************80
%
%% ZNORM1 evaluates the normal CDF from 0 to Z.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Z, the upper limit.
%
%    Output, real VALUE, the probability that a standard
%    normal variable will lie between -oo and Z.
%
  value = 0.5 * erf ( z / sqrt ( 2.0 ) );

  return
end
