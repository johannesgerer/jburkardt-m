function value = pascal3_condition ( n, alpha )

%*****************************************************************************80
%
%% PASCAL3_CONDITION returns the L1 condition of the PASCAL3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real VALUE, the L1 condition.
%
  a = pascal3 ( n, alpha );
  a_norm = r8mat_norm_l1 ( n, n, a );
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
