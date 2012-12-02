function test_values_test058 ( )

%*****************************************************************************80
%
%% TEST058 demonstrates the use of DIELECTRIC_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST058:\n' );
  fprintf ( 1, '  DIELECTRIC_VALUES stores values of\n' );
  fprintf ( 1, '  the dielectric function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T           P            EPS(T,P)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, tc, p, eps ] = dielectric_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', tc, p, eps );

  end

  return
end
