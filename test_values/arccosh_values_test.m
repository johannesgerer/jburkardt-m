function arccosh_values_test ( )

%*****************************************************************************80
%
%% ARCCOSH_VALUES_TEST demonstrates the use of ARCCOSH_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARCCOSH_VALUES_TEST:\n' );
  fprintf ( 1, '  ARCCOSH_VALUES stores values of \n' );
  fprintf ( 1, '  the hyperbolic arc cosine function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = arccosh_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16g\n', x, fx );

  end

  return
end
