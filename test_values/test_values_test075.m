function test_values_test075 ( )

%*****************************************************************************80
%
%% TEST075 demonstrates the use of FRESNEL_SIN_VALUES.
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
  fprintf ( 1, 'TEST075:\n' );
  fprintf ( 1, '  FRESNEL_SIN_VALUES stores values of\n' );
  fprintf ( 1, '  the Fresnel sine integral S(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           S(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = fresnel_sin_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
