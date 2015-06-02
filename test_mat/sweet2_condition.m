function value = sweet2_condition ( )

%*****************************************************************************80
%
%% SWEET2_CONDITION returns the L1 condition of the SWEET2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 30.733333333333334;
  b_norm = 1.601605164968818;
  value = a_norm * b_norm;

  return
end
