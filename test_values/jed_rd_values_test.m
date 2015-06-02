function jed_rd_values ( )

%*****************************************************************************80
%
%% JED_RD_VALUES demonstrates the use of JED_RD_VALUES.
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
  fprintf ( 1, 'JED_RD_VALUES:\n' );
  fprintf ( 1, '  JED_RD_VALUES returns:\n' );
  fprintf ( 1, '  JED, a Julian Ephemeris Date, and\n' );
  fprintf ( 1, '  RD, the corresponding Reingold Dershowitz Day count.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      JED            RD\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, jed, rd ] = jed_rd_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f\n', jed, rd );

  end

  return
end
