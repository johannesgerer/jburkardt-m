function collatz_test02 ( )

%*****************************************************************************80
%
%% COLLATZ_TEST02 tests COLLATZ_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST02\n' );
  fprintf ( 1, '  COLLATZ_COUNT computes the length of the Collatz sequence\n' );
  fprintf ( 1, '  for a given seed.\n' );

  for seed = 1 : 100
      
    n = collatz_count ( seed );
    fprintf ( 1, '  %4d  %8d\n', seed, n );

  end

  return
end
