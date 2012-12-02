function random_data_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests R8_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03:\n' );
  fprintf ( 1, '  R8_UNIFORM_01 generates a single uniform\n' );
  fprintf ( 1, '  pseudorandom value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Seed          Seed       R8_UNIFORM_01\n' );
  fprintf ( 1, '    (Input)       (Output)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    seed_in = seed;
    [ x, seed ] = r8_uniform_01 ( seed );

    fprintf ( 1, '  %12d  %12d  %12f\n', seed_in, seed, x );

  end

  return
end
