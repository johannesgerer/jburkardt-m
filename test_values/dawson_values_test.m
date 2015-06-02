function dawson_values_test ( )

%*****************************************************************************80
%
%% DAWSON_VALUES_TEST demonstrates the use of DAWSON_VALUES.
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
  fprintf ( 1, 'DAWSON_VALUES_TEST:\n' );
  fprintf ( 1, '  DAWSON_VALUES stores values of\n' );
  fprintf ( 1, '  Dawson''s Integral function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          DAWSON(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = dawson_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
