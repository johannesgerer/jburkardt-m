function value = rutis2_condition ( )

%*****************************************************************************80
%
%% RUTIS2_CONDITION returns the L1 condition of the RUTIS2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 11.0;
  b_norm = 1.04;
  value = a_norm * b_norm;

  return
end
