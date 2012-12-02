function cordic_test006 ( )

%*****************************************************************************80
%
%% TEST006 demonstrates the use of TAN_CORDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST006:\n' );
  fprintf ( 1, '  TAN_CORDIC computes the tangent of an angle THETA\n' );
  fprintf ( 1, '  using the CORDIC algorithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  THETA    N         Tan(THETA)  Tan(THETA)      Difference\n' );
  fprintf ( 1, ...
    '                     Tabulated   CORDIC\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, theta, t1 ] = tan_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '\n' );
    
    for n = 0 : 5 : 25
        
      t2 = tan_cordic ( theta, n );
      d = t1 - t2;

      fprintf ( 1, '  %12f  %4d  %16.8f  %16.8f  %9e\n', theta, n, t1, t2, d );
      
    end

  end

  return
end
