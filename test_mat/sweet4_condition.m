function value = sweet4_condition ( )

%*****************************************************************************80
%
%% SWEET4_CONDITION returns the L1 condition of the SWEET4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 100.3190000000000;
  b_norm = 0.510081684645161;
  value = a_norm * b_norm;

  return
end
