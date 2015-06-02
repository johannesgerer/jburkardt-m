function e1_values_test ( )

%*****************************************************************************80
%
%% E1_VALUES_TEST demonstrates the use of E1_VALUES.
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
  fprintf ( 1, 'E1_VALUES_TEST:\n' );
  fprintf ( 1, '  E1_VALUES stores values of\n' );
  fprintf ( 1, '  the exponential integral function E1(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          E1(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = e1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
