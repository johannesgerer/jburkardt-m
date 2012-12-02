function hdif = p00_hdif ( problem, n, x )

%*****************************************************************************80
%
%% P00_HDIF approximates the Hessian via finite differences.
%
%  Discussion:
%
%    The values returned by this routine will be only approximate.
%    In some cases, they will be so poor that they are useless.
%    This is particularly true for expressions in which a term like
%    X**6 is dominant.  For such terms, a small deviation in the argument
%    may hardly show up.  Using a LARGER value of EPS may sometimes help
%    in these cases.
%
%    However, one of the best applications of this routine is for
%    checking your own Hessian calculations, since as Heraclitus
%    said, you will never get the same result twice when you differentiate
%    a complicated expression by hand.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real HDIF(N,N), the approximated N by N
%    Hessian matrix.
%

%
%  Choose the stepsizes.
%
  tol = eps^0.33;

  for i = 1 : n
    s(i) = tol * max ( abs ( x(i) ), 1.0 );
  end
%
%  Calculate the diagonal elements.
%
  for i = 1 : n

    xi = x(i);

    f00 = p00_f ( problem, n, x );

    x(i) = xi + s(i);
    fpp = p00_f ( problem, n, x );

    x(i) = xi - s(i);
    fmm = p00_f ( problem, n, x );

    hdif(i,i) = ( ( fpp - f00 ) + ( fmm - f00 ) ) / s(i) / s(i);

    x(i) = xi;

  end
%
%  Calculate the off-diagonal elements.
%
  for i = 1 : n

    xi = x(i);

    for j = i + 1 : n

      xj = x(j);

      x(i) = xi + s(i);
      x(j) = xj + s(j);
      fpp = p00_f ( problem, n, x );

      x(i) = xi + s(i);
      x(j) = xj - s(j);
      fpm = p00_f ( problem, n, x );

      x(i) = xi - s(i);
      x(j) = xj + s(j);
      fmp = p00_f ( problem, n, x );

      x(i) = xi - s(i);
      x(j) = xj - s(j);
      fmm = p00_f ( problem, n, x );

      hdif(j,i) = ( ( fpp - fpm ) + ( fmm - fmp ) ) / ( 4.0 * s(i) * s(j) );

      hdif(i,j) = hdif(j,i);

      x(j) = xj;

    end

    x(i) = xi;

  end

  return
end
