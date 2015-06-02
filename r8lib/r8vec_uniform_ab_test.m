function r8vec_uniform_ab_test ( )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_AB_TEST tests R8VEC_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  a = 10.0;
  b = 20.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  R8VEC_UNIFORM_AB returns a random R8VEC\n' );
  fprintf ( 1, '  with entries in a given range [ A, B ]\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this problem:\n' );
  fprintf ( 1, '  A = %f\n', a );
  fprintf ( 1, '  B = %f\n', b );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for j = 1 : 3

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Input SEED = %12d\n', seed );
    fprintf ( 1, '\n' );

    [ r, seed ] = r8vec_uniform_ab ( n, a, b, seed );

    r8vec_print ( n, r, '  Random R8VEC:' );

  end

  return
end
