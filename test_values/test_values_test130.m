function test_values_test130 ( )

%*****************************************************************************80
%
%% TEST130 demonstrates the use of SQRT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST130:\n' );
  fprintf ( 1, '  SQRT_VALUES returns some values of the SQRT function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X      SQRT(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = sqrt_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6f  %24.16f\n', x, fx );

  end

  return
end
