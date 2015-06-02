function airy_bi_int_values_test ( )

%*****************************************************************************80
%
%% AIRY_BI_INT_VALUES_TEST demonstrates the use of AIRY_BI_INT_VALUES.
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
  fprintf ( 1, 'AIRY_BI_INT_VALUES_TEST:\n' );
  fprintf ( 1, '  AIRY_BI_INT_VALUES stores values of \n' );
  fprintf ( 1, '  the integral of the Airy Bi function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = airy_bi_int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
