function value = daub4_condition ( n )

%*****************************************************************************80
%
%% DAUB4_DETERMINANT returns the L1 condition of the DAUB4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
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
  c0 = ( 1.0 + sqrt ( 3.0 ) ) / sqrt ( 32.0 );
  c1 = ( 3.0 + sqrt ( 3.0 ) ) / sqrt ( 32.0 );
  c2 = ( 3.0 - sqrt ( 3.0 ) ) / sqrt ( 32.0 );
  c3 = ( 1.0 - sqrt ( 3.0 ) ) / sqrt ( 32.0 );

  a_norm = abs ( c0 ) + abs ( c1 ) + abs ( c2 ) + abs ( c3 );
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
