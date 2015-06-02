function moebius_test ( )

%*****************************************************************************80
%
%% MOEBIUS_TEST tests MOEBIUS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MOEBIUS_TEST\n' );
  fprintf ( 1, '  MOEBIUS computes the Moebius function.\n' );
  fprintf ( 1, '\n'  );
  fprintf ( 1, '    N   Exact   MOEBIUS(N)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = moebius_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = moebius ( n );

    fprintf ( 1, '  %4d  %8d  %8d\n', n, c, c2 );

  end
 
  return
end
