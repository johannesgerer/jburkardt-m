function bsv_test07 ( )

%*****************************************************************************80
%
%% BSV_TEST07 estimates the variance of the zero crossing.
%
%  Discussion:
%
%    We assume that the left boundary condition ALPHA can vary like
%    a Gaussian variable with mean 1 and standard deviation 0.05.
%
%    Estimate the integral:
%
%      Var(X0(ALPHA)) = integral ( -oo < alpha < +oo ) x0^2(alpha) e^(-0.5*alpha^2/sigma^2) dalpha
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BSV_TEST06:\n' );
  fprintf ( 1, '  For the Burgers equation on [A,B] with viscosity NU and \n' );
  fprintf ( 1, '  boundary conditions U(A)=ALPHA, U(B) = BETA,\n' );
  fprintf ( 1, '  with ALPHA and BETA of opposite sign,\n' );
  fprintf ( 1, '  let X0 be the point where the solution U changes sign.\n' );
  fprintf ( 1, '  Assume ALPHA is Gaussian with mean 0 and standard deviation 0.05.\n' );
  fprintf ( 1, '  Estimate Var(X0(ALPHA)) using M Gaussian samples.\n' );

  a = -1.0;
  b = +1.0;
  beta = -1.0;
  nu = 0.1;
  n = 81;
  x = linspace ( a, b, n );
%
%  Monte Carlo Estimate.
%  Choose M normal random samples with the correct STD, 
%  find X0 for each, and average.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '     M    Var(X0(ALPHA)) estimate\n' );
  fprintf ( 1, '\n' );

  for j = 4 : 12

    m = 2^j;
    mu = 1.0;
    sigma = 0.05;
    alpha_vec = mu + 0.05 * randn ( m, 1 );

    x0_bar = 0.0;

    for i = 1 : m
      alpha = alpha_vec(i);
      output = 0;
      u = bsv ( a, b, alpha, beta, nu, n, output );
      x0 = bsv_crossing ( a, b, n, x, u );
      x0_bar = x0_bar + x0^2;
    end

    x0_bar = x0_bar / m;

    fprintf ( 1, '  %4d  %14.6g\n', m, x0_bar );

  end 

  return
end
