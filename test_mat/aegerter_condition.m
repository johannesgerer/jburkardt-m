function rcond = aegerter_condition ( n )

%*****************************************************************************80
%
%% AEGERTER_CONDITION returns the L1 condition of the AEGERTER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real COND, the L1 condition.
%
  a = aegerter ( n );
  a_norm = r8mat_norm_l1 ( n, n, a );

  b = aegerter_inverse ( n );
  b_norm = r8mat_norm_l1 ( n, n, b );

  rcond = a_norm * b_norm;

  return
end
