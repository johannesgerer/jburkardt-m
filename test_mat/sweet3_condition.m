function value = sweet3_condition ( )

%*****************************************************************************80
%
%% SWEET3_CONDITION returns the L1 condition of the SWEET3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 58.0;
  b_norm = 0.427215561206108;
  value = a_norm * b_norm;

  return
end
