function haar_test01 ( )

%*****************************************************************************80
%
%% HAAR_TEST01 tests HAAR_1D and HAAR_1D_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HAAR_TEST01\n' );
  fprintf ( 1, '  HAAR_1D computes the Haar transform of a vector.\n' );
  fprintf ( 1, '  HAAR_1D_INVERSE inverts the transform.\n' );
%
%  Demonstrate successful inversion.
%
  n = 16;
  seed = 123456789;
  [ u, seed ] = r8vec_uniform_01 ( n, seed );

  v = haar_1d ( n, u );

  w = haar_1d_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        H(U)(i)  Hinv(H(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10f  %10f  %10f\n', i, u(i), v(i), w(i) );
  end
%
%  Constant signal.
%
  n = 8;
  u = ones ( n, 1 );

  v = haar_1d ( n, u );

  w = haar_1d_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        H(U)(i)  Hinv(H(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10f  %10f  %10f\n', i, u(i), v(i), w(i) );
  end
%
%  Linear signal.
%
  n = 16;
  u = ( 1 : n )';

  v = haar_1d ( n, u );

  w = haar_1d_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        H(U)(i)  Hinv(H(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10f  %10f  %10f\n', i, u(i), v(i), w(i) );
  end
%
%  Quadratic data.
%
  n = 8;
  u = [ 25, 16, 9, 4, 1, 0, 1, 4 ];

  v = haar_1d ( n, u );

  w = haar_1d_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        H(U)(i)  Hinv(H(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10f  %10f  %10f\n', i, u(i), v(i), w(i) );
  end
%
%  N not a power of 2.
%
  n = 99;
  u = rand ( n, 1 );

  v = haar_1d ( n, u );

  w = haar_1d_inverse ( n, v );

  err = norm ( u - w );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For N = %d, ||u-haar_1d_inverse(haar_1d(u))|| = %g\n', n, err );

  return
end
