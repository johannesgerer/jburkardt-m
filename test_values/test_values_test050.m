function test_values_test050 ( )

%*****************************************************************************80
%
%% TEST050 demonstrates the use of CIN_VALUES.
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
  fprintf ( 1, 'TEST050:\n' );
  fprintf ( 1, '  CIN_VALUES stores values of\n' );
  fprintf ( 1, '  the Cosine Integral function CIN(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            CIN(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = cin_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
