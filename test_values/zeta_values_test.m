function zeta_values_test ( )

%*****************************************************************************80
%
%% ZETA_VALUES_TEST demonstrates the use of ZETA_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZETA_VALUES_TEST:\n' );
  fprintf ( 1, '  ZETA_VALUES returns values of \n' );
  fprintf ( 1, '  the Riemann Zeta function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        Zeta(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, zeta ] = zeta_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '%6d      %24.16f\n', n, zeta );

  end

  return
end
