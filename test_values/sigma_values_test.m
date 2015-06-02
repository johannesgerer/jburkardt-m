function sigma_values_test ( )

%*****************************************************************************80
%
%% SIGMA_VALUES_TEST demonstrates the use of SIGMA_VALUES.
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
  fprintf ( 1, 'SIGMA_VALUES_TEST:\n' );
  fprintf ( 1, '  SIGMA_VALUES returns values of \n' );
  fprintf ( 1, '  the SIGMA function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         SIGMA(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = sigma_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n', n, fn );

  end

  return
end
