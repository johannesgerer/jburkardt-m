function value = sweet1_condition ( )

%*****************************************************************************80
%
%% SWEET1_CONDITION returns the L1 condition of the SWEET1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 61;
  b_norm = 0.278145899201815;
  value = a_norm * b_norm;

  return
end
