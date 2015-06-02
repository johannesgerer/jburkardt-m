function r8_uniform_01_test ( )

%*****************************************************************************80
%
%% R8_UNIFORM_01_TEST tests R8_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  R8_UNIFORM_01 produces a sequence of random values.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using random seed %d\n', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEED  R8_UNIFORM_01(SEED)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    seed_old = seed;
    [ x, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %12d  %14f\n', seed, x );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Verify that the sequence can be restarted.\n' );
  fprintf ( 1, '  Set the seed back to its original value, and see that\n' );
  fprintf ( 1, '  we generate the same sequence.\n' );

  seed = 123456789;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEED  R8_UNIFORM_01(SEED)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    seed_old = seed;
    [ x, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %12d  %14f\n', seed, x );
  end

  return
end
