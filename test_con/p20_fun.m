function fx = p20_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P20_FUN evaluates the function for problem 20.
%
%  Title:
%
%    The Buckling Spring
%
%  Description:
%
%    We are given three points A, B, and C.
%    A is at the origin (0,0).
%    B has coordinates (X,Y) with Y nonnegative, and the ray from A to B
%    makes an angle of THETA with the horizontal axis.
%    C is at the point (2*X,0).
%
%    A spring extends from A to B, and is normally of length 1,
%    and is currently of length L.
%    A spring extends from B to C, and is normally of length 1, 
%    and is currently of length L.
%    A spring force is also exerted, which tends to draw the two
%    springs together, proportional to the angle between the two springs.
%
%    A vertical load MU is applied at point B (downward is positive).
%    A horizontal load is applied at point C (leftware is positive).
%    The spring force is applied perpendicularly to the axes of the two springs.
%
%    If we compute F(1), the force along the axis of one spring, and
%    F(2), the force perpendicular to the axis of one spring, we have that
%    F(L,THETA,LAMBDA,MU) is given by:
%
%    F(1) =  - 2 ( 1 - L ) + 2 * LAMBDA * cos ( THETA ) + MU * sin ( THETA )
%    F(2) =  0.5 * THETA - 2 * LAMBDA * L * sin ( THETA ) + MU * L * cos ( THETA )
%
%    The user must specify a third, augmenting equation, of the form
%
%    F(3) = X(HOLD_INDEX) - HOLD_VALUE.
%
%    Typically, HOLD_INDEX is 2, for the varlable THETA, and HOLD_VALUE is
%    an angle measured in radians and strictly between 0 and PI/2.
%
%    Another choice for HOLD_INDEX would be 1, for the variable L, with
%    HOLD_VALUE greater than 0.  Values of L less than 1 represent compressed
%    springs; values greater than 1 indicate extended springs.
%
%    L represents the length of a spring.
%    THETA represents the angle that the spring makes with the horizontal axis.
%    MU is a vertical load applied at the midpoint B.
%    LAMBDA is a horizontal load applied at the right endpoint C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Tim Poston, Ian Stewart,
%    Catastrophe Theory and its Applications,
%    Dover, 1996,
%    ISBN13: 978-0486692715,
%    LC: QA614.58.P66.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%
  l      = x(1);
  theta  = x(2);
  lambda = x(3);
  mu     = x(4);

  fx = zeros ( nvar - 1, 1 );

  fx(1) = - 2.0 * ( 1.0 - l ) ...
          + 2.0 * lambda * cos ( theta ) ...
          + mu * sin ( theta );

  fx(2) = 0.5 * theta ...
          - 2.0 * lambda * l * sin ( theta ) ...
          + mu * l * cos ( theta );

  hold_index = p20_i4_get ( 'hold_index' );
  hold_value = p20_r8_get ( 'hold_value' );

  fx(3) = x(hold_index) - hold_value;

  return
end
