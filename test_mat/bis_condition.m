function value = bis_condition ( alpha, beta, n )

%*****************************************************************************80
%
%% BIS_CONDITION returns the L1 condition of the BIS matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, the scalars which define the
%    diagonal and first superdiagonal of the matrix.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition of the matrix.
%
  a_norm = abs ( alpha ) + abs ( beta );
  ba = abs ( beta / alpha );
  b_norm = ( ba ^ n - 1.0 ) / ( ba - 1.0 ) / abs ( alpha );
  value = a_norm * b_norm;

  return
end
