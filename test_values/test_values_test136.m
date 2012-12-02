function test_values_test136 ( )

%*****************************************************************************80
%
%% TEST136 demonstrates the use of STRUVE_H0_VALUES.
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
  fprintf ( 1, 'TEST136:\n' );
  fprintf ( 1, '  STRUVE_H0_VALUES stores values of\n' );
  fprintf ( 1, '  the Struve H0 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            H0(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = struve_h0_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
