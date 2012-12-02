function cordic_test009 ( )

%*****************************************************************************80
%
%% TEST009 demonstrates the use of SQRT_CORDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST009:\n' );
  fprintf ( 1, '  SQRT_CORDIC computes the square root \n' );
  fprintf ( 1, '  using the CORDIC algorithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      X    N        Sqrt(X)     Sqrt(X)          Difference\n' );
  fprintf ( 1, ...
    '                     Tabulated   CORDIC\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, theta, t1 ] = sqrt_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '\n' );
    
    for n = 0 : 5 : 25
        
      t2 = sqrt_cordic ( theta, n );
      d = t1 - t2;

      fprintf ( 1, '  %12f  %4d  %16.8f  %16.8f  %9e\n', theta, n, t1, t2, d );
      
    end

  end

  return
end
