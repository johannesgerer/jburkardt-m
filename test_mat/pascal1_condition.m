function value = pascal1_condition ( n )

%*****************************************************************************80
%
%% PASCAL1_CONDITION returns the L1 condition of the PASCAL1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition.
%
  nhalf = floor ( ( n + 1 ) / 2 );
  a_norm = r8_choose ( n, nhalf );
  b_norm = r8_choose ( n, nhalf );
  value = a_norm * b_norm;

  return
end
