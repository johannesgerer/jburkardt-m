function pyramid_rule ( legendre_order, jacobi_order, filename )

%*****************************************************************************80
%
%% PYRAMID_RULE generates a quadrature rule for a pyramid.
%
%  Discussion:
%
%    This program computes a quadrature rule for a pyramid
%    and writes it to a file.
%
%    The user specifies:
%    * the LEGENDRE_ORDER (number of points in the X and Y dimensions)
%    * the JACOBI_ORDER (number of points in the Z dimension)
%    * FILENAME< the root name of the output files.
%
%    The integration region is:
% 
%      - ( 1 - Z ) <= X <= 1 - Z
%      - ( 1 - Z ) <= Y <= 1 - Z
%                0 <= Z <= 1.
%
%    When Z is zero, the integration region is a square lying in the (X,Y) 
%    plane, centered at (0,0,0) with "radius" 1.  As Z increases to 1, the 
%    radius of the square diminishes, and when Z reaches 1, the square has 
%    contracted to the single point (0,0,1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 July 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_RULE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute a quadrature rule for approximating\n' );
  fprintf ( 1, '  the integral of a function over a pyramid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The user specifies:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEGENDRE_ORDER, the order of the Legendre rule for X and Y.\n' );
  fprintf ( 1, '  JACOBI_ORDER, the order of the Jacobi rule for Z,\n' );
  fprintf ( 1, '  FILENAME, the prefix for the three output files:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    filename_w.txt - the weight file\n' );
  fprintf ( 1, '    filename_x.txt - the abscissa file.\n' );
  fprintf ( 1, '    filename_r.txt - the region file.\n' );
%
%  Get the Legendre order.
%
  if ( 1 <= nargin )
  
  else
  
    fprintf ( 1, '\n' );
    legendre_order = input ( '  Enter the Legendre rule order:' );
    
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The requested Legendre order of the rule is %d.\n', ...
    legendre_order );
%
%  Get the Jacobi order.
%
  if ( 2 <= nargin )
      
  else
  
    fprintf ( 1, '\n' );
    jacobi_order = input ( '  Enter the Jacobi rule order:' );
    
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The requested Jacobi order of the rule is %d.\n', ...
    jacobi_order );
%
%  Get the output option or quadrature file root name:
%
  if ( 3 <= nargin )

  else

    fprintf ( 1, '\n' );
    filename = input ( '  Enter the "root name" of the quadrature files).' );

  end

  pyramid_handle ( legendre_order, jacobi_order, filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_RULE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ x, w ] = jacobi_compute ( order, alpha, beta )

%*****************************************************************************80
%
%% JACOBI_COMPUTE computes the abscissa and weights for Jacobi quadrature.
%
%  Discussion:
%
%    The integration interval is [ -1, 1 ].
%
%    The weight function is w(x) = (1-X)^ALPHA * (1+X)^BETA.
%
%    The integral to approximate is:
%
%      Integral ( -1 <= X <= 1 ) (1-X)^ALPHA * (1+X)^BETA * F(X) dX
%
%    The quadrature formula is:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%    Thanks to Xu Xiang of Fudan University for pointing out that
%    an earlier implementation of this routine was incorrect!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2008
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
%
%    Input, real ALPHA, BETA, the exponents of (1-X) and
%    (1+X) in the quadrature rule.  For simple Legendre quadrature,
%    set ALPHA = BETA = 0.0.  -1.0 < ALPHA and -1.0 < BETA are required.
%
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'JACOBI_COMPUTE - Fatal error!' );
  end
