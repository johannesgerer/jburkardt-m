function subpak_test064 ( )

%*****************************************************************************80
%
%% TEST064 tests R8MAT_INVERSE_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 2;
%
%  Each ROW of this definion is a COLUMN of the matrix.
%
  a = [ ...
    1.0, 3.0; ...
    2.0, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST064\n' );
  fprintf ( 1, '  R8MAT_INVERSE_2D inverts a 2 by 2 matrix.\n' );

  r8mat_print ( n, n, a, '  Matrix A to invert:' );
%
%  Compute the inverse matrix.
%
  [ b, det ] = r8mat_inverse_2d ( a );
 
  if ( det == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The input matrix was singular, no inverse\n' );
    fprintf ( 1, '  could be computed.\n' );
    return
  end

  r8mat_print ( n, n, b, '  Inverse matrix B:' );

  c = a * b;

  r8mat_print ( n, n, c, '  Product C = A * B:' );

  return
end
