function polpak_test012 ( )

%*****************************************************************************80
%
%% TEST012 tests BETA, BETA_VALUES.
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
  fprintf ( 1, 'TEST012:\n' );
  fprintf ( 1, '  BETA evaluates the Beta function.\n' );
  fprintf ( 1, '  BETA_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X        Y          Exact F         BETA(X,Y)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, fxy ] = beta_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fxy2 = beta ( x, y );

    fprintf ( 1, '  %6f  %6f  %14e  %14e\n', x, y, fxy, fxy2 );

  end

  return
end
