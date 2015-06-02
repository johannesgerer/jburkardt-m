function value = daub2_condition ( n )

%*****************************************************************************80
%
%% DAUB2_DETERMINANT returns the L1 condition of the DAUB2 matrix.
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
  c0 = sqrt ( 2.0 ) / 2.0;
  c1 = sqrt ( 2.0 ) / 2.0;

  a_norm = abs ( c0 ) + abs ( c1 );
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
