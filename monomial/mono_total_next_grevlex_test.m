function mono_total_next_grevlex_test ( )

%*****************************************************************************80
%
%% MONO_TOTAL_NEXT_GREVLEX_TEST tests MONO_TOTAL_NEXT_GREVLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONO_TOTAL_NEXT_GREVLEX_TEST\n' );
  fprintf ( 1, '  MONO_TOTAL_NEXT_GREVLEX can list the monomials\n' );
  fprintf ( 1, '  in M variables, of total degree N,\n' );
  fprintf ( 1, '  one at a time, in graded reverse lexicographic order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We start the process with (0,0,...,0,N).\n' );
  fprintf ( 1, '  The process ends with (N,0,...,0,0)\n' );

  n = 3;
  m = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let M = %d\n', m );
  fprintf ( 1, '      N = %d\n', n );
  fprintf ( 1, '\n' );

  x = [ 0, 0, n ];
  i = 1;

  while ( 1 )

    fprintf ( 1, '  %2d:', i );
    for j = 1 : m
      fprintf ( 1, '  %1d', x(j) );
    end
    fprintf ( 1, '\n' );

    if ( x(1) == n )
      break
    end

    x = mono_total_next_grevlex ( m, n, x );
    i = i + 1;

  end

  return
end
