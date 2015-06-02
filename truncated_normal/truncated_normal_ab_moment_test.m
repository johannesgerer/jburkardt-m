function truncated_normal_ab_moment_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_AB_MOMENT_TEST tests TRUNCATED_NORMAL_AB_MOMENT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2013
%
%  Author:
%
%    John Burkardt
%
  test_num = 9;
  mu_test =    [  0.0, 0.0,  0.0,  0.0,  1.0, 0.0,  0.0,  0.0, 5.0 ];
  sigma_test = [  1.0, 1.0,  1.0,  2.0,  1.0, 1.0,  1.0,  1.0, 0.5 ];
  a_test =     [ -1.0, 0.0, -1.0, -1.0,  0.0, 0.5, -2.0, -4.0, 4.0 ];
  b_test =     [  1.0, 1.0,  0.0,  1.0,  2.0, 2.0,  2.0,  4.0, 7.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_AB_MOMENT_TEST\n' );
  fprintf ( 1, '  TRUNCATED_NORMAL_AB_MOMENT evaluates the moments\n' );
  fprintf ( 1, '  of the Truncated Normal PDF:\n' );

  for test = 1 : test_num
    mu = mu_test(test);
    sigma = sigma_test(test);
    a = a_test(test);
    b = b_test(test);
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test = %d, Mu = %g, Sigma = %g, A = %g, B = %g\n', ...
      test, mu, sigma, a, b );
    fprintf ( 1, ' Order  Moment\n' );
    fprintf ( 1, '\n' );
    for order = 0 : 8
      moment = truncated_normal_ab_moment ( order, mu, sigma, a, b );
      fprintf ( 1, '  %2d  %12g\n', order, moment );
    end
  end

  return
end

