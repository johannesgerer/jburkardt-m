function uniform_test065 ( )

%*****************************************************************************80
%
%% TEST065 tests I4_SEED_ADVANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST065\n' );
  fprintf ( 1, '  I4_SEED_ADVANCE advances the seed.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step        SEED input       SEED output\n' );
  fprintf ( 1, '\n' );

  seed_new = 12345;

  for step = 1 : 10

    seed = seed_new;
    seed_new = i4_seed_advance ( seed );

    fprintf ( 1, '  %4d  %16d  %16d\n', step, seed, seed_new );

  end

  return
end
