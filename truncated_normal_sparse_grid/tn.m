function [ x, w ] = tn ( n )

%*****************************************************************************80
%
%% TN computes a Truncated Norma quadrature rule of given order.
%
%  Discussion:
%
%    The rule is defined on (a,b).
%
%    The integral to approximate:
%
%      I(f) = Integral ( a < x < b ) f(x) rho(mu,sigma,a,b;x) dx
%
%    where MU, SIGMA, A, B are parameters and rho() is the
%    truncated normal weight function.
%
%    The quadrature rule:
%
%      Q(f) = Sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%    N must be odd and between 1 and 21.
%
%    Output, real X(N,1), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  persistent w01
  persistent w03
  persistent w05
  persistent w07
  persistent w09
  persistent w11
  persistent w13
  persistent w15
  persistent w17
  persistent w19
  persistent w21
  persistent x01
  persistent x03
  persistent x05
  persistent x07
  persistent x09
  persistent x11
  persistent x13
  persistent x15
  persistent x17
  persistent x19
  persistent x21

  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TN - Fatal error!\n' );
    fprintf ( 1, '  The value of N must be at least 1.\n' );
    fprintf ( 1, '  Input value of N = %d\n', n );
    error ( 'TN - Fatal error!' );
  end

  if ( 21 < n ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TN - Fatal error!\n' );
    fprintf ( 1, '  The value of N must be no more than 21.\n' );
    fprintf ( 1, '  Input value of N = %d\n', n );
    error ( 'TN - Fatal error!' );
  end
%
%  These parameters must be fixed for the calculation.
%
  if ( 0 )
    option = 3;
    mu = 100.0;
    sigma = 25.0;
    a =  50.0;
    b = 150.0;
  elseif ( 1 )
    option = 3;
    mu = 0.0;
    sigma = 1.0;
    a = -1.0;
    b = +1.0;
  end
%
%  Compute the points and weights.
%
  w = zeros ( n, 1 );
  x = zeros ( n, 1 );

  if ( n == 1 )
    if ( isempty ( x01 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 1.\n' );
      [ x01, w01 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x01;
    w = w01;
  elseif ( n == 3 )
    if ( isempty ( x03 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 3.\n' );
      [ x03, w03 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x03;
    w = w03;
  elseif ( n == 5 )
    if ( isempty ( x05 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 5.\n' );
      [ x05, w05 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x05;
    w = w05;
  elseif ( n == 7 )
    if ( isempty ( x07 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 7.\n' );
      [ x07, w07 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x07;
    w = w07;
  elseif ( n == 9 )
    if ( isempty ( x09 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 9.\n' );
      [ x09, w09 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x09;
    w = w09;
  elseif ( n == 11 )
    if ( isempty ( x11 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 11.\n' );
      [ x11, w11 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x11;
    w = w11;
  elseif ( n == 13 )
    if ( isempty ( x13 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 13.\n' );
      [ x13, w13 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x13;
    w = w13;
  elseif ( n == 15 )
    if ( isempty ( x15 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 15.\n' );
      [ x15, w15 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x15;
    w = w15;
  elseif ( n == 17 )
    if ( isempty ( x17 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 17.\n' );
      [ x17, w17 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x17;
    w = w17;
  elseif ( n == 19 )
    if ( isempty ( x19 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 19.\n' );
      [ x19, w19 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x19;
    w = w19;
  elseif ( n == 21 )
    if ( isempty ( x21 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TN - Generating TN rule of order 21.\n' );
      [ x21, w21 ] = tn_rule ( option, n, mu, sigma, a, b );
    end
    x = x21;
    w = w21;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TN - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N = %d\n', n );
    fprintf ( 1, '  Legal values are 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21.\n' );
    error ( 'TN - Fatal error!' );
  end
  
  return
end
function [ x, w ] = tn_rule ( option, n, mu, sigma, a, b )

%*****************************************************************************80
%
%% TN_RULE: points and weights of a truncated normal quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, 0/1/2/3 for none, lower, upper, double truncation.
%
%    Input, integer N, the number of points in the rule;
%
%    Input, real MU, the mean of the original normal distribution;
%
%    Input, real SIGMA, the standard deviation of the original normal
%    distribution,
%
%    Input, real A, the left endpoint (for options 1 or 3).
%
%    Input, real B, the right endpoint (for options 2 or 3).
%
%    Output, real X(N), W(N), the points and weights of the rule.
%
  if ( option < 0 || 3 < option )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TN_RULE - Fatal error!\n' );
    fprintf ( 1, '  0 <= OPTION <= 3 was required.' );
    error ( 'TN_RULE - Fatal error!' );
  end
%
%  Compute the moments.
%
  if ( option == 0 )
    moment = moments_normal ( 2 * n + 1, mu, sigma );
  elseif ( option == 1 )
    moment = moments_truncated_normal_a ( 2 * n + 1, mu, sigma, a );
  elseif ( option == 2 )
    moment = moments_truncated_normal_b ( 2 * n + 1, mu, sigma, b );
  elseif ( option == 3 )
    moment = moments_truncated_normal_ab ( 2 * n + 1, mu, sigma, a, b );
  end
%
%  Compute the rule.
%
  [ x, w ] = moment_method ( n, moment );

  return
end
function [ x, w ] = moment_method ( n, moment )

%*****************************************************************************80
%
%% MOMENT_METHOD computes a quadrature rule by the method of moments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, John Welsch,
%    Calculation of Gaussian Quadrature Rules,
%    Mathematics of Computation,
%    Volume 23, Number 106, April 1969, pages 221-230.
%
%  Parameters:
%
%    Input, integer N, the order of the quadrature rule.
%
%    Input, real MOMENT(2*N+1), moments 0 through 2*N.
%
%    Output, real X(N), W(N), the points and weights of the quadrature rule.
%
  debug = 0;

  if ( debug )
    r8vec_print ( 2 * n + 1, moment, '  Moments:' );
  end
%
%  Define the N+1 by N+1 Hankel matrix H(I,J) = moment(I+J).
%
  h = zeros ( n + 1, n + 1 );
  for i = 1 : n + 1
    for j = 1 : n + 1
      h(i,j) = moment(i+j-1);
    end
  end
%
%  Compute R, the upper triangular Cholesky factor of H.
%
  r = chol ( h );
%
%  Compute ALPHA and BETA from R, using Golub and Welsch's formula.
%
  alpha = zeros ( n, 1 );
  alpha(1) = r(1,2) / r(1,1);
  for i = 2 : n
    alpha(i) = r(i,i+1) / r(i,i) - r(i-1,i) / r(i-1,i-1);
  end

  beta = zeros ( n - 1, 1 );
  for i = 1 : n - 1
    beta(i) = r(i+1,i+1) / r(i,i);
  end
%
%  Compute the points and weights from the moments.
%
  jacobi = diag ( alpha, 0 ) + diag ( beta, -1 ) + diag ( beta, +1 );
%
%  Get the eigendecomposition of the Jacobi matrix.
%
  [ evec, eval ] = eig ( jacobi );

  x = diag ( eval );
  w = moment(1) * ( evec(1,:).^2 )';

  return
end
function w = moments_normal ( m, mu, sigma )

%*****************************************************************************80
%
%% MOMENTS_NORMAL returns moments of the standard Normal distribution.
%
%  Discussion:
%
%    pdf(x) = exp ( -((x-mu)/sigma)^2/2 ) / sigma / sqrt ( pi * 2 )
%    mu(k) = integral ( -oo < x < +oo ) x^k pdf(x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of moments desired.
%
%    Input, real MU, SIGMA, the mean and standard deviation.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  for k = 1 : m
    n = k - 1;
    t = 0.0;
    for j = 0 : floor ( n / 2 )
      t = t + r8_choose ( n, 2 * j ) * r8_factorial2 ( 2 * j - 1 ) ...
        * sigma ^ ( 2 * j ) * mu ^ ( n - 2 * j );
    end
    w(k) = t;
  end

  return
end

function w = moments_truncated_normal_ab ( m, mu, s, a, b )

%*****************************************************************************80
%
%% MOMENTS_TRUNCATED_NORMAL_AB: moments of the truncated normal distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of moments desired.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%    0 < S.
%
%    Input, real A, B, the lower and upper truncation limits.
%    A < B.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  for order = 0 : m - 1
    w(order+1) = truncated_normal_ab_moment ( order, mu, s, a, b );
  end

  return
end

function w = moments_truncated_normal_a ( m, mu, s, a )

%*****************************************************************************80
%
%% MOMENTS_TRUNCATED_NORMAL_A: moments of the lower truncated normal distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of moments desired.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%    0 < S.
%
%    Input, real A, the lower truncation limit.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  for order = 0 : m - 1
    w(order+1) = truncated_normal_a_moment ( order, mu, s, a );
  end

  return
end

function w = moments_truncated_normal_b ( m, mu, s, b )

%*****************************************************************************80
%
%% MOMENTS_TRUNCATED_NORMAL_B: moments of the upper truncated normal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of moments desired.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%    0 < S.
%
%    Input, real B, the upper truncation limit.
%
%    Output, real W(M), the weighted integrals of X^0 through X^(M-1).
%
  w = zeros ( m, 1 );

  for order = 0 : m - 1
    w(order+1) = truncated_normal_b_moment ( order, mu, s, b );
  end

  return
end
function cdf = normal_01_cdf ( x )

%*****************************************************************************80
%
%% NORMAL_01_CDF evaluates the Normal 01 CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A G Adams,
%    Areas Under the Normal Curve,
%    Algorithm 39,
%    Computer j.,
%    Volume 12, pages 197-198, 1969.
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Output, real CDF, the value of the CDF.
%
  a1 = 0.398942280444E+00;
  a2 = 0.399903438504E+00;
  a3 = 5.75885480458E+00;
  a4 = 29.8213557808E+00;
  a5 = 2.62433121679E+00;
  a6 = 48.6959930692E+00;
  a7 = 5.92885724438E+00;
  b0 = 0.398942280385E+00;
  b1 = 3.8052E-08;
  b2 = 1.00000615302E+00;
  b3 = 3.98064794E-04;
  b4 = 1.98615381364E+00;
  b5 = 0.151679116635E+00;
  b6 = 5.29330324926E+00;
  b7 = 4.8385912808E+00;
  b8 = 15.1508972451E+00;
  b9 = 0.742380924027E+00;
  b10 = 30.789933034E+00;
  b11 = 3.99019417011E+00;
%
%  |X| <= 1.28.
%
  if ( abs ( x ) <= 1.28 )

    y = 0.5 * x * x;

    q = 0.5 - abs ( x ) * ( a1 - a2 * y / ( y + a3 ...
      - a4 / ( y + a5 ...
      + a6 / ( y + a7 ) ) ) );
%
%  1.28 < |X| <= 12.7
%
  elseif ( abs ( x ) <= 12.7 )

    y = 0.5 * x * x;

    q = exp ( - y ) ...
      * b0  / ( abs ( x ) - b1 ...
      + b2  / ( abs ( x ) + b3 ...
      + b4  / ( abs ( x ) - b5 ...
      + b6  / ( abs ( x ) + b7 ...
      - b8  / ( abs ( x ) + b9 ...
      + b10 / ( abs ( x ) + b11 ) ) ) ) ) );
%
%  12.7 < |X|
%
  else

    q = 0.0;

  end
%
%  Take account of negative X.
%
  if ( x < 0.0 )
    cdf = q;
  else
    cdf = 1.0 - q;
  end

  return
end
function pdf = normal_01_pdf ( x )

%*****************************************************************************80
%
%% NORMAL_01_PDF evaluates the Normal 01 PDF.
%
%  Discussion:
%
%    The Normal 01 PDF is also called the "Standard Normal" PDF, or
%    the Normal PDF with 0 mean and variance 1.
%
%  Formula:
%
%    PDF(x) = exp ( - 0.5 * x^2 ) / sqrt ( 2 * pi )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Output, real PDF, the value of the PDF.
%
  pdf = exp ( -0.5 * x * x ) / sqrt ( 2.0 * pi );

  return
end
function value = r8_choose ( n, k )

%*****************************************************************************80
%
%% R8_CHOOSE computes the binomial coefficient C(N,K).
%
%  Discussion:
%
%    The value is calculated in such a way as to avoid overflow and
%    roundoff.  The calculation is done in integer arithmetic.
%
%    The formula used is:
%
%      C(N,K) = N! / ( K! * (N-K)! )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 March
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    ML Wolfson, HV Wright,
%    Algorithm 160:
%    Combinatorial of M Things Taken N at a Time,
%    Communications of the ACM,
%    Volume 6, Number 4, April 1963, page 161.
%
%  Parameters:
%
%    Input, integer N, K, are the values of N and K.
%
%    Output, real VALUE, the number of combinations of N
%    things taken K at a time.
%
  mn = min ( k, n - k );

  if ( mn < 0 )

    value = 0;

  elseif ( mn == 0 )

    value = 1;

  else

    mx = max ( k, n - k );
    value = mx + 1;

    for i = 2 : mn
      value = ( value * ( mx + i ) ) / i;
    end

  end

  return
end
function value = r8_factorial2 ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL2 computes the double factorial function.
%
%  Discussion:
%
%    FACTORIAL2( N ) = Product ( N * (N-2) * (N-4) * ... * 2 )  (N even)
%                    = Product ( N * (N-2) * (N-4) * ... * 1 )  (N odd)
%
%    N  Value
%    -  -----
%    1      1
%    2      2
%    3      3
%    4      8
%    5     15
%    6     48
%    7    105
%    8    384
%    9    945
%   10   3840
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the double factorial function.
%    If N is less than 1, VALUE is returned as 1.
%
%    Output, real VALUE, the value of N!!.
%
  value = 1;

  if ( n < 1 )
    return
  end

  while ( 1 < n )
    value = value * n;
    n = n - 2;
  end

  return
end
function value = r8_factorial ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL returns N factorial.
%
%  Discussion:
%
%    factorial ( N ) = Product ( 1 <= I <= N ) I
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the function.
%    0 <= N.
%
%    Output, real VALUE, the factorial of N.
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_FACTORIAL - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'R8_FACTORIAL - Fatal error!' );
  end

  value = 1.0;

  for i = 2 : n
    value = value * i;
  end

  return
end

function value = r8_huge ( )

%*****************************************************************************80
%
%% R8_HUGE returns a "huge" real number.
%
%  Discussion:
%
%    The value returned by this function is NOT required to be the
%    maximum representable R8.  This value varies from machine to machine,
%    from compiler to compiler, and may cause problems when being printed.
%    We simply want a "very large" but non-infinite number.
%
%    MATLAB provides a built-in symbolic constant "inf" that can be used
%    if a huge number is really what you want!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, a huge number.
%
  value = 1.0E+30;

  return
end
function value = r8_mop ( i )

%*****************************************************************************80
%
%% R8_MOP returns the I-th power of -1 as an R8 value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the power of -1.
%
%    Output, real R8_MOP, the I-th power of -1.
%
  if ( mod ( i, 2 ) == 0 )
    value = + 1.0;
  else
    value = - 1.0;
  end

  return
end
function moment = truncated_normal_ab_moment ( order, mu, s, a, b )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_AB_MOMENT returns a moment of the truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Phoebus Dhrymes,
%    Moments of Truncated Normal Distributions,
%    May 2005.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the moment.
%    0 <= ORDER.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%    0 < S.
%
%    Input, real A, B, the lower and upper truncation limits.
%    A < B.
%
%    Output, real MOMENT, the moment of the PDF.
%
  if ( order < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  ORDER < 0.\n' );
    error ( 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
  end

  if ( s <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  S <= 0.0.\n' );
    error ( 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
  end

  if ( b <= a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  B <= A.\n' );
    error ( 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
  end

  a_h = ( a - mu ) / s;
  a_pdf = normal_01_pdf ( a_h );
  a_cdf = normal_01_cdf ( a_h );

  if ( a_cdf == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  PDF/CDF ratio fails, because A_CDF is too small.\n' );
    fprintf ( 1, '  A_PDF = %g\n', a_pdf );
    fprintf ( 1, '  A_CDF = %g\n', a_cdf );
    error ( 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
  end

  b_h = ( b - mu ) / s;
  b_pdf = normal_01_pdf ( b_h );
  b_cdf = normal_01_cdf ( b_h );

  if ( b_cdf == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  PDF/CDF ratio fails, because B_CDF too small.\n' );
    fprintf ( 1, '  B_PDF = %g\n', b_pdf );
    fprintf ( 1, '  B_CDF = %g\n', b_cdf );
    error ( 'TRUNCATED_NORMAL_AB_MOMENT - Fatal error!\n' );
  end

  moment = 0.0;
  irm2 = 0.0;
  irm1 = 0.0;

  for r = 0 : order

    if ( r == 0 )
      ir = 1.0;
    elseif ( r == 1 )
      ir = - ( b_pdf - a_pdf ) / ( b_cdf - a_cdf );
    else
      ir = ( r - 1 ) * irm2 ...
        - ( b_h ^ ( r - 1 ) * b_pdf - a_h ^ ( r - 1 ) * a_pdf ) ...
        / ( b_cdf - a_cdf );
    end

    moment = moment + r8_choose ( order, r ) ...
      * mu ^ ( order - r ) ...
      * s ^ r * ir;

    irm2 = irm1;
    irm1 = ir;

  end

  return
end
function moment = truncated_normal_a_moment ( order, mu, s, a )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_MOMENT returns a moment of the lower truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the moment.
%    0 <= ORDER.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, the lower truncation limit.
%
%    Output, real MOMENT, the moment of the PDF.
%
  moment = r8_mop ( order ) ...
    * truncated_normal_b_moment ( order, -mu, s, -a );

  return
end
function moment = truncated_normal_b_moment ( order, mu, s, b )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_B_MOMENT returns a moment of the upper truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Phoebus Dhrymes,
%    Moments of Truncated Normal Distributions,
%    May 2005.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the moment.
%    0 <= ORDER.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real B, the upper truncation limit.
%
%    Output, real MOMENT, the moment of the PDF.
%
  if ( order < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  ORDER < 0.\n' );
    error ( 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
  end

  h = ( b - mu ) / s;
  pdf = normal_01_pdf ( h );
  cdf = normal_01_cdf ( h );

  if ( cdf == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  PDF/CDF ratio fails, because CDF too small.\n', cdf );
    fprintf ( 1, '  PDF = %g\n', pdf );
    fprintf ( 1, '  CDF = %g\n', cdf );
    error ( 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
  end

  f = pdf / cdf;

  moment = 0.0;
  irm2 = 0.0;
  irm1 = 0.0;

  for r = 0 : order

    if ( r == 0 )
      ir = 1.0;
    elseif ( r == 1 )
      ir = - f;
    else
      ir = - h ^ ( r - 1 ) * f + ( r - 1 ) * irm2;
    end

    moment = moment + r8_choose ( order, r ) ...
      * mu ^ ( order - r ) ...
      * s ^ r * ir;

    irm2 = irm1;
    irm1 = ir;

  end

  return
end
