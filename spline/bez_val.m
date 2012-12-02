function value = bez_val ( n, x, a, b, y )

%*****************************************************************************80
%
%% BEZ_VAL evaluates a Bezier function at a point.
%
%  Discussion:
%
%    The Bezier function has the form:
%
%      BEZ(X) = Sum ( 0 <= I <= N ) Y(I) * BERN(N,I)( (X-A)/(B-A) )
%
%    BERN(N,I)(X) is the I-th Bernstein polynomial of order N
%    defined on the interval [0,1],
%
%    Y(0:N) is a set of coefficients,
%
%    and if, for I = 0 to N, we define the N+1 points
%
%      X(I) = ( (N-I)*A + I*B) / N,
%
%    equally spaced in [A,B], the pairs ( X(I), Y(I) ) can be regarded as
%    "control points".
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
%    Input, integer N, the order of the Bezier function, which
%    must be at least 0.
%
%    Input, real X, the point at which the Bezier function should
%    be evaluated.  The best results are obtained within the interval
%    [A,B] but X may be anywhere.
%
%    Input, real A, B, the interval over which the Bezier function
%    has been defined.  This is the interval in which the control
%    points have been set up.  Note BEZ(A) = Y(0) and BEZ(B) = Y(N),
%    although BEZ will not, in general pass through the other
%    control points.  A and B must not be equal.
%
%    Input, real Y(0:N), a set of data defining the Y coordinates
%    of the control points.
%
%    Output, real VALUE, the value of the Bezier function at X.
%
  if ( b - a == 0.0E+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BEZ_VAL - Fatal error!\n' );
    fprintf ( 1, '  Null interval, A = B = %f\n', a );
    error ( 'BEZ_VAL - Fatal error!' );
  end
%
%  X01 lies in [0,1], in the same relative position as X in [A,B].
%
  x01 = ( x - a ) / ( b - a );

  bval = bp01 ( n, x01 );

  value = y(1:n+1) * bval(1:n+1)';

  return
end
