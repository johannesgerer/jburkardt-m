function f = p15_f ( n, x )

%*****************************************************************************80
%
%% P15_F evaluates the objective function for problem 15.
%
%  Discussion:
%
%    The Hessian matrix is doubly singular at the minimizer,
%    suggesting that most optimization routines will experience
%    a severe slowdown in convergence.
%
%    The problem is usually only defined for N being a multiple of 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2000
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f = 0.0;

  for j = 1 : 4 : n

    if ( j + 1 <= n )
      xjp1 = x(j+1);
    else
      xjp1 = 0.0;
    end

    if ( j + 2 <= n )
      xjp2 = x(j+2);
    else
      xjp2 = 0.0;
    end

    if ( j + 3 <= n )
      xjp3 = x(j+3);
    else
      xjp3 = 0.0;
    end

    f1 = x(j) + 10.0 * xjp1;

    if ( j + 1 <= n )
      f2 = xjp2 - xjp3;
    else
      f2 = 0.0;
    end

    if ( j + 2 <= n )
      f3 = xjp1 - 2.0 * xjp2;
    else
      f3 = 0.0;
    end

    if ( j + 3 <= n )
      f4 = x(j) - xjp3;
    else
      f4 = 0.0;
    end

    f = f +        f1 * f1 ...
          +  5.0 * f2 * f2 ...
          +        f3 * f3 * f3 * f3 ...
          + 10.0 * f4 * f4 * f4 * f4;

  end

  return
end
