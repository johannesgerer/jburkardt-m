function rand_test ( )

%*****************************************************************************80
%
%% RAND_TEST tests R4_RAND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2012
%
%  Author:
%
%    John Burkardt
%
  i_value = [ 1, 2, 3, 4, 10, 100, 1000 ];
  r_value = [ ...
    0.0004127026, ...
    0.6750836372, ...
    0.1614754200, ...
    0.9086198807, ...
    0.5527787209, ...
    0.3600893021, ...
    0.2176990509 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RAND_TEST:\n' );
  fprintf ( 1, '  Test R4_RAND.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             I         R4_RAND        Expected\n' );
  fprintf ( 1, '\n' );

  k = 1;

  for i = 1 : 1000

    r = r4_rand ( 0.0 );

    if ( i == i_value(k) )
      fprintf ( 1, '  %14d  %14g  %14g\n', i, r, r_value(k) );
      k = k + 1;
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now compute and average 1000000 values.\n' );
  average = 0.0;
  for i = 1 : 1000000
    r = r4_rand ( 0.0 );
    average = average + r;
  end
  average = average / 1000000.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '       Average =  %14g  %14g\n', average, 0.5 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determine variance of 1000000 values.\n' );
  variance = 0.0;
  for i = 1 : 1000000
    r = r4_rand ( 0.0 );
    variance = variance + ( r - average )^2;
  end
  variance = variance / 1000000.0;
  fprintf ( 1, '       Variance = %14g  %14g\n', variance, 1.0 / 12.0 );

  return
end
