function cordic_test010 ( )

%*****************************************************************************80
%
%% TEST010 demonstrates the use of CBRT_CORDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST010:\n' );
  fprintf ( 1, '  CBRT_CORDIC computes the cube root \n' );
  fprintf ( 1, '  using the CORDIC algorithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      X    N        Cbrt(X)     Cbrt(X)          Difference\n' );
  fprintf ( 1, ...
    '                     Tabulated   CORDIC\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, theta, t1 ] = cbrt_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '\n' );
    
    for n = 0 : 5 : 25
        
      t2 = cbrt_cordic ( theta, n );
      d = t1 - t2;

      fprintf ( 1, '  %12f  %4d  %16.8f  %16.8f  %9e\n', theta, n, t1, t2, d );
      
    end

  end

  return
end

