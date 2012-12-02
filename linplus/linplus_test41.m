function linplus_test41 ( )

%*****************************************************************************80
%
%% TEST41 tests R8GE_TRF, R8GE_TRS.
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
  n = 5;
  m = n;
  nrhs = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST41\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_TRF computes the LU factors,\n' );
  fprintf ( 1, '  R8GE_TRS solves a factored system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of matrix rows M = %d\n', m );
  fprintf ( 1, '  Number of matrix columns N = %d\n', n );

  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = 2.0E+00;
      elseif ( i == j - 1 )
        a(i,j) = - 1.0E+00;
      elseif ( i == j + 1 )
        a(i,j) = - 1.0E+00;
      else
        a(i,j) = 0.0E+00;
      end
    end
  end

  [ a_lu, pivot, info ] = r8ge_trf ( m, n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST41 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_TRF declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  b(1:n-1,1) = 0.0E+00;
  b(n,1) = n + 1;

  [ x, info ] = r8ge_trs ( n, nrhs, 'N', a_lu, pivot, b );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST41 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_TRS returned an error condition!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  r8vec_print ( n, x, '  Solution:' );

  b(1:n-1,1) = 0.0E+00;
  b(n,1) = n + 1;

  [ x, info ] = r8ge_trs ( n, nrhs, 'T', a_lu, pivot, b );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST41 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_TRS returned an error condition!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  r8vec_print ( n, x, '  Solution to transposed system:' );

  return
end
