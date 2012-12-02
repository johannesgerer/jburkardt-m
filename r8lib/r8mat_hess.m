function h = r8mat_hess ( fx, n, x )

%*****************************************************************************80
%
%% R8MAT_HESS approximates a Hessian matrix via finite differences.
%
%  Discussion:
%
%    H(I,J) = d2 F / d X(I) d X(J)
%
%    The values returned by this routine will be only approximate.
%    In some cases, they will be so poor that they are useless.
%    However, one of the best applications of this routine is for
%    checking your own Hessian calculations, since as Heraclitus
%    said, you'll never get the same result twice when you differentiate
%    a complicated expression by hand.
%
%    The user function routine, here called "FX", should have the form:
%
%      function f = fx ( n, x )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, function FX ( n, x ), the name of the user function routine.
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the approximated N by N Hessian matrix.
%

%
%  Choose the stepsizes.
%
  tol = eps ^ 0.33;

  for i = 1 : n
    s(i) = tol * max ( abs ( x(i) ), 1.0 );
  end
%
%  Calculate the diagonal elements.
%
  for i = 1 : n

    xi = x(i);

    f00 = feval ( fx, n, x );

    x(i) = xi + s(i);
    fpp = feval ( fx, n, x );

    x(i) = xi - s(i);
    fmm = feval ( fx, n, x );

    h(i,i) = ( ( fpp - f00 ) + ( fmm - f00 ) ) / s(i)^2;

    x(i) = xi;

  end
%
%  Calculate the off diagonal elements.
%
  for i = 1 : n

    xi = x(i);

    for j = i+1 : n

      xj = x(j);

      x(i) = xi + s(i);
      x(j) = xj + s(j);
      fpp = feval ( fx, n, x );

      x(i) = xi + s(i);
      x(j) = xj - s(j);
      fpm = feval ( fx, n, x );

      x(i) = xi - s(i);
      x(j) = xj + s(j);
      fmp = feval ( fx, n, x );

      x(i) = xi - s(i);
      x(j) = xj - s(j);
      fmm = feval ( fx, n, x );

      h(j,i) = ( ( fpp - fpm ) + ( fmm - fmp ) ) / ( 4.0 * s(i) * s(j) );

      h(i,j) = h(j,i);

      x(j) = xj;

    end

    x(i) = xi;

  end

  return
end
