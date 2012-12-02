function r8lib_test151 ( )

%*****************************************************************************80
%
%% R8LIB_TEST151 tests R8VEC_UNIFORM.
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
  n = 20;

  alo = 10.0;
  ahi = 20.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST151\n' );
  fprintf ( 1, '  R8VEC_UNIFORM returns a random R8VEC\n' );
  fprintf ( 1, '  with entries in a given range [ ALO, AHI ]\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this problem:\n' );
  fprintf ( 1, '  ALO = %f\n', alo );
  fprintf ( 1, '  AHI = %f\n', ahi );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for j = 1 : 3

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Input SEED = %12d\n', seed );
    fprintf ( 1, '\n' );

    [ r, seed ] = r8vec_uniform_ab ( n, alo, ahi, seed );

    r8vec_print_some ( n, r, 1, 10, '  Random vector:' );

  end

  return
end
