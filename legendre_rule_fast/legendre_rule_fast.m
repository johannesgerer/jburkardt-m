function legendre_rule_fast ( n, a, b )

%*****************************************************************************80
%
%% LEGENDRE_RULE_FAST generates a Gauss-Legendre rule.
%
%  Discussion:
%
%    This program computes a standard Gauss-Legendre quadrature rule
%    and writes it to a file.
%
%  Usage:
%
%    legendre_rule_fast ( n, a, b )
%
%    where
%
%    * n is the number of points in the rule;
%    * a is the left endpoint;
%    * b is the right endpoint.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_RULE_FAST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute a Gauss-Legendre rule for approximating\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Integral ( a <= x <= b ) f(x) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  of order N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The computed rule is written to 3 files:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * leg_oN_w.txt - the weight file\n' );
  fprintf ( 1, '  * leg_oN_x.txt - the abscissa file.\n' );
  fprintf ( 1, '  * leg_oN_r.txt - the region file.\n' );
%
%  Get N.
%
  if ( 1 <= nargin )

  else
    n = input ( '  Enter the rule order N.' );
  end

  fprintf ( 1,  '\n' );
  fprintf ( 1,  '  The requested order N = %d\n', n );
%
%  Get A.
%
  if ( 2 <= nargin )

  else
    a = input ( '  Enter the left endpoint A.' );
  end

  fprintf ( 1,  '\n' );
  fprintf ( 1,  '  The left endpoint A = %f\n', a );
%
%  Get B.
%
  if ( 3 <= nargin )

  else
    b = input ( '  Enter the right endpoint B.' );
  end

  fprintf ( 1,  '\n' );
  fprintf ( 1,  '  The right endpoint B = %f\n', b );
%
%  Construct the rule and output it.
%
  legendre_handle ( n, a, b );
%
%  Terminate.
%
  fprintf ( 1,  '\n' );
  fprintf ( 1,  'LEGENDRE_RULE_FAST:\n' );
  fprintf ( 1,  '  Normal end of execution.\n' );
  fprintf ( 1,  '\n' );
  timestamp ( );

  return
end
function [ x, w ] = legendre_compute_glr ( n )

%*****************************************************************************80
%
%  Purpose:
%
%    LEGENDRE_COMPUTE_GLR: Legendre quadrature by the Glaser-Liu-Rokhlin method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 October 2009
%
%  Author:
%
%    Original C++ version by Nick Hale.
%    This C++ version by John Burkardt.
%
%  Reference:
%
%    Andreas Glaser, Xiangtao Liu, Vladimir Rokhlin, 
%    A fast algorithm for the calculation of the roots of special functions, 
%    SIAM Journal on Scientific Computing,
%    Volume 29, Number 4, pages 1420-1438, 2007.
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Get the value and derivative of the N-th Legendre polynomial at 0.
%
  [ p, pp ] = legendre_compute_glr0 ( n );
%
%  If N is odd, then zero is a root.
%
  x = zeros(n,1);
  w = zeros(n,1);

  if ( mod ( n, 2 ) == 1 )

    x((n+1)/2) = 0.0;
    w((n+1)/2) = pp;
%
%  If N is even, we have to compute a root.
%
  else

    [ x(n/2+1), w(n/2+1) ] = legendre_compute_glr2 ( p, n );

  end
%
%  Get the complete set of roots and derivatives.
%
  [ x, w ] = legendre_compute_glr1 ( n, x, w );
%
%  Compute the weights.
%
  w(1:n) = 2.0 ./ ( 1.0 - x(1:n) ) ./ ( 1.0 + x(1:n) ) ./ w(1:n) ./ w(1:n);
  w_sum = sum ( w(1:n) );
  w(1:n) = 2.0 * w(1:n) / w_sum;

  return;
end
function [ p, pp ] = legendre_compute_glr0 ( n )

