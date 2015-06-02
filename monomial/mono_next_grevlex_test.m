function mono_next_grevlex_test ( )

%*****************************************************************************80
%
%% MONO_NEXT_GREVLEX_TEST tests MONO_NEXT_GREVLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONO_NEXT_GREVLEX_TEST\n' );
  fprintf ( 1, '  MONO_NEXT_GREVLEX returns the next monomial\n' );
  fprintf ( 1, '  in graded reverse lexicographic order.\n' );

  m = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let M =  %d\n', m );

  k = 0;
  x = zeros ( m, 1 );

  while ( 1 )

    d = sum ( x(1:m) );
    fprintf ( 1, '  %2d  %2d  |  %2d  %2d  %2d  %2d\n', k, d, x(1:m) );
    if ( x(1) == 3 )
      break
    end
    k = k + 1;
    x = mono_next_grevlex ( m, x );
  end

  return
end
