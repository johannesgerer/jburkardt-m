function normal_ms_moment_test ( )

%*****************************************************************************80
%
%% NORMAL_MS_MOMENT_TEST tests NORMAL_MS_MOMENT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2013
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;
  mu_test = [ 0.0, 2.0, 10.0, 0.0 ];
  sigma_test = [ 1.0, 1.0, 2.0, 2.0 ];
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_MS_MOMENT_TEST\n' );
  fprintf ( 1, '  NORMAL_MS_MOMENT evaluates the moments\n' );
  fprintf ( 1, '  of the Normal MS distribution.\n' );

  for test = 1 : test_num
    mu = mu_test(test);
    sigma = sigma_test(test);
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Mu = %g, Sigma = %g\n', mu, sigma );
    fprintf ( 1, ' Order  Moment\n' );
    fprintf ( 1, '\n' );
    for order = 0 : 8
      moment1 = normal_ms_moment ( order, mu, sigma );
      moment2 = normal_ms_moment_values ( order, mu, sigma );
      fprintf ( 1, '  %2d  %12g  %12g\n', order, moment1, moment2 );
    end
  end

  return
end

