function subset_test040 ( )

%*****************************************************************************80
%
%% TEST040 tests I4MAT_U1_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 6;

  a = [ 1,  1,  0,  0,  0, 75;
        0,  1,  0,  0,  0,  0;
        0,  0,  1,  1,  0,  0;
        0,  0,  0,  1,  0,  0;
        0,  0,  0,  0,  1,  1;
        0,  0,  0,  0,  0,  1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST040\n' );
  fprintf ( 1, '  I4MAT_U1_INVERSE inverts a unit upper triangular matrix.\n' );

  i4mat_print ( n, n, a, '  The input matrix:' );
 
  b = i4mat_u1_inverse ( n, a );
 
  i4mat_print ( n, n, b, '  The inverse:' );

  return
end
