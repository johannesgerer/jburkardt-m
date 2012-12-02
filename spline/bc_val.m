function [ xval, yval ] = bc_val ( n, t, xcon, ycon )

%*****************************************************************************80
%
%% BC_VAL evaluates a parameterized Bezier curve.
%
%  Discussion:
%
%    BC_VAL(T) is the value of a vector function of the form
%
%      BC_VAL(T) = ( X(T), Y(T) )
%
%    where
%
%      X(T) = Sum ( 0 <= I <= N ) XCON(I) * BERN(I,N)(T)
%      Y(T) = Sum ( 0 <= I <= N ) YCON(I) * BERN(I,N)(T)
%
%    BERN(I,N)(T) is the I-th Bernstein polynomial of order N
%    defined on the interval [0,1],
%
%    XCON(0:N) and YCON(0:N) are the coordinates of N+1 "control points".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Kahaner, Moler, and Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989.
%
%  Parameters:
%
%    Input, integer N, the order of the Bezier curve, which
%    must be at least 0.
%
%    Input, real T, the point at which the Bezier curve should
%    be evaluated.  The best results are obtained within the interval
%    [0,1] but T may be anywhere.
%
%    Input, real XCON(0:N), YCON(0:N), the X and Y coordinates
%    of the control points.  The Bezier curve will pass through
%    the points ( XCON(0), YCON(0) ) and ( XCON(N), YCON(N) ), but
%    generally NOT through the other control points.
%
%    Output, real XVAL, YVAL, the X and Y coordinates of the point
%    on the Bezier curve corresponding to the given T value.
%
  bval = bp01 ( n, t );

  xval = xcon(1:n+1) * bval(1:n+1)';
  yval = ycon(1:n+1) * bval(1:n+1)';

  return
end
