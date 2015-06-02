function polylogarithm_values_test ( )

%*****************************************************************************80
%
%% POLYLOGARITHM_VALUES_TEST demonstrates the use of POLYLOGARITHM_VALUES.
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
  fprintf ( 1, 'POLYLOGARITHM_VALUES_TEST:\n' );
  fprintf ( 1, '  POLYLOGARITHM_VALUES stores values of\n' );
  fprintf ( 1, '  the polylogarithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N           Z           FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, z, fx ] = polylogarithm_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16f\n',  n, z, fx );

  end

  return
end


