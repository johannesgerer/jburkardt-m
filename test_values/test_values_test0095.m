function test_values_test0095 ( )

%*****************************************************************************80
%
%% TEST0095 demonstrates the use of AIRY_CBI_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0095:\n' );
  fprintf ( 1, '  AIRY_CBI_VALUES stores values of \n' );
  fprintf ( 1, '  the Airy function Bi(x) with complex argument.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           Bi(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, cbi ] = airy_cbi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f  %24.16f\n', ...
      real ( x ), imag ( x ), real ( cbi ), imag ( cbi ));

  end

  return
end
