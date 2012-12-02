function linplus_test39 ( )

%*****************************************************************************80
%
%% TEST39 tests R8GE_POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST39\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_POLY computes the characteristic polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  p_true = [ ...   
         1.0E+00,    -23.0E+00,    231.0E+00,  -1330.0E+00,   4845.0E+00, ...
    -11628.0E+00,  18564.0E+00, -19448.0E+00,  12870.0E+00,  -5005.0E+00, ...
      1001.0E+00,    -78.0E+00,      1.0E+00 ];
%
%  Set the matrix.
%
  for i = 1 : n
    for j = 1 : n
      a(i,j) = min ( i, j );
    end
  end
%
%  Get the characteristic polynomial.
%
  p = r8ge_poly ( n, a );
%
%  Compare.
%
  r8vec2_print_some ( n+1, p, p_true, 10, 'I, P(I), True P(I)' );

  return
end
