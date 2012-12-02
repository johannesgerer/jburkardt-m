function ypp = spline_cubic_set ( n, t, y, ibcbeg, ybcbeg, ibcend, ybcend )

%*****************************************************************************80
%
%% SPLINE_CUBIC_SET computes the second derivatives of a piecewise cubic spline.
%
%  Discussion:
%
%    For data interpolation, the user must call SPLINE_CUBIC_SET to
%    determine the second derivative data, passing in the data to be
%    interpolated, and the desired boundary conditions.
%
%    The data to be interpolated, plus the SPLINE_CUBIC_SET output,
%    defines the spline.  The user may then call SPLINE_CUBIC_VAL to
%    evaluate the spline at any point.
%
%    The cubic spline is a piecewise cubic polynomial.  The intervals
%    are determined by the "knots" or abscissas of the data to be
%    interpolated.  The cubic spline has continous first and second
%    derivatives over the entire interval of interpolation.
%
%    For any point T in the interval T(IVAL), T(IVAL+1), the form of
%    the spline is
%
%      SPL(T) = A(IVAL)
%             + B(IVAL) * ( T - T(IVAL) )
%             + C(IVAL) * ( T - T(IVAL) )**2
%             + D(IVAL) * ( T - T(IVAL) )**3
%
%    If we assume that we know the values Y(*) and YPP(*), which represent
%    the values and second derivatives of the spline at each knot, then
%    the coefficients can be computed as:
%
%      A(IVAL) = Y(IVAL)
%      B(IVAL) = ( Y(IVAL+1) - Y(IVAL) ) / ( T(IVAL+1) - T(IVAL) )
%        - ( YPP(IVAL+1) + 2 * YPP(IVAL) ) * ( T(IVAL+1) - T(IVAL) ) / 6
%      C(IVAL) = YPP(IVAL) / 2
%      D(IVAL) = ( YPP(IVAL+1) - YPP(IVAL) ) / ( 6 * ( T(IVAL+1) - T(IVAL) ) )
%
%    Since the first derivative of the spline is
%
%      SPL'(T) =     B(IVAL)
%              + 2 * C(IVAL) * ( T - T(IVAL) )
%              + 3 * D(IVAL) * ( T - T(IVAL) )**2,
%
%    the requirement that the first derivative be continuous at interior
%    knot I results in a total of N-2 equations, of the form:
%
%      B(IVAL-1) + 2 C(IVAL-1) * (T(IVAL)-T(IVAL-1))
%      + 3 * D(IVAL-1) * (T(IVAL) - T(IVAL-1))**2 = B(IVAL)
%
%    or, setting H(IVAL) = T(IVAL+1) - T(IVAL)
%
%      ( Y(IVAL) - Y(IVAL-1) ) / H(IVAL-1)
%      - ( YPP(IVAL) + 2 * YPP(IVAL-1) ) * H(IVAL-1) / 6
%      + YPP(IVAL-1) * H(IVAL-1)
%      + ( YPP(IVAL) - YPP(IVAL-1) ) * H(IVAL-1) / 2
%      =
%      ( Y(IVAL+1) - Y(IVAL) ) / H(IVAL)
%      - ( YPP(IVAL+1) + 2 * YPP(IVAL) ) * H(IVAL) / 6
%
%    or
%
%      YPP(IVAL-1) * H(IVAL-1) + 2 * YPP(IVAL) * ( H(IVAL-1) + H(IVAL) )
%      + YPP(IVAL) * H(IVAL)
%      =
%      6 * ( Y(IVAL+1) - Y(IVAL) ) / H(IVAL)
%      - 6 * ( Y(IVAL) - Y(IVAL-1) ) / H(IVAL-1)
%
%    Boundary conditions must be applied at the first and last knots.
%    The resulting tridiagonal system can be solved for the YPP values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl de Boor,
%    A Practical Guide to Splines,
%    Springer Verlag, 1978.
%
%  Parameters:
%
%    Input, integer N, the number of data points; N must be at least 2.
%
%    Input, real T(N), the points where data is specified.
%    The values should be distinct, and increasing.
%
%    Input, real Y(N), the data values to be interpolated.
%
%    Input, integer IBCBEG, the left boundary condition flag:
%
%      0: the spline should be a quadratic over the first interval;
%      1: the first derivative at the left endpoint should be YBCBEG;
%      2: the second derivative at the left endpoint should be YBCBEG.
%
%    Input, real YBCBEG, the left boundary value, if needed.
%
%    Input, integer IBCEND, the right boundary condition flag:
%
%      0: the spline should be a quadratic over the last interval;
%      1: the first derivative at the right endpoint should be YBCEND;
%      2: the second derivative at the right endpoint should be YBCEND.
%
%    Input, real YBCEND, the right boundary value, if needed.
%
%    Output, real YPP(N), the second derivatives of the cubic spline.
%

