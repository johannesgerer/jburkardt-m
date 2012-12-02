function prob_test0254 ( )

%*****************************************************************************80
%
%% TEST0254 tests BUFFON_SIMULATE.
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
  l = 1.0;
  seed = 123456789;
  rand ( 'state', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0254\n' );
  fprintf ( 1, '  BUFFON_SIMULATE simulates a Buffon-Laplace\n' );
  fprintf ( 1, '  needle dropping experiment.  On a grid of cells of \n' );
  fprintf ( 1, '  width A, a needle of length L is dropped\n' );
  fprintf ( 1, '  at random.  We count the number of times it crosses\n' );
  fprintf ( 1, '  at least one grid line, and use this to estimate \n' );
  fprintf ( 1, '  the value of PI.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cell width A =    %f\n', a );
  fprintf ( 1, '  Needle length L = %f\n', l );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Trials      Hits          Est(Pi)     Err\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    trial_num = trial_num_test(test);

    hits = buffon_simulate ( a, l, trial_num );

    if ( 0 < hits )
      pi_est = ( 2.0 * l * trial_num ) / ( a * hits );
    else
      pi_est = Inf;
    end

    err = abs ( pi_est - pi );

    fprintf ( 1, '  %8d  %8d  %14f  %14f\n', trial_num, hits, pi_est, err );

  end

  return
end
