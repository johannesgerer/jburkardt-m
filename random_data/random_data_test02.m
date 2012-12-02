function random_data_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests R8_NORMAL_01
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
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  R8_NORMAL_01 generates a single normal\n' );
  fprintf ( 1, '  pseudorandom value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Seed          Seed       R8_NORMAL_01\n' );
  fprintf ( 1, '    (Input)       (Output)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    seed_in = seed;
    [ x, seed ] = r8_normal_01 ( seed );
    fprintf ( 1, '  %12d  %12d  %12f\n', seed_in, seed, x );

  end

  return
end
