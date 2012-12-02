function linpack_z_test18 ( )

%*****************************************************************************80
%
%% TEST18 tests ZPBDI.
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
  m = 1;
  lda = m+1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  positive definite hermitian band matrix (PB),\n' );
  fprintf ( 1, '  ZPBDI computes the determinant as\n' );
  fprintf ( 1, '    det = MANTISSA * 10**EXPONENT\n' );
  fprintf ( 1, '\n' );
%
%  Set the value of the superdiagonal and diagonal.
%
  a(1,1) = complex ( 0.0000,  0.0000 );
  a(1,2) = complex ( 2.1341, -0.2147 );
  a(1,3) = complex ( 2.0905,  1.1505 );

  a(2,1) = complex ( 4.5281,  0.0000 );
  a(2,2) = complex ( 5.0371,  0.0000 );
  a(2,3) = complex ( 4.7638,  0.0000 );

  [ a, info ] = zpbfa ( a, lda, n, m );

  if ( info ~= 0 )
    fprintf ( 1, '  Error!  ZPBFA returns INFO = %d\n', info );
    return
  end

  det = zpbdi ( a, lda, n, m );

  fprintf ( 1, '  Determinant = %f * 10^(%f)\n', det(1), det(2) );

  return
end
