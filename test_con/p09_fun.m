function fx = p09_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P09_FUN evaluates the function for problem 9.
%
%  Title:
%
%    Oden mechanical problem.
%
%  Description:
%
%    The equations describe the equilibrium of a simple two bar
%    framework, with one common endpoint, and the other endpoints
%    fixed.  A load is applied to the common endpoint.  The bars are
%    constructed of an isotropic hookean material.
%
%    The function is of the form
%
%      F(1) = X(1)**3 - 3*height*X(1)**2 + 2*height**2*X(1)
%            +X(1)*X(2)**2 - height*X(2)**2 - X(3)*cos(X(4))
%
%      F(2) = X(1)**2*X(2) - 2*height*X(1)*X(2) + X(2)**3 + 2*X(2)
%            -X(3)*sin(X(4))
%
%      F(3) = X(IVAL) - VAL
%
%    with
%
%      HEIGHT=2.0D+00
%      IVAL=4
%      VAL varying, depending on the option
%
%  Options:
%
%        VAL   IT XIT  LIM
%
%     1  0.00, 1, 4.0, 1
%     2  0.25, 1, 4.0, 1
%     3  0.50, 1, 4.0, 1
%     4  1.00, 1, 4.0, 1
%     5  0.00, 1, 4.0, 2
%     6  0.25, 1, 4.0, 2
%     7  0.50, 1, 4.0, 2
%     8  1.00, 1, 4.0, 2
%     9  0.00, 1, 4.0, 3
%    10  0.25, 1, 4.0, 3
%    11  0.50, 1, 4.0, 3
%    12  1.00, 1, 4.0, 3
%    13  0.00, 0,      0.
%
%    For options 1, 5, and 9, the target point is (4,0,0,0).
%
%    For option 9, there are the following limit points in X(3)
%
%      (2+-2/sqrt(3), 0, +-16/sqrt(27), 0)
%
%    For skew loads (X(4) nonzero) there are various limit points.
%
%    Melhem lists,
%
%      (0.5903206, 0.8391448, 0.9581753, 1.252346)
%      (2.705446,  0.6177675, 0.9581753, 1.252346)
%
%    with X(3),X(4) corresponding to a load vector of (.30,.91).
%
%    Computational results with this program are:
%
%    OPTION = 2  limit points in X(1)
%
%    2.816913  0.7396444  -2.348587  0.2500000
%    1.183087 -0.7396445   2.348587  0.2500000
%
%    OPTION=3  limit points in X(1)
%
%    2.520900  0.8598542  -1.774344  0.5000000
%    1.479100 -0.8598521   1.774346  0.5000000
%
%    OPTION=4  limit points in X(1)
%
%    2.210747  0.9241686  -1.209751  1.0000000
%    (limit point finder failed at second limit point)
%
%    OPTION=6  limit points in X(2)
%
%    1.831179  1.424861  0.3392428  0.2500000
%    (apparently did not reach second limit point)
%
%    OPTION=7  limit points in X(2)
%
%    1.697061  1.453503  0.6198216  0.2500000
%    2.302939 -1.453503 -0.6198219  0.2500000
%
%    OPTION=8  limit points in X(2)
%
%    1.534293  1.555364  1.175649  1.0000000
%    2.465706 -1.555364 -1.175648  1.0000000
%
%    OPTION=9  limit points in X(3)
%
%    0.8452995  0.0000000  3.079199  0.0000000
%    3.154701   0.0000000 -3.079197  0.0000000
%
%    OPTION=10  limit points in X(3)
%
%    0.5800046  0.7846684  2.004746  0.2500000
%    2.777765   0.5695726 -2.464886  0.2500000
%
%    OPTION=11  limit points in X(3)
%
%    0.6305253  0.9921379  1.779294  0.5000000
%    2.501894   0.7202593 -1.846869  0.5000000
%
%    OPTION=12  limit points in X(3)
%
%    0.7650624  1.292679   1.837450  1.000000
%    2.204188   0.8010838 -1.253382  1.000000
%
%    Bifurcation points occur at
%
%    (2+-sqrt(2), 0, +-sqrt(2), 0)
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
%    Rami Melhem, Werner Rheinboldt,
%    A Comparison of Methods for Determining Turning Points of Nonlinear Equations,
%    Computing,
%    Volume 29, Number 3, September 1982, pages 201-226.
%
%    John Oden,
%    Finite Elements of Nonlinear Continua,
%    Dover, 2006,
%    ISBN: 0486449734,
%    LC: QA808.2.O33.
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
  [ height, ival, val ] = p09_gx ( option );

  x1 = x(1);
  x2 = x(2);
  x3 = x(3);
  x4 = x(4);

  fx(1) = x1 * x1 * x1 - 3.0 * height * x1 * x1 + 2.0 * height * height * x1 ...
        + x1 * x2 * x2 - height * x2 * x2 - x3 * cos ( x4 );

  fx(2) = x1 * x1 * x2 - 2.0 * height * x1 * x2 + x2 * x2 * x2 ...
        + 2.0 * x2 - x3 * sin ( x4 );

  fx(3) = x(ival) - val;

  return
end
