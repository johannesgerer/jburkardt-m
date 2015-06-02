function r8vec_chebyspace_test ( )

%*****************************************************************************80
%
%% R8VEC_CHEBYSPACE_TEST tests R8VEC_CHEBYSPACE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_CHEBYSPACE_TEST\n' );
  fprintf ( 1, '  R8VEC_CHEBYSPACE computes N Chebyshev points in [R1,R2].\n' );

  r1 = -1.0;
  r2 = +1.0;
  n = 5;

  r = r8vec_chebyspace ( n, r1, r2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d,  R1 = %f,  R2 = %f\n', n, r1, r2 );

  r8vec_print ( n, r, '  Chebyshev points:' );

  r1 =   0.0;
  r2 = +10.0;
  n = 7;

  r = r8vec_chebyspace ( n, r1, r2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d,  R1 = %f,  R2 = %f\n', n, r1, r2 );

  r8vec_print ( n, r, '  Chebyshev points:' );

  return
end
