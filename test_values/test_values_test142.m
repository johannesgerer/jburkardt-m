function test_values_test142 ( )

%*****************************************************************************80
%
%% TEST142 demonstrates the use of SURTEN_VALUES.
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
  fprintf ( 1, 'TEST142:\n' );
  fprintf ( 1, '  SURTEN_VALUES stores values of \n' );
  fprintf ( 1, '  the surface tension of water \n' );
  fprintf ( 1, '  as a function of temperature.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T            SIGMA(T)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, tc, sigma ] = surten_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', tc, sigma );

  end

  return
end
