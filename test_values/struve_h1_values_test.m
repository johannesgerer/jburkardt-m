function struve_h1_values_test ( )

%*****************************************************************************80
%
%% STRUVE_H1_VALUES_TEST demonstrates the use of STRUVE_H1_VALUES.
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
  fprintf ( 1, 'STRUVE_H1_VALUES_TEST:\n' );
  fprintf ( 1, '  STRUVE_H1_VALUES stores values of\n' );
  fprintf ( 1, '  the Struve H1 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            H1(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = struve_h1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
