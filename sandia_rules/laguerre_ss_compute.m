function [ x, w ] = laguerre_ss_compute ( order )

%*****************************************************************************80
%
%% LAGUERRE_SS_COMPUTE computes a Laguerre quadrature rule.
%
%  Discussion:
%
%    The integration interval is [ 0, +oo ).
%
%    The weight function w(x) = exp ( - X ).
%
%
%    If the integral to approximate is:
%
%      Integral ( 0 <= X < +oo ) exp ( - X ) * F(X) dX
%
%    then the quadrature rule is:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%
%    If the integral to approximate is:
%
%      Integral ( 0 <= X < +oo ) F(X) dX
%
%    then the quadrature rule is:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * exp ( X(I) ) * F ( X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 December 2009
%
%  Author:
%
%    Original FORTRAN77 version by Arthur Stroud, Don Secrest.
%    MATLAB version by John Burkardt.
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
%    Input, integer ORDER, the order of the quadrature rule to be computed.
%    ORDER must be at least 1.
%
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGUERRE_SS_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'LAGUERRE_SS_COMPUTE - Fatal error!' );
  end

  x = zeros ( order, 1 );
  w = zeros ( order, 1 );
%
%  Set the recursion coefficients.
%
  b = zeros ( order, 1 );
  for i = 1 : order
    b(i) = 2 * i - 1;
  end

  c = zeros ( order, 1 );
  for i = 1 : order
    c(i) = ( i - 1 ) * ( i - 1 );
  end

% cc = prod ( c(2:order) );

  for i = 1 : order
%
%  Compute an estimate for the root.
%
    if ( i == 1 )

      x0 = 3.0 / ( 1.0 + 2.4 * order );

    elseif ( i == 2 )

      x0 = x0 + 15.0 / ( 1.0 + 2.5 * order );

    else

      r1 = ( 1.0 + 2.55 * ( i - 2 ) ) / ( 1.9 * ( i - 2 ) );

      x0 = x0 + r1 * ( x0 - x(i-2) );

    end
%
%  Use iteration to find the root.
%
    [ x0, dp2, p1 ] = laguerre_ss_root ( x0, order, b, c );
%
%  Set the abscissa and weight.
%
    x(i) = x0;
%
%  Because of the huge values involved, this calculation breaks down
%  for ORDER = 127.
%
%  It was originally w(i) = cc / dp2 / p1, which breaks down sooner.
%
    w(i) = ( 1.0 / dp2 );
    for j = 2 : order
      w(i) = w(i) * ( j - 1 );
    end
    w(i) = w(i) / p1;
    for j = 2 : order
      w(i) = w(i) * ( j - 1 );
    end
%   w(i) = ( cc / dp2 ) / p1;

  end

  return
end
