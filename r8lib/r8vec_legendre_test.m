function r8vec_legendre_test ( )

%*****************************************************************************80
%
%% R8VEC_LEGENDRE_TEST tests R8VEC_LEGENDRE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_LEGENDRE_TEST\n' );
  fprintf ( 1, '  R8VEC_LEGENDRE computes N Legendre points in [R1,R2].\n' );

  r1 = -1.0;
  r2 = +1.0;
  n = 5;

  r = r8vec_legendre ( n, r1, r2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d, R1 = %g, R2 = %g\n', n, r1, r2 );

  r8vec_print ( n, r, '  Legendre points:' );

  r1 =   0.0;
  r2 = +10.0;
  n = 7;

  r = r8vec_legendre ( n, r1, r2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d, R1 = %g, R2 = %g\n', n, r1, r2 );

  r8vec_print ( n, r, '  Legendre points:' );

  return
end