%*****************************************************************************80
%
%  Purpose:
%
%    LEGENDRE_COMPUTE_GLR0 gets a starting value for the fast algorithm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 October 2009
%
%  Author:
%
%    Original MATLAB version by Nick Hale.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Andreas Glaser, Xiangtao Liu, Vladimir Rokhlin, 
%    A fast algorithm for the calculation of the roots of special functions, 
%    SIAM Journal on Scientific Computing,
%    Volume 29, Number 4, pages 1420-1438, 2007.
%
%  Parameters:
%
%    Input, integer N, the order of the Legendre polynomial.
%
%    Output, real P, PP, the value of the N-th Legendre polynomial
%    and its derivative at 0.
%
  pm2 = 0.0;
  pm1 = 1.0;
  ppm2 = 0.0;
  ppm1 = 0.0;

  for k = 0 : n - 1
    p = - k * pm2 / ( k + 1 );
    pp = ( ( 2 * k + 1 ) * pm1 - k * ppm2 ) / ( k + 1 );
    pm2 = pm1;
    pm1 = p;
    ppm2 = ppm1;
    ppm1 = pp;
  end

  return
end
function [ x, ders ] = legendre_compute_glr1 ( n, x, ders )

%*****************************************************************************80
%
%% LEGENDRE_COMPUTE_GLR1 gets the complete set of Legendre points and weights.
%
%  Discussion:
%
%    This routine requires that a starting estimate be provided for one
%    root and its derivative.  This information will be stored in entry
%    (N+1)/2 if N is odd, or N/2 if N is even, of ROOTS and DERS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 October 2009
%
%  Author:
%
%    Original MATLAB version by Nick Hale.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Andreas Glaser, Xiangtao Liu, Vladimir Rokhlin, 
%    A fast algorithm for the calculation of the roots of special functions, 
%    SIAM Journal on Scientific Computing,
%    Volume 29, Number 4, pages 1420-1438, 2007.
%
%  Parameters:
%
%    Input, integer N, the order of the Legendre polynomial.
%
%    Input/output, real X(N).  On input, a starting value
%    has been set in one entry.  On output, the roots of the Legendre 
%    polynomial.
%
%    Input/output, real DERS(N).  On input, a starting value
%    has been set in one entry.  On output, the derivatives of the Legendre 
%    polynomial at the zeros.
%
%  Local Parameters:
%
%    Local, integer M, the number of terms in the Taylor expansion.
%
  if ( mod ( n, 2 ) == 1 )
    N = ( n - 1 ) / 2; 
    s = 1;
  else 
    N = n / 2; 
    s = 0;
  end
%
%  Approximate roots via asymptotic formula.
%
  k = (n-2+s)/2:-1:1;
  theta = pi*(4*k-1)/(4*n+2);
  x(((n+4-s)/2):end) = (1-(n-1)/(8*n^3)-1/(384*n^4)*(39-28./sin(theta).^2)).*cos(theta);
%
%  Number of terms in Taylor expansion.
%
  m = 30; 
  u = zeros(1,m+1);
  up = zeros(1,m+1);

  for j = N+1:n-1
%
%  XP is the previous root.
%
    xp = x(j);
%    
%  Initial approximation via asymptotic formula.
%
    h = x(j+1) - xp;
%          
%  Scaling
%
    M = 1.0 / h;
%
%  Recurrence relation for Legendre polynomials (scaled).
%
    u(1) = 0;
    u(2) = ders(j) / M;
    up(1) = u(2);
    up(m+1) = 0;

    for k = 0 : m - 2
      u(k+3) = (2*xp*(k+1)/M*u(k+2)+(k-n*(n+1)/(k+1))*u(k+1)/M^2)./((1-xp.^2)*(k+2));
      up(k+2) = (k+2)*u(k+3)*M;
    end
%   
%  Flip for more accuracy in inner product calculation.
%
    u = u(m+1:-1:1);
    up = up(m+1:-1:1);
    
    hh = [ones(m,1) ; M];
    step = inf;
    l = 0;
%
%  Newton iteration.
%
    while ( eps < abs ( step ) && l < 10 )
      l = l + 1;
      step = (u*hh)/(up*hh);
      h = h - step;
      hh = [M;cumprod(M*h+zeros(m,1))]; % powers of h (This is the fastest way!)
      hh = hh(end:-1:1);
    end
%   
%  Update.
%
    x(j+1) = xp + h;
    ders(j+1) = up*hh;    
  end
%
% nodes are symmetric
%
  x(1:N+s) = -x(n:-1:N+1);
  ders(1:N+s) = ders(n:-1:N+1);

  return
end
function [x1 d1] = legendre_compute_glr02 ( Pn0, n )

