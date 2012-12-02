function linplus_test295 ( )

%*****************************************************************************80
%
%% TEST295 tests R8GE_DILU.
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
  ncol = 3;
  nrow = 3;
  n = nrow * ncol;
  m = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST295\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_DILU returns the DILU factors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  for i = 1 : nrow * ncol
    for j = 1 : nrow * ncol

      if ( i == j )
        a(i,j) = 4.0E+00;
      elseif ( i == j + 1 | i == j - 1 | i == j + nrow | i == j - nrow )
        a(i,j) = -1.0E+00;
      else
        a(i,j) = 0.0E+00;
      end

    end
  end

  r8ge_print ( m, n, a, '  Matrix A:' );
%
%  Compute the incomplete LU factorization.
%
  d = r8ge_dilu ( m, n, a );

  r8vec_print ( m, d, '  DILU factor:' );

  return
end
