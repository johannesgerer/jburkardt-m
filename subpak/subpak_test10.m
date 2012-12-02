function subpak_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests GET_SEED.
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
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  GET_SEED gets a seed for the random number\n' );
  fprintf ( 1, '    generator.  These values are computed from\n' );
  fprintf ( 1, '    the time and date.  Values computed nearby\n' );
  fprintf ( 1, '    in time will be near to each other, and\n' );
  fprintf ( 1, '    should be passed through a random number\n' );
  fprintf ( 1, '    generator a few times before use.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I	     R(I)	 R2(I)        R3(I)\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    seed = get_seed ( );
    seed_0 = seed;
    [ x, seed ] = r8_uniform_01 ( seed );
    seed_1 = seed;
    [ x, seed ] = r8_uniform_01 ( seed );
    seed_2 = seed;
    [ x, seed ] = r8_uniform_01 ( seed );
    seed_3 = seed;
    fprintf ( 1, '  %12d  %12d  %12d  %12d\n', seed_0, seed_1, seed_2, seed_3 );

  end

  return
end