%
%  Check.
%
  if ( n <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_CUBIC_SET - Fatal error!\n' );
    fprintf ( 1, '  The number of knots must be at least 2.\n' );
    fprintf ( 1, '  The input value of N = %d\n', n );
    error ( 'SPLINE_CUBIC_SET - Fatal error!' );
  end

  for i = 1 : n-1
    if ( t(i+1) <= t(i) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPLINE_CUBIC_SET - Fatal error!\n' );
      fprintf ( 1, '  The knots must be strictly increasing, but\n' );
      fprintf ( 1, '  T(%d) = %f\n', i,   t(i)   );
      fprintf ( 1, '  T(%d) = %f\n', i+1, t(i+1) );
      error ( 'SPLINE_CUBIC_SET - Fatal error!' );
    end
  end
%
%  Set the first equation.
%
  if ( ibcbeg == 0 )
    b(1) = 0.0E+00;
    a(2,1) = 1.0E+00;
    a(1,2) = -1.0E+00;
  elseif ( ibcbeg == 1 )
    b(1) = ( y(2) - y(1) ) / ( t(2) - t(1) ) - ybcbeg;
    a(2,1) = ( t(2) - t(1) ) / 3.0E+00;
    a(1,2) = ( t(2) - t(1) ) / 6.0E+00;
  elseif ( ibcbeg == 2 )
    b(1) = ybcbeg;
    a(2,1) = 1.0E+00;
    a(1,2) = 0.0E+00;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_CUBIC_SET - Fatal error!\n' );
    fprintf ( 1, '  The boundary flag IBCBEG must be 0, 1 or 2.\n' );
    fprintf ( 1, '  The input value is IBCBEG = %d\n', ibcbeg );
    error ( 'SPLINE_CUBIC_SET - Fatal error!' );
  end
%
%  Set the intermediate equations.
%
  for i = 2 : n-1
    b(i) = ( y(i+1) - y(i) ) / ( t(i+1) - t(i) ) ...
           - ( y(i) - y(i-1) ) / ( t(i) - t(i-1) );
    a(3,i-1) = ( t(i) - t(i-1) ) / 6.0E+00;
    a(2,i) = ( t(i+1) - t(i-1) ) / 3.0E+00;
    a(1,i+1) = ( t(i+1) - t(i) ) / 6.0E+00;
  end
%
%  Set the last equation.
%
  if ( ibcend == 0 )
    b(n) = 0.0E+00;
    a(3,n-1) = -1.0E+00;
    a(2,n) = 1.0E+00;
  elseif ( ibcend == 1 )
    b(n) = ybcend - ( y(n) - y(n-1) ) / ( t(n) - t(n-1) );
    a(3,n-1) = ( t(n) - t(n-1) ) / 6.0E+00;
    a(2,n) = ( t(n) - t(n-1) ) / 3.0E+00;
  elseif ( ibcend == 2 )
    b(n) = ybcend;
    a(3,n-1) = 0.0E+00;
    a(2,n) = 1.0E+00;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_CUBIC_SET - Fatal error!\n' );
    fprintf ( 1, '  The boundary flag IBCEND must be 0, 1 or 2.\n' );
    fprintf ( 1, '  The input value is IBCEND = %d\n', ibcend );
    error ( 'SPLINE_CUBIC_SET - Fatal error!' );
  end
%
%  Special case:
%    N = 2, IBCBEG = IBCEND = 0.
%
  if ( n == 2 & ibcbeg == 0 & ibcend == 0 )

    ypp(1) = 0.0E+00;
    ypp(2) = 0.0E+00;
%
%  Solve the linear system.
%
  else

    ypp(1:n) = d3_np_fs ( n, a, b );

  end

  return
end
