function value = wilk05_condition ( )

%*****************************************************************************80
%
%% WILK05_CONDITION returns the L1 condition of the WILK05 matrix.
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
  a_norm = 1.98288;
  b_norm = 4.002777777857721E+06;
  value = a_norm * b_norm;

  return
end
