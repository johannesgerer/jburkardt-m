function test_values_test1035 ( )

%*****************************************************************************80
%
%% TEST1035 demonstrates the use of LERCH_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1035:\n' );
  fprintf ( 1, '  LERCH_VALUES stores values of\n' );
  fprintf ( 1, '  the Lerch function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           Z        S             A            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, z, s, a, fx ] = lerch_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %4d  %12f  %24.16f\n', z, s, a, fx );

  end

  return
end
