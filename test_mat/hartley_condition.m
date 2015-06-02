function value = hartley_condition ( n )

%*****************************************************************************80
%
%% HARTLEY_CONDITION returns the L1 condition of the HARTLEY matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = n;
  b_norm = 1.0;
  value = a_norm * b_norm;

  return
end
