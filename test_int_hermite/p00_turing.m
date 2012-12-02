function [ n, result ] = p00_turing ( problem, h, tol )

%*****************************************************************************80
%
%% P00_TURING applies the Turing quadrature rule.
%
%  Discussion:
%
%    We consider the approximation:
%
%      Integral ( -oo < x < +oo ) f(x) dx
%
%      = h * Sum ( -oo < i < +oo ) f(nh) + error term
%
%    Given H and a tolerance TOL, we start summing at I = 0, and
%    adding one more term in the positive and negative I directions,
%    until the absolute value of the next two terms being added
%    is less than TOL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Turing,
%    A Method for the Calculation of the Zeta Function,
%    Proceedings of the London Mathematical Society,
%    Volume 48, 1943, pages 180-197.
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Input, real H, the spacing to use.
%
%    Input, real TOL, the tolerance.
%
%    Output, integer N, the number of pairs of steps taken.
%    The actual number of function evaluations is 2*N+1.
%
%    Output, real RESULT, the approximate integral.
%
  n_too_many = 100000;

  option = 0;
  n = 0;

  result = 0.0;
  order = 1;
  xtab(1) = 0.0;
  f_vec = p00_fun ( problem, option, order, xtab );
  result = result + h * f_vec(1);

  while ( 1 )

    n = n + 1;

    xtab(1) =   n * h;
    xtab(2) = - n * h;

    order = 2;
    f_vec = p00_fun ( problem, option, order, xtab );

    result = result + h * ( f_vec(1) + f_vec(2) );
%
%  Just do a simple-minded absolute error tolerance check to start with.
%
    if ( abs ( f_vec(1) ) + abs ( f_vec(2) ) <= tol )
      break
    end
%
%  Just in case things go crazy.
%
    if ( n_too_many <= n )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P00_TURING - Warning!\n' );
      fprintf ( 1,'  Number of steps exceeded N_TOO_MANY = %d\n', n_too_many );
      break
    end

  end

  return
end
