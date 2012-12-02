function cordic_test004 ( )

%*****************************************************************************80
%
%% TEST004 demonstrates the use of ARCCOS_CORDIC.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST004:\n' );
  fprintf ( 1, '  ARCCOS_CORDIC computes the arccosine of T\n' );
  fprintf ( 1, '  using the CORDIC algorithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      T    N         ArcCos(T)   ArcCos(T)      Difference\n' );
  fprintf ( 1, ...
    '                     Tabulated   CORDIC\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, t, a1 ] = arccos_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '\n' );
    
    for n = 0 : 5 : 25
        
      a2 = arccos_cordic ( t, n );
      d = a1 - a2;

      fprintf ( 1, '  %12f  %4d  %16.8f  %16.8f  %9e\n', t, n, a1, a2, d );
      
    end

  end

  return
end
