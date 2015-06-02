function value = wilk12_condition ( )

%*****************************************************************************80
%
%% WILK12_CONDITION returns the L1 condition of the WILK12 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 78.0E+00;
  b_norm = 87909427.13689443E+00;
  value = a_norm * b_norm;

  return
end
