function cinh_values_test ( )

%*****************************************************************************80
%
%% CINH_VALUES_TEST demonstrates the use of CINH_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CINH_VALUES_TEST:\n' );
  fprintf ( 1, '  CINH_VALUES stores values of\n' );
  fprintf ( 1, '  the Hyperbolic Cosine Integral function CINH(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            CINH(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = cinh_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
