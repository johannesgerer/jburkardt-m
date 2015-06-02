function mono_upto_next_grevlex_test ( )

%*****************************************************************************80
%
%% MONO_UPTO_NEXT_GREVLEX_TEST tests MONO_UPTO_NEXT_GREVLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONO_UPTO_NEXT_GREVLEX_TEST\n' );
  fprintf ( 1, '  MONO_UPTO_NEXT_GREVLEX can list the monomials\n' );
  fprintf ( 1, '  in M variables, of total degree up to N,\n' );
  fprintf ( 1, '  one at a time, in graded reverse lexicographic order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We start the process with (0,0,...0,0).\n' );
  fprintf ( 1, '  The process ends with (N,0,...,0,0)\n' );

  test_num = 2;
  n_test = [ 4, 3 ];
  m_test = [ 3, 4 ];

  for test = 1 : test_num

    n = n_test(test);
    m = m_test(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Let M = %d\n', m );
    fprintf ( 1, '      N = %d\n', n );
    fprintf ( 1, '\n' );

    x = zeros ( m, 1 );
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

      x = mono_upto_next_grevlex ( m, n, x );
      i = i + 1;

    end

  end

  return
end
