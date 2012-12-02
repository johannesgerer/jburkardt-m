function cond = combin_condition ( alpha, beta, n )

%*****************************************************************************80
%
%% COMBIN_CONDITION returns the L1 condition of the COMBIN matrix.
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
%    Input, real ALPHA, BETA, scalars that define A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real COND, the L1 condition.
%
  a_norm = abs ( alpha + beta ) + ( n - 1 ) * abs ( beta );

  b_norm_top = abs ( alpha + ( n - 1 ) * beta ) + ( n - 1 ) * abs ( beta );

  b_norm_bot = abs ( alpha * ( alpha + n * beta ) );

  b_norm = b_norm_top / b_norm_bot;

  cond = a_norm * b_norm;

  return
end
