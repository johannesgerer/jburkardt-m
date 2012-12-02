function [ x, w ] = moulton_set ( n )

%*****************************************************************************80
%
%% MOULTON_SET sets weights for Adams-Moulton quadrature.
%
%  Discussion:
%
%    Adams-Moulton quadrature formulas are normally used in solving
%    ordinary differential equations, and are not suitable for general
%    quadrature computations.  However, an Adams-Moulton formula is
%    equivalent to approximating the integral of F(Y(X)) between X(M)
%    and X(M+1), using an implicit formula that relies on known values
%    of F(Y(X)) at X(M-N+1) through X(M), plus the unknown value at X(M+1).
%
%    Suppose the unknown function is denoted by Y(X), with derivative F(Y(X)),
%    and that approximate values of the function are known at a series of
%    X values, which we write as X(1), X(2), ..., X(M).  We write the value
%    Y(X(1)) as Y(1) and so on.
%
%    Then the solution of the ODE Y' = F(X,Y) at the next point X(M+1) is
%    computed by:
%
%      Y(M+1) = Y(M) + Integral ( X(M) < X < X(M+1) ) F(Y(X)) dX
%             = Y(M) + H * Sum ( 1 <= I <= N ) W(I) * F(Y(M+2-I)) approximately.
%
%    Note that this formula is implicit, since the unknown value Y(M+1)
%    appears on the right hand side.  Hence, in ODE applications, this
%    equation must be solved via a nonlinear equation solver.  For
%    quadrature problems, where the function to be integrated is known
%    beforehand, this is not a problem, and the calculation is explicit.
%
%    In the documentation that follows, we replace F(Y(X)) by F(X).
%
%
%    The Adams-Moulton formulas require equally spaced data.
%
%    Here is how the formula is applied in the case with non-unit spacing:
%
%      Integral ( A <= X <= A+H ) F(X) dX =
%      H * Sum ( 1 <= I <= N ) W(I) * F ( A - (I-2)*H ),
%      approximately.
%
%    The integral:
%
%      Integral ( 0 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( 2 - I )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    page 915 ("Lagrangian Integration Coefficients").
%
%    Jean Lapidus and John Seinfeld,
%    Numerical Solution of Ordinary Differential Equations,
%    Academic Press, 1971.
%
%    Daniel Zwillinger, editor,
%    Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N must be between 1 and 10, 12, 14, 16, 18 or 20.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%    W(1) is the weight at X = 1, W(2) the weight at X = 0, and so on.
%    The weights are rational.  The weights are not symmetric, and
%    some weights may be negative.  They should sum to 1.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  if ( n == 1 )

    w(1) =  1.0;

  elseif ( n == 2 )

    d = 2.0;

    w(1) =  1.0 / d;
    w(2) =  1.0 / d;

  elseif ( n == 3 )

    d = 12.0;

    w(1) =    5.0 / d;
    w(2) =    8.0 / d;
    w(3) =  - 1.0 / d;

  elseif ( n == 4 )

    d = 24.0;

    w(1) =    9.0 / d;
    w(2) =   19.0 / d;
    w(3) =  - 5.0 / d;
    w(4) =    1.0 / d;

  elseif ( n == 5 )

    d = 720.0;

    w(1) =    251.0 / d;
    w(2) =    646.0 / d;
    w(3) =  - 264.0 / d;
    w(4) =    106.0 / d;
    w(5) =   - 19.0 / d;

  elseif ( n == 6 )

    d = 1440.0;

    w(1) =    475.0 / d;
    w(2) =   1427.0 / d;
    w(3) =  - 798.0 / d;
    w(4) =    482.0 / d;
    w(5) =  - 173.0 / d;
    w(6) =     27.0 / d;

  elseif ( n == 7 )

    d = 60480.0;

    w(1) =    19087.0 / d;
    w(2) =    65112.0 / d;
    w(3) =  - 46461.0 / d;
    w(4) =    37504.0 / d;
    w(5) =  - 20211.0 / d;
    w(6) =     6312.0 / d;
    w(7) =    - 863.0 / d;

  elseif ( n == 8 )

    d = 120960.0;

    w(1) =    36799.0 / d;
    w(2) =   139849.0 / d;
    w(3) = - 121797.0 / d;
    w(4) =   123133.0 / d;
    w(5) =  - 88547.0 / d;
    w(6) =    41499.0 / d;
    w(7) =  - 11351.0 / d;
    w(8) =     1375.0 / d;

  elseif ( n == 9 )

    d = 3628800.0;

    w(1) =   1070017.0 / d;
    w(2) =   4467094.0 / d;
    w(3) = - 4604594.0 / d;
    w(4) =   5595358.0 / d;
    w(5) = - 5033120.0 / d;
    w(6) =   3146338.0 / d;
    w(7) = - 1291214.0 / d;
    w(8) =    312874.0 / d;
    w(9) =   - 33953.0 / d;

  elseif ( n == 10 )

    d = 7257600.0;

    w(1) =    2082753.0 / d;
    w(2) =    9449717.0 / d;
    w(3) = - 11271304.0 / d;
    w(4) =   16002320.0 / d;
    w(5) = - 17283646.0 / d;
    w(6) =   13510082.0 / d;
    w(7) =  - 7394032.0 / d;
    w(8) =    2687864.0 / d;
    w(9) =   - 583435.0 / d;
    w(10) =     57281.0 / d;

  elseif ( order == 12 )

    d = 958003200.0;

    w(1) =    262747265.0 / d;
    w(2) =   1374799219.0 / d;
    w(3) =  -2092490673.0 / d;
    w(4) =   3828828885.0 / d;
    w(5) =  -5519460582.0 / d;
    w(6) =   6043521486.0 / d;
    w(7) =  -4963166514.0 / d;
    w(8) =   3007739418.0 / d;
    w(9) =  -1305971115.0 / d;
    w(10) =   384709327.0 / d;
    w(11) =   -68928781.0 / d;
    w(12) =     5675265.0 / d;

  elseif ( order == 14 )

    d = 5230697472000.0;

    w(1) =    1382741929621.0 / d;
    w(2) =    8153167962181.0 / d;
    w(3) =  -15141235084110.0 / d;
    w(4) =   33928990133618.0 / d;
    w(5) =  -61188680131285.0 / d;
    w(6) =   86180228689563.0 / d;
    w(7) =  -94393338653892.0 / d;
    w(8) =   80101021029180.0 / d;
    w(9) =  -52177910882661.0 / d;
    w(10) =  25620259777835.0 / d;
    w(11) =  -9181635605134.0 / d;
    w(12) =   2268078814386.0 / d;
    w(13) =   -345457086395.0 / d;
    w(14) =     24466579093.0 / d;

  elseif ( order == 16 )

    d = 62768369664000.0;

    w(1) =     16088129229375.0 / d;
    w(2) =    105145058757073.0 / d;
    w(3) =   -230992163723849.0 / d;
    w(4) =    612744541065337.0 / d;
    w(5) =  -1326978663058069.0 / d;
    w(6) =   2285168598349733.0 / d;
    w(7) =  -3129453071993581.0 / d;
    w(8) =   3414941728852893.0 / d;
    w(9) =  -2966365730265699.0 / d;
    w(10) =  2039345879546643.0 / d;
    w(11) = -1096355235402331.0 / d;
    w(12) =   451403108933483.0 / d;
    w(13) =  -137515713789319.0 / d;
    w(14) =    29219384284087.0 / d;
    w(15) =    -3867689367599.0 / d;
    w(16) =      240208245823.0 / d;

  elseif ( order == 18 )

    d = 64023737057280000.0;

    w(1) =      15980174332775873.0 / d;
    w(2) =     114329243705491117.0 / d;
    w(3) =    -290470969929371220.0 / d;
    w(4) =     890337710266029860.0 / d;
    w(5) =   -2250854333681641520.0 / d;
    w(6) =    4582441343348851896.0 / d;
    w(7) =   -7532171919277411636.0 / d;
    w(8) =   10047287575124288740.0 / d;
    w(9) =  -10910555637627652470.0 / d;
    w(10) =   9644799218032932490.0 / d;
    w(11) =  -6913858539337636636.0 / d;
    w(12) =   3985516155854664396.0 / d;
    w(13) =  -1821304040326216520.0 / d;
    w(14) =    645008976643217360.0 / d;
    w(15) =   -170761422500096220.0 / d;
    w(16) =     31816981024600492.0 / d;
    w(17) =     -3722582669836627.0 / d;
    w(18) =       205804074290625.0 / d;

  elseif ( order == 20 )

    d = 102181884343418880000.0;

    w(1) =       24919383499187492303.0 / d;
    w(2) =      193280569173472261637.0 / d;
    w(3) =     -558160720115629395555.0 / d;
    w(4) =     1941395668950986461335.0 / d;
    w(5) =    -5612131802364455926260.0 / d;
    w(6) =    13187185898439270330756.0 / d;
    w(7) =   -25293146116627869170796.0 / d;
    w(8) =    39878419226784442421820.0 / d;
    w(9) =   -51970649453670274135470.0 / d;
    w(10) =   56154678684618739939910.0 / d;
    w(11) =  -50320851025594566473146.0 / d;
    w(12) =   37297227252822858381906.0 / d;
    w(13) =  -22726350407538133839300.0 / d;
    w(14) =   11268210124987992327060.0 / d;
    w(15) =   -4474886658024166985340.0 / d;
    w(16) =    1389665263296211699212.0 / d;
    w(17) =    -325187970422032795497.0 / d;
    w(18) =      53935307402575440285.0 / d;
    w(19) =      -5652892248087175675.0 / d;
    w(20) =        281550972898020815.0 / d;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'MOULTON_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N = %d\n', n );
    fprintf ( 1, '  Legal values are 1 through 10, 12, 14, 16, 18, or 20.\n' );
    error ( 'MOULTON_SET - Fatal error!' );

  end

  for i = 1 : n
    x(i) = ( 2 - i );
  end

  return
end
