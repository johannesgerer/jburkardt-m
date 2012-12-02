function test_values_test116 ( )

%*****************************************************************************80
%
%% TEST116 demonstrates the use of PHI_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST116:\n' );
  fprintf ( 1, '  PHI_VALUES returns values of\n' );
  fprintf ( 1, '  the PHI function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         PHI(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = phi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8d  %10d\n', n, fn )

  end

  return
end
