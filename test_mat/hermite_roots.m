function xtab = hermite_roots ( order )

%*****************************************************************************80
%
%% HERMITE_ROOTS computes the roots of a Hermite polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the polynomial.
%
%    Output, real XTAB(ORDER), the roots.
%
  xtab = zeros ( order, 1 );

  step_max = 10;

  s = ( 2.0 *  order + 1.0 )^( 1.0 / 6.0 );

  for i = 1 : ( order + 1 ) / 2

    if ( i == 1 )

      x = s * s * s - 1.85575 / s;

    elseif ( i == 2 )

      x = x - 1.14 * order^0.426 / x;

    elseif ( i == 3 )

      x = 1.86 * x - 0.86 * xtab(order);

    elseif ( i == 4 )

      x = 1.91 * x - 0.91 * xtab(order-1);

    else

      x = 2.0 * x - xtab(order+3-i);

    end

    for step = 1 : step_max

      p1 = 1.0;
      dp1 = 0.0;

      p2 = x;
      dp2 = 1.0;

      for j = 2 : order

        p0 = p1;
        dp0 = dp1;

        p1 = p2;
        dp1 = dp2;

        p2  = x * p1 - 0.5 * ( j - 1.0 ) * p0;
        dp2 = x * dp1 + p1 - 0.5 * ( j - 1.0 ) * dp0;

      end

      dx = p2 / dp2;
      x = x - dx;

      if ( abs ( dx ) <= eps * ( abs ( x ) + 1.0 ) )
        break
      end

    end

    xtab(      i  ) = - x;
    xtab(order-i+1) = + x;

  end

  return
end
