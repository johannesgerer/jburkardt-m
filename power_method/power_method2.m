function [ lambda, v, it_num ] = power_method2 ( n, a, x_init, it_max, tol )

%*****************************************************************************80
%
%% POWER_METHOD2 applies the power method for possibly complex eigenvalues.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric VanDeVelde,
%    Concurrent Scientific Programming,
%    Springer, 1994,
%    ISBN: 0-387-94195-9,
%    LC: QA76.58.V35.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real X(N), the initial estimate for the eigenvector.
%
%    Input, integer IT_MAX, the maximum number of iterations to take.
%    1 <= IT_MAX.
%
%    Input, real TOL, an error tolerance.
%
%    Output, complex LAMBDA, the estimate for the eigenvalue.
%
%    Output, complex V(N), the estimate for the eigenvector.
%
%    Output, integer IT_NUM, the number of iterations taken.
%
  it_num = 0;
%
%  Compute data necessary to start the iteration.
%
  x(1:n,1) = x_init(1:n);
  pi_xx = x(1:n)' * x(1:n);
  x(1:n) = x(1:n) / pi_xx;
  y(1:n,1) = a(1:n,1:n) * x(1:n);
  pi_xy = x(1:n)' * y(1:n);
  pi_yy = y(1:n)' * y(1:n);

  for it = 1 : it_max

    if ( pi_yy - pi_xy * pi_xy < tol * tol * pi_yy )
      lambda = pi_xy;
      v(1:n) = y(1:n) / sqrt ( pi_yy );
      return
    end

    z(1:n,1) = a(1:n,1:n) * y(1:n);

    pi_xz = x(1:n)' * z(1:n);
    pi_yz = y(1:n)' * z(1:n);
    pi_zz = z(1:n)' * z(1:n);

    alpha = - ( pi_yz - pi_xy * pi_xz ) / ( pi_yy - pi_xy * pi_xy );
    beta = ( pi_xy * pi_yz - pi_yy * pi_xz ) / ( pi_yy - pi_xy * pi_xy );
    gamma = pi_zz + alpha * alpha * pi_yy + beta * beta ...
      + 2.0 * ( alpha * pi_yz + beta * pi_xz + alpha * beta * pi_xy );

    if ( gamma < tol * tol * pi_zz & alpha * alpha < 4.0 * beta )

      lambda_real = - alpha / 2.0;
      lambda_imag = sqrt ( 4.0D+00 * beta - alpha * alpha ) / 2.0;
      lambda = lambda_real + lambda_imag * sqrt ( - 1.0 );

      v(1:n) = ( lambda * y(1:n) - z(1:n) ) ...
       / sqrt ( beta * pi_yy + alpha * pi_yz + pi_zz );

      return
    end

    x(1:n) = y(1:n) / sqrt ( pi_yy );
    y(1:n) = z(1:n) / sqrt ( pi_yy );

    pi_xy = pi_yz / pi_yy;
    pi_yy = pi_zz / pi_yy;

    it_num = it;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_METHOD2 - Fatal error!\n' );
  fprintf ( 1, '  Convergence was not reached.\n' );

  error ( 'POWER_METHOD2 - Fatal error!' );
end