%*****************************************************************************80
%
%% LEGENDRE_COMPUTE_GLR2 finds the first real root.
%
%  Discussion:
%
%    This routine is only called if N is even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 October 2009
%
%  Author:
%
%    Original MATLAB version by Nick Hale.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Andreas Glaser, Xiangtao Liu, Vladimir Rokhlin, 
%    A fast algorithm for the calculation of the roots of special functions, 
%    SIAM Journal on Scientific Computing,
%    Volume 29, Number 4, pages 1420-1438, 2007.
%
%  Parameters:
%
%    Input, real PN0, the value of the N-th Legendre polynomial
%    at 0.
%
%    Input, integer N, the order of the Legendre polynomial.
%
%    Output, real X1, the first real root.
%
%    Output, real D1, the derivative at X1.
%
%  Local Parameters:
%
%    Local, integer M, the number of terms in the Taylor expansion.
%

%
%  Approximate first root via asymptotic formula
%
  k = ceil ( n / 2 );
  theta = pi*(4*k-1)/(4*n+2);
  x1 = (1-(n-1)/(8*n^3)-1/(384*n^4)*(39-28./sin(theta).^2)).*cos(theta);
%
%  Number of terms in Taylor expansion.
%
  m = 30;
%
%  Scaling
%
  M = 1.0 / x1;
%   
%  recurrence relation for Legendre polynomials
%
  u = zeros(1,m+1);
  up = zeros(1,m+1);

  u(1) = Pn0;
  for k = 0 : 2 : m - 2
    u(k+3) = (k-n*(n+1)/(k+1))*u(k+1)/(M^2*(k+2)); 
    up(k+2) = (k+2)*u(k+3)*M;
  end
%
%  flip for more accuracy in inner product calculation
%
  u = u(m+1:-1:1);
  up = up(m+1:-1:1);

  x1k = ones(m+1,1);

  step = inf;
  l = 0;
%
%  Newton iteration
%
  while ( eps < abs ( step ) && l < 10 )
    l = l + 1;
    step = ( u * x1k ) / ( up * x1k );
    x1 = x1 - step;
    x1k = [1;cumprod(M*x1+zeros(m,1))];
    x1k = x1k(end:-1:1);
  end
  d1 = up * x1k;

  return
end
function legendre_handle ( n, a, b )

%*****************************************************************************80
%
%% LEGENDRE_HANDLE computes the requested Gauss-Legendre rule and outputs it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Input, real A, B, the left and right endpoints.
%
  r(1) = a;
  r(2) = b;
%
%  Compute the rule.
%
  tic;
  [ x, w ] = legendre_compute_glr ( n );
  t = toc;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computation required %f seconds.\n', t );
%
%  Rescale the rule.
%
  [ x, w ] = rescale ( n, a, b, x, w );
%
%  Write the data to files.
%
  output_x = sprintf ( 'leg_o%d_x.txt', n );
  output_w = sprintf ( 'leg_o%d_w.txt', n );
  output_r = sprintf ( 'leg_o%d_r.txt', n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weight file will be   "%s".\n', output_w );
  fprintf ( 1, '  Abscissa file will be "%s".\n', output_x );
  fprintf ( 1, '  Region file will be   "%s".\n', output_r );

  r8mat_write ( output_w, 1, n, w' );
  r8mat_write ( output_x, 1, n, x' );
  r8mat_write ( output_r, 1, 2, r );

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
function [ x, w ] = rescale ( n, a, b, x, w )

%*****************************************************************************80
%
%% RESCALE rescales a Legendre quadrature rule from [-1,+1] to [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 October 2009
%
%  Author:
%
%    Original MATLAB version by Nick Hale.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Andreas Glaser, Xiangtao Liu, Vladimir Rokhlin, 
%    A fast algorithm for the calculation of the roots of special functions, 
%    SIAM Journal on Scientific Computing,
%    Volume 29, Number 4, pages 1420-1438, 2007.
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real A, B, the endpoints of the new interval.
%
%    Input, real X(N), the abscissas for [-1,+1].
%
%    Input, real W(N), the weights for [-1,+1].
%
%    Output, real X(N), the abscissas for [A,B].
%
%    Output, real W(N), the weights for [A,B].
%
  x = 0.5 * ( ( x + 1.0 ) * b - ( x - 1.0 ) * a );

  w = 0.5 * ( b - a ) * w;

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
%    14 February 2003
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
