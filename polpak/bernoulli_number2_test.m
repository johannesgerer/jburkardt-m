function bernoulli_number2_test ( )

%*****************************************************************************80
%
%% BERNOULLI_NUMBER2_TEST tests BERNOULLI_NUMBER2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNOULLI_NUMBER2_TEST\n' );
  fprintf ( 1, '  BERNOULLI_NUMBER2 computes Bernoulli numbers;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I     Exact           BERNOULLI_NUMBER2\n' );
  fprintf ( 1, '\n' );
  
  n_data = 0;

  while ( 1 )

    [ n_data, n, c0 ] = bernoulli_number_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c1 = bernoulli_number2 ( n );
 
    fprintf ( 1, '  %2d  %14e  %14e\n', n, c0, c1(n+1) );

  end
 
  return
end
