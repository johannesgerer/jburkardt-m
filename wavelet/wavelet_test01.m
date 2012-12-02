function wavelet_test01 ( )

%*****************************************************************************80
%
%% WAVELET_TEST01 tests DAUB2_TRANSFORM and DAUB2_TRANSFORM_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WAVELET_TEST01\n' );
  fprintf ( 1, '  DAUB2_TRANSFORM computes the DAUB2 transform of a vector.\n' );
  fprintf ( 1, '  DAUB2_TRANSFORM_INVERSE inverts it.\n' );
%
%  Random data.
%
  n = 16;
  seed = 123456789;
  [ u, seed ] = r8vec_uniform_01 ( n, seed );

  v = daub2_transform ( n, u );

  w = daub2_transform_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        D2(U)(i)  D2inv(D2(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10.4f  %10.4f  %10.4f\n', i, u(i), v(i), w(i) );
  end
%
%  Constant signal.
%
  n = 8;
  u(1:n) = 1.0;

  v = daub2_transform ( n, u );

  w = daub2_transform_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        D2(U)(i)  D2inv(D2(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10.4f  %10.4f  %10.4f\n', i, u(i), v(i), w(i) );
  end
%
%  Linear signal.
%
  n = 16;
  a_first = 1.0;
  a_last = n;
  u = linspace ( a_first, a_last, n );

  v = daub2_transform ( n, u );

  w = daub2_transform_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        D2(U)(i)  D2inv(D2(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10.4f  %10.4f  %10.4f\n', i, u(i), v(i), w(i) );
  end
%
%  Quadratic data.
%
  n = 8;
  u(1) = 25.0;
  u(2) = 16.0;
  u(3) = 9.0;
  u(4) = 4.0;
  u(5) = 1.0;
  u(6) = 0.0;
  u(7) = 1.0;
  u(8) = 4.0;

  v = daub2_transform ( n, u );

  w = daub2_transform_inverse ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   i      U(i)        D2(U)(i)  D2inv(D2(U))(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10.4f  %10.4f  %10.4f\n', i, u(i), v(i), w(i) );
  end

  return
end
