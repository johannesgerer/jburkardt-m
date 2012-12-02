function cordic_test003 ( )

%*****************************************************************************80
%
%% TEST003 demonstrates the use of ARCTAN_CORDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2007
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST003:\n' );
  fprintf ( 1, '  ARCTAN_CORDIC computes the arctangent of Y/X\n' );
  fprintf ( 1, '  using the CORDIC algorithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      X      Y    N       ArcTan(Y/X) ArcTan(Y/X)      Difference\n' );
  fprintf ( 1, ...
    '                           Tabulated   CORDIC\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, z, a1 ] = arctan_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ r, seed ] = r8_uniform_01 ( seed );

    x = r;
    y = r * z;

    [ s, seed ] = r8_uniform_01 ( seed );

    if ( s < 0.5 )
      x = -x;
      y = -y;
    end

    fprintf ( 1, '\n' );
    
    for n = 0 : 5 : 25
        
      a2 = arctan_cordic ( x, y, n );
      d = a1 - a2;

      fprintf ( 1, '  %12f  %12f  %4d  %16.8f  %16.8f  %9e\n', x, y, n, a1, a2, d );
      
    end

  end

  return
end
