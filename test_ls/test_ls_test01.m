function test01 ( )

%*****************************************************************************80
%
%% TEST01 summarizes the test data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Get each least squares test and compute the maximum residual.\n' );
  fprintf ( 1, '  The L2 norm of the residual MUST be no greater than\n' );
  fprintf ( 1, '  the L2 norm of the right hand side, else 0 is a better solution.\n' );

  prob_num = p00_prob_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of problems = %d\n', prob_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index     M     N         ||B||         ||X||         ||R||\n' );
  fprintf ( 1, '\n' );

  for prob = 1 : prob_num

    m = p00_m ( prob );
    n = p00_n ( prob );

    a = p00_a ( prob, m, n );
    b = p00_b ( prob, m );
    x = p00_x ( prob, n );

    r = a * x - b;

    b_norm = norm ( b );
    x_norm = norm ( x );
    r_norm = norm ( r );

    fprintf ( 1, '  %5d  %4d  %4d  %12.4g  %12.4g  %12.4g\n', ...
      prob, m, n, b_norm, x_norm, r_norm );

  end

  return
end
