function test_values_test0665 ( )

%*****************************************************************************80
%
%% TEST0665 demonstrates the use of ERFC_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST066:\n' );
  fprintf ( 1, '  ERFC_VALUES stores values of\n' );
  fprintf ( 1, '  the complmementary error function ERFC(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          ERFC(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = erfc_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
