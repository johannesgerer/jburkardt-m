function value = rutis1_condition ( )

%*****************************************************************************80
%
%% RUTIS1_CONDITION returns the L1 condition of the RUTIS1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 15.0;
  b_norm = 1.0;
  value = a_norm * b_norm;

  return
end
