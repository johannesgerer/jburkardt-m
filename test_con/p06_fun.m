function fx = p06_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P06_FUN evaluates the function for problem 6.
%
%  Title:
%
%    The aircraft stability problem.
%
%  Description:
%
%    The equations describe the behavior of an aircraft under the
%    control of a pilot.  The variables are
%
%      X(1) = roll
%      X(2) = pitch
%      X(3) = yaw
%      X(4) = angle of attack
%      X(5) = sideslip
%      X(6) = elevator
%      X(7) = aileron
%      X(8) = rudder
%
%    The function is of the following form
%
%    For indices I=1 through 5,
%
%      F(I) = SUM ( 1 <= J <= 8 ) B(I,J) * X(J)
%           + SUM ( 1 <= J <= 8, 1 <= K <= 8 ) C(I,J,K) * X(J) * X(K)
%
%    with the last two equations fixing the values of the elevator
%    and rudder:
%
%      F(6) = X(6) - value
%      F(7) = X(8)
%
%    Note that in the paper by Melhem and Rheinboldt, there are two
%    mistakes in the description of the function PHI(Y,U).  In both
%    cases, the factor "Y4*Y2" should be replaced by "Y4*U2".
%
%  Options:
%
%    There are five options, which vary in the value used to
%    fix the elevator value X(6):
%
%      Option   Elevator Value    Turning Points in X(7)
%
%       1        -0.050              1
%       2        -0.008              3
%       3         0.0                2
%       4         0.05               1
%       5         0.1                1
%
%  Special points:
%
%    Melhem and Rheinboldt list the following limit points in X(7)
%    (note that Melhem has B(4,1)=1.0, B(4,2)=0.0)
%
%       X(1)    X(2)     X(3)    X(4)    X(5)    X(6)   X(7)     X(8)
%
%    -2.9691  0.8307  -0.0727  0.4102 -0.2688 -0.05   0.5091   0.0
%    -2.8158 -0.1748  -0.0894  0.0263  0.0709 -0.008  0.2044   0.0
%    -3.7571 -0.6491  -0.3935  0.0918  0.1968 -0.008 -0.0038   0.0
%    -4.1637  0.0922  -0.0926  0.0224 -0.0171 -0.008  0.3782   0.0
%    -2.5839 -0.2212  -0.0540  0.0135  0.0908  0.0    0.1860   0.0
%    -3.9007 -1.1421  -0.5786  0.1328  0.3268  0.0   -0.5070   0.0
%    -2.3610 -0.7236   0.0327 -0.0391  0.2934  0.05   0.2927   0.0
%    -2.2982  1.4033   0.0632 -0.0793  0.5833  0.10   0.5833   0.0
%
%    Rheinboldt lists the following limit points in X(7), with
%    B(4,1)=0.0, B(4,2)=1.0:
%
%       X(1)    X(2)     X(3)    X(4)    X(5)    X(6)   X(7)     X(8)
%
%     2.9648  0.8255   0.0736  0.0413  0.2673 -0.050 -0.0504   0.0
%     2.8173 -0.1762   0.0899  0.0264 -0.0714 -0.008 -0.2049   0.0
%     3.7579 -0.6554   0.3865  0.0925 -0.1986 -0.008  0.0062   0.0
%     4.1638  0.0891   0.0948  0.0228  0.1623 -0.008 -0.3776   0.0
%     2.5873 -0.2235   0.0546  0.0136 -0.0916  0.000 -0.1869   0.0
%     3.9005 -1.1481   0.5815  0.1335 -0.3285  0.000  0.5101   0.0
%     2.3639 -0.7297  -0.3160 -0.0387 -0.2958  0.050 -0.2957   0.0
%     2.2992 -1.4102  -0.0618 -0.0790 -0.5862  0.100 -0.6897   0.0
%
%    Rheinboldt lists the following bifurcation points:
%
%       X(1)    X(2)     X(3)    X(4)    X(5)    X(6)    X(7)    X(8)
%
%     4.482   0.1632   0.0237  0.0062  0.0352 -0.0006 -0.3986  0.0
%     3.319  -0.1869   0.1605  0.0437 -0.0688 -0.0125 -0.2374  0.0
%     4.466   0.1467   0.0404  0.0097  0.0308 -0.0061 -0.3995  0.0
%    -3.325   0.1880  -0.1614  0.0439  0.0691 -0.0124  0.2367  0.0
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
%    Raman Mehra, William Kessel, James Carroll,
%    Global stability and contral analysis of aircraft at high angles of attack,
%    Technical Report CR-215-248-1, -2, -3,
%    Office of Naval Research, June 1977.
%
%    Rami Melhem, Werner Rheinboldt,
%    A Comparison of Methods for Determining Turning Points of Nonlinear Equations,
%    Computing,
%    Volume 29, Number 3, September 1982, pages 201-226.
%
%    Albert Schy, Margery Hannah,
%    Prediction of Jump Phenomena in Roll-coupled Maneuvers of Airplanes,
%    Journal of Aircraft,
%    Volume 14, Number 4, 1977,  pages 375-382.
%
%    John Young, Albert Schy, Katherine Johnson,,
%    Prediction of Jump Phenomena in Aircraft Maneuvers, Including
%    Nonlinear Aerodynamic Effects,
%    Journal of Guidance and Control,
%    Volume 1, Number 1, 1978, pages 26-31.
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
  x = x(:);
%
%  Compute the linear term.
%
  b(1:5,1:8) = p06_barray ( );

  fx = zeros ( nvar - 1, 1 );

  fx(1:5) = b(1:5,1:8) * x(1:8);
%
%  Compute the nonlinear terms.
%
  c(1:5,1:8,1:8) = p06_carray ( );

  for i = 1 : 5
    for j = 1 : 8
      for k = 1 : 8
        fx(i) = fx(i) + c(i,j,k) * x(j) * x(k);
      end
    end
  end
%
%  Set function values for two fixed variables.
%
  if ( option == 1 )
    val = - 0.050;
  elseif ( option == 2 )
    val = - 0.008;
  elseif ( option == 3 )
    val =   0.000;
  elseif ( option == 4 )
    val =   0.050;
  elseif ( option == 5 )
    val =   0.100;
  end

  fx(6) = x(6) - val;
  fx(7) = x(8);

  return
end
