function cond = bab_condition ( n, alpha, beta )

%*****************************************************************************80
%
%% BAB_CONDITION returns the L1 condition of the BAB matrix.
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
%    Input, real ALPHA, BETA, the parameters.
%
%    Output, real COND, the L1 condition number.
%
  a = bab ( n, alpha, beta );
  a_norm = r8mat_norm_l1 ( n, n, a );

  b = bab_inverse ( n, alpha, beta );
  b_norm = r8mat_norm_l1 ( n, n, b );

  cond = a_norm * b_norm;

  return
end
