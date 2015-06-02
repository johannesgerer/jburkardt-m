function r8mat_expand_linear2_test ( )

%*****************************************************************************80
%
%% R8MAT_EXPAND_LINEAR2_TEST tests R8MAT_EXPAND_LINEAR2.
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
  m = 3;
  m2 = 10;
  n = 2;
  n2 = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_EXPAND_LINEAR2_TEST\n' );
  fprintf ( 1, '  R8MAT_EXPAND_LINEAR2 fills in a large array by\n' );
  fprintf ( 1, '  interpolating data from a small array.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original matrix has dimensions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M = %d, N = %d\n', m, n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expanded matrix has dimensions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M2 = %d, N2 = %d\n', m2, n2 );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = 10.0 * i + j;
    end
  end

  r8mat_print ( m, n, a, '  The little matrix A:' );
 
  a2 = r8mat_expand_linear2 ( m, n, a, m2, n2 );
 
  r8mat_print ( m2, n2, a2, '  Expanded array A2:' );
 
  return
end
