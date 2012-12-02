function normal_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests R8_NORMAL_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 February 2012
%
%  Author:
%
%    John Burkardt
%
  seed_init = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  R8_NORMAL_01 computes a sequence of \n' );
  fprintf ( 1, '  normally distributed pseudorandom numbers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Verify that we can change the seed\n' );
  fprintf ( 1, '  and get the desired results.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed_init );
  fprintf ( 1, '\n' );

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         I    Seed(in)   Seed(out)   R8_NORMAL_01\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    seed_input = seed;
    [ value, seed ] = r8_normal_01 ( seed );
    seed_output = seed;

    fprintf ( 1, '  %8d  %12d  %12d  %14f\n', ...
      i, seed_input, seed_output, value );
  end

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Resetting seed to repeat, after an ODD number of steps.\n' );
  fprintf ( 1, '\n' );

  for i = 6 : 10
    seed_input = seed;
    [ value, seed ] = r8_normal_01 ( seed );
    seed_output = seed;

    fprintf ( 1, '  %8d  %12d  %12d  %14f\n', ...
      i, seed_input, seed_output, value );
  end

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Resetting seed to repeat, after an EVEN number of steps.\n' );
  fprintf ( 1, '\n' );

  for i = 11 : 15
    seed_input = seed;
    [ value, seed ] = r8_normal_01 ( seed );
    seed_output = seed;

    fprintf ( 1, '  %8d  %12d  %12d  %14f\n', ...
      i, seed_input, seed_output, value );
  end

  return
end
