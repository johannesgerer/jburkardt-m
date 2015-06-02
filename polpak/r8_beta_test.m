function r8_beta_test ( )

%*****************************************************************************80
%
%% R8_BETA_TEST tests R8_BETA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_BETA_TEST:\n' );
  fprintf ( 1, '  R8_BETA evaluates the Beta function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X        Y          Exact F         R8_BETA(X,Y)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, fxy ] = beta_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fxy2 = r8_beta ( x, y );

    fprintf ( 1, '  %6f  %6f  %14e  %14e\n', x, y, fxy, fxy2 );

  end

  return
end
