function test_values_test0093 ( )

%*****************************************************************************80
%
%% TEST0093 demonstrates the use of AIRY_CAI_VALUES.
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
  fprintf ( 1, 'TEST0093:\n' );
  fprintf ( 1, '  AIRY_CAI_VALUES stores values of \n' );
  fprintf ( 1, '  the Airy function Ai(x) with complex argument.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           Ai(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, cai ] = airy_cai_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f  %24.16f\n', ...
      real ( x ), imag ( x ), real ( cai ), imag ( cai ));

  end

  return
end
