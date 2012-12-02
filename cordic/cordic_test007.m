function cordic_test007 ( )

%*****************************************************************************80
%
%% TEST007 demonstrates the use of EXP_CORDIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST007:\n' );
  fprintf ( 1, '  EXP_CORDIC computes the exponential function\n' );
  fprintf ( 1, '  using the CORDIC algorithm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      X    N         Exp(X)      Exp(X)          Difference\n' );
  fprintf ( 1, ...
    '                     Tabulated   CORDIC\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, theta, t1 ] = exp_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '\n' );
    
    for n = 0 : 5 : 25
        
      t2 = exp_cordic ( theta, n );
      d = t1 - t2;

      fprintf ( 1, '  %12f  %4d  %16.8e  %16.8e  %9e\n', theta, n, t1, t2, d );
      
    end

  end

  return
end
