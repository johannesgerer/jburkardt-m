function value = wilk04_condition ( )

%*****************************************************************************80
%
%% WILK04_CONDITION returns the L1 condition of the WILK04 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 2.1306;
  b_norm = 1.154098458240528E+16;
  value = a_norm * b_norm;

  return
end
