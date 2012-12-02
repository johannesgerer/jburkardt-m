function cordic_test001 ( )

%*****************************************************************************80
%
%% TEST001 demonstrates the use of COSSIN_CORDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001:\n' );
  fprintf ( 1, '  COSSIN_CORDIC computes the cosine and sine of an angle\n' );
  fprintf ( 1, '  using the CORDIC algorithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A    N           Cos(A)     Cos(A)      Difference\n' );
  fprintf ( 1, '                     Tabulated   CORDIC\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, c1 ] = cos_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '\n' );
    
    for n = 0 : 5 : 25
        
      v = cossin_cordic ( a, n );
      c2 = v(1);
      d = c1 - c2;

      fprintf ( 1, '  %12f  %4d  %16.8f  %16.8f  %9e\n', a, n, c1, c2, d );
      
    end

  end

  return
end
