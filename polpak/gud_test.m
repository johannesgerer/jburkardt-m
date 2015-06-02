function gud_test ( )

%*****************************************************************************80
%
%% GUD_TEST tests GUD.
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
  fprintf ( 1, 'GUD_TEST:\n' );
  fprintf ( 1, '  GUD evaluates the Gudermannian function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X      Exact F       GUD(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gud_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = gud ( x );

    fprintf ( 1, '  %6f  %12f  %12f\n', x, fx, fx2 );

  end

  return
end