%
%  Check ALPHA and BETA.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  -1.0 < ALPHA is required.\n' );
    error ( 'JACOBI_COMPUTE - Fatal error!' );
  end

  if ( beta <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  -1.0 < BETA is required.\n' );
    error ( 'JACOBI_COMPUTE - Fatal error!' );
  end
%
%  Set the recursion coefficients.
%
  b = zeros ( order, 1 );
  c = zeros ( order, 1 );
  w = zeros ( order, 1 );
  x = zeros ( order, 1 );
  
  for i = 1 : order

    if ( alpha + beta == 0.0 || beta - alpha == 0.0 )

      b(i) = 0.0;

    else

      b(i) = ( alpha + beta ) * ( beta - alpha ) / ...
            ( ( alpha + beta + 2 * i ) ...
            * ( alpha + beta + 2 * i - 2 ) );

    end

    if ( i == 1 )

      c(i) = 0.0;

    else

      c(i) = 4.0 * ( i - 1 ) * ( alpha + i - 1 ) * ( beta + i - 1 ) ...
        * ( alpha + beta + i - 1 ) / ( ( alpha + beta + 2 * i - 1 ) ...
        * ( alpha + beta + 2 * i - 2 )^2 * ( alpha + beta + 2 * i - 3 ) );

    end

  end

  delta = r8_gamma ( alpha        + 1.0 ) ...
        * r8_gamma (         beta + 1.0 ) ...
        / r8_gamma ( alpha + beta + 2.0 );

  cc = delta * 2.0^( alpha + beta + 1.0 ) * prod ( c(2:order) );

  for i = 1 : order

    if ( i == 1 )

      an = alpha / order;
      bn = beta / order;

      r1 = ( 1.0 + alpha ) * ( 2.78 / ( 4.0 + order * order ) ...
        + 0.768 * an / order );

      r2 = 1.0 + 1.48 * an + 0.96 * bn + 0.452 * an^2 + 0.83 * an * bn;

      x0 = ( r2 - r1 ) / r2;

    elseif ( i == 2 )

      r1 = ( 4.1 + alpha ) / ...
        ( ( 1.0 + alpha ) * ( 1.0 + 0.156 * alpha ) );

      r2 = 1.0 + 0.06 * ( order - 8.0 ) * ( 1.0 + 0.12 * alpha ) / order;

      r3 = 1.0 + 0.012 * beta * ...
        ( 1.0 + 0.25 * abs ( alpha ) ) / order;

      x0 = x0 - r1 * r2 * r3 * ( 1.0 - x0 );

    elseif ( i == 3 )

      r1 = ( 1.67 + 0.28 * alpha ) / ( 1.0 + 0.37 * alpha );

      r2 = 1.0 + 0.22 * ( order - 8.0 ) / order;

      r3 = 1.0 + 8.0 * beta / ( ( 6.28 + beta ) * order * order );

      x0 = x0 - r1 * r2 * r3 * ( x(1) - x0 );

    elseif ( i < order - 1 )

      x0 = 3.0 * x(i-1) - 3.0 * x(i-2) + x(i-3);

    elseif ( i == order - 1 )

      r1 = ( 1.0 + 0.235 * beta ) / ( 0.766 + 0.119 * beta );

      r2 = 1.0 / ( 1.0 + 0.639 * ( order - 4.0 ) ...
        / ( 1.0 + 0.71 * ( order - 4.0 ) ) );

      r3 = 1.0 / ( 1.0 + 20.0 * alpha / ( ( 7.5 + alpha ) * order * order ) );

      x0 = x0 + r1 * r2 * r3 * ( x0 - x(i-2) );

    elseif ( i == order )

      r1 = ( 1.0 + 0.37 * beta ) / ( 1.67 + 0.28 * beta );

      r2 = 1.0 / ( 1.0 + 0.22 * ( order - 8.0 ) / order );

      r3 = 1.0 / ( 1.0 + 8.0 * alpha / ( ( 6.28 + alpha ) * order * order ) );

      x0 = x0 + r1 * r2 * r3 * ( x0 - x(i-2) );

    end

    [ x0, dp2, p1 ] = jacobi_root ( x0, order, alpha, beta, b, c );

    x(i) = x0;
    w(i) = cc / ( dp2 * p1 );

  end
%
%  Reverse the order of the values.
%
  x(1:order) = x(order:-1:1);
  w(1:order) = w(order:-1:1);

  return
end
function [ p2, dp2, p1 ] = jacobi_recur ( x, order, alpha, beta, b, c )

%*****************************************************************************80
%
%% JACOBI_RECUR finds the value and derivative of a Jacobi polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
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
%    Input, real X, the point at which polynomials are evaluated.
%
%    Input, integer ORDER, the order of the polynomial to be computed.
%
%    Input, real ALPHA, BETA, the exponents of (1+X) and
%    (1-X) in the quadrature rule.
%
%    Input, real B(ORDER), C(ORDER), the recursion
%    coefficients.
%
%    Output, real P2, the value of J(ORDER)(X).
%
%    Output, real DP2, the value of J'(ORDER)(X).
%
%    Output, real P1, the value of J(ORDER-1)(X).
%
  p1 = 1.0;
  dp1 = 0.0;

  p2 = x + ( alpha - beta ) / ( alpha + beta + 2.0 );
  dp2 = 1.0;

  for i = 2 : order

    p0 = p1;
    dp0 = dp1;

    p1 = p2;
    dp1 = dp2;

    p2 = ( x - b(i) ) * p1 - c(i) * p0;
    dp2 = ( x - b(i) ) * dp1 + p1 - c(i) * dp0;

  end

  return
end
function [ x, dp2, p1 ] = jacobi_root ( x, order, alpha, beta, b, c )

%*****************************************************************************80
%
%% JACOBI_ROOT improves an approximate root of a Jacobi polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
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
%    Input, real X, the approximate root.
%
%    Input, integer ORDER, the order of the polynomial to be computed.
%
%    Input, real ALPHA, BETA, the exponents of (1+X) and
%    (1-X) in the quadrature rule.
%
%    Input, real B(ORDER), C(ORDER), the recursion coefficients.
%
%    Output, real X, the improved approximate root.
%
%    Output, real DP2, the value of J'(ORDER)(X).
%
%    Output, real P1, the value of J(ORDER-1)(X).
%
  maxstep = 10;

  eps = r8_epsilon ( );

  for i = 1 : maxstep

    [ p2, dp2, p1 ] = jacobi_recur ( x, order, alpha, beta, b, c );

    d = p2 / dp2;
    x = x - d;

    if ( abs ( d ) <= eps * ( abs ( x ) + 1.0 ) )
      return
    end

  end

  return
end
function [ x, w ] = legendre_compute ( order )

%*****************************************************************************80
%
%% LEGENDRE_COMPUTE computes a Legendre quadrature rule.
%
%  Discussion:
%
%    The integration interval is [ -1, 1 ].
%
%    The weight function is w(x) = 1.0.
%
%    The integral to approximate:
%
%      Integral ( -1 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Philip Davis, Philip Rabinowitz.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    ORDER must be greater than 0.
%
%    Output, real X(ORDER), the abscissas of the rule.
%
%    Output, real W(ORDER), the weights of the rule.
%    The weights are positive, symmetric, and should sum to 2.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'LEGENDRE_COMPUTE - Fatal error!' );
  end

  w = zeros ( order, 1 );
  x = zeros ( order, 1 );
  
  e1 = order * ( order + 1 );

  m = floor ( ( order + 1 ) / 2 );

  for i = 1 : floor ( ( order + 1 ) / 2 )

    mp1mi = m + 1 - i;

    t = ( 4 * i - 1 ) * pi / ( 4 * order + 2 );

    x0 = cos(t) * ( 1.0 - ( 1.0 - 1.0 / ( order ) ) / ( 8 * order * order ) );

    pkm1 = 1.0;
    pk = x0;

    for k = 2 : order
      pkp1 = 2.0 * x0 * pk - pkm1 - ( x0 * pk - pkm1 ) / k;
      pkm1 = pk;
      pk = pkp1;
    end

    d1 = order * ( pkm1 - x0 * pk );

    dpn = d1 / ( 1.0 - x0 * x0 );

    d2pn = ( 2.0 * x0 * dpn - e1 * pk ) / ( 1.0 - x0 * x0 );

    d3pn = ( 4.0 * x0 * d2pn + ( 2.0 - e1 ) * dpn ) / ( 1.0 - x0 * x0 );

    d4pn = ( 6.0 * x0 * d3pn + ( 6.0 - e1 ) * d2pn ) / ( 1.0 - x0 * x0 );

    u = pk / dpn;
    v = d2pn / dpn;
%
%  Initial approximation H:
%
    h = - u * ( 1.0 + 0.5 * u * ( v + u * ( v * v - d3pn / ( 3.0 * dpn ) ) ) );
%
%  Refine H using one step of Newton's method:
%
    p = pk + h * ( dpn + 0.5 * h * ( d2pn + h / 3.0 ...
      * ( d3pn + 0.25 * h * d4pn ) ) );

    dp = dpn + h * ( d2pn + 0.5 * h * ( d3pn + h * d4pn / 3.0 ) );

    h = h - p / dp;

    xtemp = x0 + h;

    x(mp1mi) = xtemp;

    fx = d1 - h * e1 * ( pk + 0.5 * h * ( dpn + h / 3.0 ...
      * ( d2pn + 0.25 * h * ( d3pn + 0.2 * h * d4pn ) ) ) );

    w(mp1mi) = 2.0 * ( 1.0 - xtemp * xtemp ) / fx / fx;

  end

  if ( mod ( order, 2 ) == 1 )
    x(1) = 0.0;
  end
%
%  Shift the data up.
%
  nmove = floor ( ( order + 1 ) / 2 );
  ncopy = order - nmove;

  for i = 1 : nmove
    iback = order + 1 - i;
    x(iback) = x(iback-ncopy);
    w(iback) = w(iback-ncopy);
  end
%
%  Reflect values for the negative abscissas.
%
  for i = 1 : order - nmove
    x(i) = - x(order+1-i);
    w(i) = w(order+1-i);
  end

  return
end
function pyramid_handle ( legendre_order, jacobi_order, filename )

%*****************************************************************************80
%
%% PYRAMID_HANDLE computes the requested pyramid rule and outputs it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LEGENDRE_ORDER, JACOBI_ORDER, the orders
%    of the component Legendre and Jacobi rules.
%
%    Input, string FILENAME, the rootname for the files,
%    write files 'file_w.txt' and 'file_x.txt', and 'file_r.txt', weights,
%    abscissas, and region.
%
  dim_num = 3;
%
%  Compute the factor rules.
%
  [ legendre_x, legendre_w ] = legendre_compute ( legendre_order );

  jacobi_alpha = 2.0;
  jacobi_beta = 0.0;

  [ jacobi_x, jacobi_w ] = jacobi_compute ( jacobi_order, jacobi_alpha, ...
    jacobi_beta );
%
%  Compute the pyramid rule.
%
  pyramid_order = legendre_order * legendre_order * jacobi_order;

  volume = 4.0 / 3.0;

  pyramid_w = zeros ( pyramid_order, 1 );
  pyramid_x = zeros ( dim_num, pyramid_order );
  
  l = 0;
  for k = 1 : jacobi_order
    xk = ( jacobi_x(k) + 1.0 ) / 2.0;
    wk = jacobi_w(k) / 2.0;
    for j = 1 : legendre_order
      xj = legendre_x(j);
      wj = legendre_w(j);
      for i = 1 : legendre_order
        xi = legendre_x(i);
        wi = legendre_w(i);
        l = l + 1;
        pyramid_w(l) = wi * wj * wk / 4.0 / volume;
        pyramid_x(1,l) = xi * ( 1.0 - xk );
        pyramid_x(2,l) = xj * ( 1.0 - xk );
        pyramid_x(3,l) =              xk;
      end
    end
  end

  pyramid_r(1:dim_num,1) = [ -1.0, -1.0, 0.0 ]';
  pyramid_r(1:dim_num,2) = [ +1.0, -1.0, 0.0 ]';
  pyramid_r(1:dim_num,3) = [ -1.0, +1.0, 0.0 ]';
  pyramid_r(1:dim_num,4) = [ +1.0, +1.0, 0.0 ]';
  pyramid_r(1:dim_num,5) = [  0.0,  0.0, 1.0 ]';
%
%  Write the rule to files.
%
  filename_w = strcat ( filename, '_w.txt' );
  filename_x = strcat ( filename, '_x.txt' );
  filename_r = strcat ( filename, '_r.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating quadrature files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "Root" file name is   "%s".\n', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weight file will be   "%s".\n', filename_w );
  fprintf ( 1, '  Abscissa file will be "%s".\n', filename_x );
  fprintf ( 1, '  Region file will be   "%s".\n', filename_r );

  r8mat_write ( filename_w, 1,       pyramid_order, pyramid_w' );
  r8mat_write ( filename_x, dim_num, pyramid_order, pyramid_x );
  r8mat_write ( filename_r, dim_num, 5,             pyramid_r );

  return
end
function value = r8_epsilon ( )

%*****************************************************************************80
%
%% R8_EPSILON returns the R8 roundoff unit.
%
%  Discussion:
%
%    The roundoff unit is a number R which is a power of 2 with the 
%    property that, to the precision of the computer's arithmetic,
%      1 < 1 + R
%    but 
%      1 = ( 1 + R / 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the roundoff unit.
%
  value = eps;

  return
end
function value = r8_gamma ( x )

%*****************************************************************************80
%
%% R8_GAMMA evaluates Gamma(X) for a real argument.
%
%  Discussion:
%
%    This routine calculates the gamma function for a real argument X.
%
%    Computation is based on an algorithm outlined in reference 1.
%    The program uses rational functions that approximate the gamma
%    function to at least 20 significant decimal digits.  Coefficients
%    for the approximation over the interval (1,2) are unpublished.
%    Those for the approximation for 12 <= X are from reference 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by William Cody, Laura Stoltz.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    William Cody,
%    An Overview of Software Development for Special Functions,
%    in Numerical Analysis Dundee, 1975,
%    edited by GA Watson,
%    Lecture Notes in Mathematics 506,
%    Springer, 1976.
%
%    John Hart, Ward Cheney, Charles Lawson, Hans Maehly,
%    Charles Mesztenyi, John Rice, Henry Thatcher,
%    Christoph Witzgall,
%    Computer Approximations,
%    Wiley, 1968,
%    LC: QA297.C64.
%
%  Parameters:
%
%    Input, real X, the argument of the function.
%
%    Output, real VALUE, the value of the function.
%

%
%  Coefficients for minimax approximation over (12, INF).
%
  c = [ ...
   -1.910444077728E-03, ...
    8.4171387781295E-04, ...
   -5.952379913043012E-04, ...
    7.93650793500350248E-04, ...
   -2.777777777777681622553E-03, ...
    8.333333333333333331554247E-02, ...
    5.7083835261E-03 ];
%
%  Mathematical constants
%
  one = 1.0;
  half = 0.5;
  twelve = 12.0;
  two = 2.0;
  zero = 0.0;
  sqrtpi = 0.9189385332046727417803297;
%
%  Machine dependent parameters
%
  xbig = 171.624E+00;
  xminin = 2.23E-308;
  eps = 2.22E-16;
  xinf = 1.79E+308;
%
%  Numerator and denominator coefficients for rational minimax
%  approximation over (1,2).
%
  p = [ ...
   -1.71618513886549492533811E+00, ...
    2.47656508055759199108314E+01, ...
   -3.79804256470945635097577E+02, ...
    6.29331155312818442661052E+02, ...
    8.66966202790413211295064E+02, ...
   -3.14512729688483675254357E+04, ...
   -3.61444134186911729807069E+04, ...
    6.64561438202405440627855E+04 ];

  q = [ ...
   -3.08402300119738975254353E+01, ...
    3.15350626979604161529144E+02, ...
   -1.01515636749021914166146E+03, ...
   -3.10777167157231109440444E+03, ...
    2.25381184209801510330112E+04, ...
    4.75584627752788110767815E+03, ...
   -1.34659959864969306392456E+05, ...
   -1.15132259675553483497211E+05 ];

  parity = 0;
  fact = one;
  n = 0;
  y = x;
%
%  Argument is negative.
%
  if ( y <= zero )

    y = - x;
    y1 = floor ( y );
    res = y - y1;

    if ( res ~= zero )

      if ( y1 ~= floor ( y1 * half ) * two )
        parity = 1;
      end

      fact = - pi / sin ( pi * res );
      y = y + one;

    else

      res = xinf;
      value = res;
      return

    end

  end
%
%  Argument is positive.
%
  if ( y < eps )
%
%  Argument < EPS.
%
    if ( xminin <= y )
      res = one / y;
    else
      res = xinf;
      value = res;
      return
    end

  elseif ( y < twelve )

    y1 = y;
%
%  0.0 < argument < 1.0.
%
    if ( y < one )

      z = y;
      y = y + one;
%
%  1.0 < argument < 12.0.
%  Reduce argument if necessary.
%
    else

      n = floor ( y ) - 1;
      y = y - n;
      z = y - one;

    end
%
%  Evaluate approximation for 1.0 < argument < 2.0.
%
    xnum = zero;
    xden = one;
    for i = 1 : 8
      xnum = ( xnum + p(i) ) * z;
      xden = xden * z + q(i);
    end

    res = xnum / xden + one;
%
%  Adjust result for case  0.0 < argument < 1.0.
%
    if ( y1 < y )

      res = res / y1;
%
%  Adjust result for case 2.0 < argument < 12.0.
%
    elseif ( y < y1 )

      for i = 1 : n
        res = res * y;
        y = y + one;
      end

    end

  else
%
%  Evaluate for 12.0 <= argument.
%
    if ( y <= xbig )

      ysq = y * y;
      sum = c(7);
      for i = 1 : 6
        sum = sum / ysq + c(i);
      end
      sum = sum / y - y + sqrtpi;
      sum = sum + ( y - half ) * log ( y );
      res = exp ( sum );

    else

      res = xinf;
      value = res;
      return

    end

  end
%
%  Final adjustments and return.
%
  if ( parity )
    res = - res;
  end

  if ( fact ~= one )
    res = fact / res;
  end

  value = res;

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end

  
