function fx = p03_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P03_FUN evaluates the function for problem 3.
%
%  Title:
%
%    The Powell function
%
%  Description:
%
%    The function F is derived via homotopy from a simpler function G:
%
%      F(X(1),X(2),X(3)) = G(X(1),X(2)) + (X(3)-1)*G(Y1,Y2)
%
%    with
%
%      Y1, Y2 some starting point,
%
%    and
%
%      G(1) = 10000 * X(1) * X(2) - 1.0D+00
%      G(2) = exp ( -X(1) ) + exp ( -X(2) ) - 1.0001
%
%  Options:
%
%    OPTION = 1,
%      use starting point ( 3, 6, 0 );
%    OPTION = 2,
%      use starting point ( 4, 5, 0 );
%    OPTION = 3,
%      use starting point ( 6, 3, 0 );
%    OPTION = 4,
%      use starting point ( 1, 1, 0 ).
%
%  Special points:
%
%    For all options, there is a solution with last component 1, whose
%    value is either:
%
%      (1.098159E-5, 9.106146, 1.0)
%    or
%      (9.106146, 1.098159E-5, 1.0)
%
%  Comments:
%
%    Note that the function G is symmetric in X(1) and X(2).  Hence,
%    the run with starting point (1,1,0) should be interesting.
%
%    It would be worthwhile to seek limit points in X(3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Michael Powell,
%    A FORTRAN Subroutine for Solving Systems of Nonlinear Algebraic Equations,
%    in Numerical Methods for Nonlinear Algebraic Equations,
%    Edited by Philip Rabinowitz,
%    Gordon and Breach, 1970,
%    ISBN13: 978-0677142302,
%    LC: QA218.N85.
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

%
%  Get the starting point
%
  y = p03_start ( option, nvar );
%
%  Get the (underlying) function value at the starting point and at the
%  current point.
%
  gy = p03_gx ( y );
  gx = p03_gx ( x );
%
%  Use X3 to compute a homotopy.
%
  for i = 1 : nvar-1
    fx(i) = gx(i) + ( x(3) - 1.0 ) * gy(i);
  end

  return
end
