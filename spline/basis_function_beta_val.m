function yval = basis_function_beta_val ( beta1, beta2, tdata, tval )

%*****************************************************************************80
%
%% BASIS_FUNCTION_BETA_VAL evaluates the beta spline basis function.
%
%  Discussion:
%
%    With BETA1 = 1 and BETA2 = 0, the beta spline basis function
%    equals the B spline basis function.
%
%    With BETA1 large, and BETA2 = 0, the beta spline basis function
%    skews to the right, that is, its maximum increases, and occurs
%    to the right of the center.
%
%    With BETA1 = 1 and BETA2 large, the beta spline becomes more like
%    a linear basis function; that is, its value in the outer two intervals
%    goes to zero, and its behavior in the inner two intervals approaches
%    a piecewise linear function that is 0 at the second node, 1 at the
%    third, and 0 at the fourth.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Davies, Philip Samuels,
%    An Introduction to Computational Geometry for Curves and Surfaces,
%    Clarendon Press, 1996, page 129.
%
%  Parameters:
%
%    Input, real BETA1, the skew or bias parameter.
%    BETA1 = 1 for no skew or bias.
%
%    Input, real BETA2, the tension parameter.
%    BETA2 = 0 for no tension.
%
%    Input, real TDATA(5), the nodes associated with the basis function.
%    The entries of TDATA are assumed to be distinct and increasing.
%
%    Input, real TVAL, a point at which the B spline basis function is
%    to be evaluated.
%
%    Output, real YVAL, the value of the function at TVAL.
%
  ndata = 5;

  if ( tval <= tdata(1) | tdata(ndata) <= tval )
    yval = 0.0;
    return
  end
%
%  Find the interval [ TDATA(LEFT), TDATA(RIGHT) ] containing TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  U is the normalized coordinate of TVAL in this interval.
%
  u = ( tval - tdata(left) ) / ( tdata(right) - tdata(left) );
%
%  Now evaluate the function.
%
  if ( tval < tdata(2) )

    yval = 2.0E+00 * u^3;

  elseif ( tval < tdata(3) )

    a = beta2 + 4.0E+00 * beta1 + 4.0E+00 * beta1^2 ...
      + 6.0E+00 * ( 1.0E+00 - beta1^2 ) ...
      - 3.0E+00 * ( 2.0E+00 + beta2 + 2.0E+00 * beta1 ) ...
      + 2.0E+00 * ( 1.0E+00 + beta2 + beta1 + beta1^2 );

    b = - 6.0E+00 * ( 1.0E+00 - beta1^2 ) ...
        + 6.0E+00 * ( 2.0E+00 + beta2 + 2.0E+00 * beta1 ) ...
        - 6.0E+00 * ( 1.0E+00 + beta2 + beta1 + beta1^2 );

    c = - 3.0E+00 * ( 2.0E+00 + beta2 + 2.0E+00 * beta1 ) ...
        + 6.0E+00 * ( 1.0E+00 + beta2 + beta1 + beta1^2 );

    d = - 2.0E+00 * ( 1.0E+00 + beta2 + beta1 + beta1^2 );

    yval = a + b * u + c * u^2 + d * u^3;

  elseif ( tval < tdata(4) )

    a = beta2 + 4.0E+00 * beta1 + 4.0E+00 * beta1^2;

    b = - 6.0E+00 * ( beta1 - beta1^3 );

    c = - 3.0E+00 * ( beta2 + 2.0E+00 * beta1^2 + 2.0E+00 * beta1^3 );

    d = 2.0E+00 * ( beta2 + beta1 + beta1^2 + beta1^3 );

    yval = a + b * u + c * u^2 + d * u^3;

  elseif ( tval < tdata(5) )

    yval = 2.0E+00 * beta1^3 * ( 1.0E+00 - u )^3;

  end

  yval = yval / ( 2.0E+00 + beta2 + 4.0E+00 * beta1 + 4.0E+00 * beta1^2 ...
    + 2.0E+00 * beta1^3 );

  return
end
