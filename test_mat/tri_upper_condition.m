function cond = tri_upper_condition ( alpha, n )

%*****************************************************************************80
%
%% TRI_UPPER_CONDITION returns the L1 condition of the TRI_UPPER matrix.
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
%    Input, real ALPHA, value used on the superdiagonals.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real COND, the L1 condition.
%
  a_norm = ( n - 1 ) * abs ( alpha ) + 1.0;
  b_norm = 1.0 + abs ( alpha ) * ( 2.0 ^ ( n - 1 ) - 1.0 );
  cond = a_norm * b_norm;

  return
end
