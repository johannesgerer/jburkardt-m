function beta_values_test ( )

%*****************************************************************************80
%
%% BETA_VALUES_TEST demonstrates the use of BETA_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BETA_VALUES_TEST:\n' );
  fprintf ( 1, '  BETA_VALUES stores values of\n' );
  fprintf ( 1, '  the Beta function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X              Y         BETA(X,Y)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, fxy ] = beta_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', x, y, fxy );

  end

  return
end
