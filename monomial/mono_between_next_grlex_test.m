function mono_between_next_grlex_test ( )

%*****************************************************************************80
%
%% MONO_BETWEEN_NEXT_GRLEX_TEST tests MONO_BETWEEN_NEXT_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONO_BETWEEN_NEXT_GRLEX_TEST\n' );
  fprintf ( 1, '  MONO_BETWEEN_NEXT_GRLEX can list the monomials\n' );
  fprintf ( 1, '  in M variables, of total degree N between N1 and N2,\n' );
  fprintf ( 1, '  one at a time, in graded lexicographic order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We start the process with (0,0,...,0,N1).\n' );
  fprintf ( 1, '  The process ends with (N2,0,...,0,0)\n' );

  n1 = 2;
  n2 = 3;
  m = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let M =  %d\n', m );
  fprintf ( 1, '      N1 = %d\n', n1 );
  fprintf ( 1, '      N2 = %d\n', n2 );
  fprintf ( 1, '\n' );

  x = [ 0, 0, n1 ];
  i = 1;

  while ( 1 )

    fprintf ( 1, '  %2d:', i );
    for j = 1 : m
      fprintf ( 1, '  %1d', x(j) );
    end
    fprintf ( 1, '\n' );

    if ( x(1) == n2 )
      break
    end

    x = mono_between_next_grlex ( m, n1, n2, x );
    i = i + 1;

  end

  return
end
