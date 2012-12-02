function test_values_test138 ( )

%*****************************************************************************80
%
%% TEST138 demonstrates the use of STRUVE_L0_VALUES.
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
  fprintf ( 1, 'TEST138:\n' );
  fprintf ( 1, '  STRUVE_L0_VALUES stores values of\n' );
  fprintf ( 1, '  the Struve L0 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            L0(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = struve_l0_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16e\n', x, fx );

  end

  return
end
