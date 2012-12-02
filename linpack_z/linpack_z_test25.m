function linpack_z_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests ZPPFA and ZPPSL.
%
%  Discussion:
%
%    ZPOFA factors a Hermitian positive definite packed matrix,
%    and ZPOSL can solve a factored linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian positive definite packed matrix (PP),\n' );
  fprintf ( 1, '  ZPPFA factors the matrix.\n' );
  fprintf ( 1, '  ZPPSL solves a factored linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1) = complex ( 2.5281,  0.0000 );

  a(2) = complex ( 2.1341, -0.2147 );
  a(3) = complex ( 3.0371,  0.0000 );

  a(4) = complex ( 2.4187,  0.2932 );
  a(5) = complex ( 2.0905,  1.1505 );
  a(6) = complex ( 2.7638,  0.0000 );

  b(1) = complex ( 20.12350, 28.92670 );
  b(2) = complex ( 14.36550, 34.92680 );
  b(3) = complex ( 27.69760, 26.03750 );
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = zppfa ( a, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, ZPPFA returns INFO = %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the linear system.\n' );

  b = zppsl ( a, n, b );
%
%  Print the result.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution:\n' );
  fprintf ( 1, '  (Should be (1+2i),(3+4i),(5+6i):\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  (%8f  %8f)\n', i, real ( b(i) ), imag ( b(i) ) );
  end

  return
end
