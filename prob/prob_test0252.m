function prob_test0252 ( )

%*****************************************************************************80
%
%% TEST0252 tests BUFFON_LAPLACE_SIMULATE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  trial_num_test = [ 10, 100, 10000, 1000000 ];

  a = 1.0;
  b = 1.0;
  l = 1.0;
  seed = 123456789;
  rand ( 'state', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0252\n' );
  fprintf ( 1, '  BUFFON_LAPLACE_SIMULATE simulates a Buffon-Laplace needle dropping\n' );
  fprintf ( 1, '  experiment.  On a grid of cells of width A and height B\n' );
  fprintf ( 1, '  a needle of length L is dropped at random.  We count\n' );
  fprintf ( 1, '  the number of times it crosses at least one grid line,\n' );
  fprintf ( 1, '  and use this to estimate the value of PI.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cell width A =    %f\n', a );
  fprintf ( 1, '  Cell height B =   %f\n', b );
  fprintf ( 1, '  Needle length L = %f\n', l );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Trials      Hits          Est(Pi)         Err\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    trial_num = trial_num_test(test);

    hits = buffon_laplace_simulate ( a, b, l, trial_num );

    if ( 0 < hits )
      pi_est = ( 2.0 * l * ( a + b ) - l * l ) * trial_num ...
        / ( a * b * hits );
    else
      pi_est = Inf;
    end

    err = abs ( pi_est - pi );

    fprintf ( 1, '  %8d  %8d  %14f  %14f\n', ...
      trial_num, hits, pi_est, err );

  end

  return
end
