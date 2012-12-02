function polpak_test0216 ( )

%*****************************************************************************80
%
%% POLPAK_TEST0216 tests CHEBYSHEV_DISCRETE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2009
%
%  Author:
%
%    John Burkardt
%
  OFFSET = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLPAK_TEST0216:\n' );
  fprintf ( 1, '  CHEBYSHEV_DISCRETE evaluates discrete Chebyshev polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N      M         X        T(N,M,X)\n' );

  n = 5;
  m = 5;

  for j = 0 : 5

    x = j / 2.0;

    value = chebyshev_discrete ( n, m, x );

    fprintf ( 1, '\n' );

    for i = 0 : n

      fprintf ( 1, '  %8d  %8d  %8f  %14f\n', i, m, x, value(i+OFFSET) );

    end

  end

  return
end
