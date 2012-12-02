function randlc_test02 ( )

%*****************************************************************************80
%
%% RANDLC_TEST02 tests RANDLC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANDLC_TEST02\n' );
  fprintf ( 1, '  RANDLC computes uniformly distributed\n' );
  fprintf ( 1, '  pseudorandom numbers.\n' );

  seed = 123456789;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial SEED = %d\n', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 10 values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       I           Input          Output          RANDLC\n' );
  fprintf ( 1, '                    SEED            SEED\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    seed_in = seed;
    [ u(i), seed ] = randlc ( seed );
    seed_out = seed;

    fprintf ( 1, '  %6d  %14.0f  %14.0f  %14f\n', i, floor ( seed_in ), seed_out, u(i) );

  end

  seed = 123456789;
  n = 1000;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now call %d times.\n', n );
  fprintf ( 1, '\n' );

  for i = 1: n
    [ u(i), seed ] = randlc ( seed );
  end
  u_avg = sum ( u(1:n) ) / n;

  u_var = 0.0;
  for i = 1 : n
    u_var = u_var + ( u(i) - u_avg )^2;
  end
  u_var = u_var / ( n - 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average value = %f\n', u_avg );
  fprintf ( 1, '  Expecting       %f\n', 0.5 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variance =      %f\n', u_var );
  fprintf ( 1, '  Expecting       %f\n', 1.0 / 12.0 );

  return
end
