function value = moler4_condition ( )

%*****************************************************************************80
%
%% MOLER4_CONDITION returns the L1 condition of the MOLER4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 3.0;
  b_norm = 3.0;
  value = a_norm * b_norm;

  return
end