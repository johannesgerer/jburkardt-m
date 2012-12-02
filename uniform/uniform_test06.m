function uniform_test06 ( )

%*****************************************************************************80
%
%% UNIFORM_TEST06 tests GET_SEED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 June 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_TEST06\n' );
  fprintf ( 1, '  GET_SEED picks an initial seed value for R8_UNIFORM_01.\n' );
  fprintf ( 1, '  The value chosen should vary over time, because\n' );
  fprintf ( 1, '  the seed is based on reading the clock.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This is just the "calendar" clock, which does\n' );
  fprintf ( 1, '  not change very fast, so calling GET_SEED several\n' );
  fprintf ( 1, '  times in a row may result in the same value.\n' );

  seed = 12345678;
  seed_old = seed;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial seed is %12d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Next 3 values of R8_UNIFORM_01:\n' );
  fprintf ( 1, '\n' );

  for j = 1 : 3
    [ r, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %f\n', r );
  end

  for i = 1 : 4

    while ( 1 )

      seed = get_seed ( );

      if ( seed ~= seed_old )
        seed_old = seed;
        break;
      end

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  New seed from GET_SEED is %12d\n', seed );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Next 3 values of R8_UNIFORM_01:\n' );
    fprintf ( 1, '\n' );

    for j = 1 : 3
      [ r, seed ] = r8_uniform_01 ( seed );
      fprintf ( 1, '  %f\n', r );
    end

  end

  return
end
