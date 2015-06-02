function gen_laguerre_rule ( order, alpha, a, b, filename )

%*****************************************************************************80
%
%% GEN_LAGUERRE_RULE generates a Gauss-Laguerre rule.
%
%  Discussion:
%
%    This program computes a standard or exponentially weighted 
%    generalized Gauss-Laguerre quadrature rule and writes it to a file.
%
%    The user specifies:
%    * the ORDER (number of points) in the rule;
%    * ALPHA, the exponent of |X|;
%    * A, the left endpoint of integration;
%    * B, the scale factor in the exponential;
%    * FILENAME, the root name of the output files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEN_LAGUERRE_RULE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute a generalized Gauss-Laguerre rule for approximating\n' );
  fprintf ( 1, '    Integral ( a <= x < oo ) |x-a|^ALPHA exp(-B*(x-a)) f(x) dx\n' );
  fprintf ( 1, '  of order ORDER.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The user specifies ORDER, ALPHA, A, B, and FILENAME.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ORDER is the number of points.\n' );
  fprintf ( 1, '  ALPHA is the exponent of |X|.\n' );
  fprintf ( 1, '  A is the left endpoint (typically 0).\n' );
  fprintf ( 1, '  B is the exponential scale factor (typically 1).\n' );
  fprintf ( 1, '  FILENAME is used to generate 3 files:\n' );
  fprintf ( 1, '  * filename_w.txt - the weight file\n' );
  fprintf ( 1, '  * filename_x.txt - the abscissa file.\n' );
  fprintf ( 1, '  * filename_r.txt - the region file.\n' );
%
%  Initialize the parameters.
%
  beta = 0.0;
%
%  Get ORDER.
%
  if ( nargin < 1 )
    order = input ( '  Enter the rule order ORDER.' );
  elseif ( ischar ( order ) )
    order = str2num ( order );
  end
%
%  Get ALPHA.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ALPHA is the exponent of |X| in the weighting function.\n' );
    fprintf ( 1, '  ALPHA is a real number strictly greater than -1.\n' );
    fprintf ( 1, '\n' );
    alpha = input ( '  Enter the value of ALPHA.' );
  elseif ( ischar ( alpha ) )
    alpha = str2num ( alpha );
  end
%
%  Get A.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  A is the left endpoint, typically 0.\n' );
    fprintf ( 1, '\n' );
    a = input ( '  Enter the value of A.' );
  elseif ( ischar ( a ) )
    a = str2num ( a );
  end
%
%  Get B.
%
  if (  nargin < 4 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  B is the exponential scale factor, typically 1.\n' );
    fprintf ( 1, '\n' );
    b = input ( '  Enter the value of B.' );
  elseif ( ischar ( b ) )
    b = str2num ( b );
  end
%
%  Get FILENAME:
%
  if ( nargin < 5 )
    fprintf ( 1,  '\n' );
    fprintf ( 1,  '  FILENAME specifies the ''root name'' of the quadrature files).\n' );
    filename = input ( '  Enter FILENAME as a quoted string:' );
  end
%
%  Input summary.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ORDER = %d\n', order );
  fprintf ( 1, '  ALPHA = %f\n', alpha );
  fprintf ( 1, '  A = %f\n', a );
  fprintf ( 1, '  B = %f\n', b );
  fprintf ( 1, '  FILENAME = "%s".\n', filename );
%
%  Construct the rule.
%
  kind = 5;
  [ x, w ] = cgqf ( order, kind, alpha, beta, a, b );
%
%  Write the rule.
%
  r = zeros ( 2, 1 );
  r(1) = a;
  r(2) = r8_huge ( );
  rule_write ( order, filename, x, w, r );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEN_LAGUERRE_RULE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ t, wts ] = cdgqf ( nt, kind, alpha, beta )

%*****************************************************************************80
%
%% CDGQF computes a Gauss quadrature formula with default A, B and simple knots.
%
%  Discussion:
%
%    This routine computes all the knots and weights of a Gauss quadrature
%    formula with a classical weight function with default values for A and B,
%    and only simple knots.
%
%    There are no moments checks and no printing is done.
%
%    Use routine EIQFS to evaluate a quadrature computed by CGQFS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer NT, the number of knots.
%
%    Input, integer KIND, the rule.
%    1, Legendre,             (a,b)       1.0
%    2, Chebyshev,            (a,b)       ((b-x)*(x-a))^(-0.5)
%    3, Gegenbauer,           (a,b)       ((b-x)*(x-a))^alpha
%    4, Jacobi,               (a,b)       (b-x)^alpha*(x-a)^beta
%    5, Generalized Laguerre, (a,inf)     (x-a)^alpha*exp(-b*(x-a))
%    6, Generalized Hermite,  (-inf,inf)  |x-a|^alpha*exp(-b*(x-a)^2)
%    7, Exponential,          (a,b)       |x-(a+b)/2.0|^alpha
%    8, Rational,             (a,inf)     (x-a)^alpha*(x+b)^beta
%
%    Input, real ALPHA, the value of Alpha, if needed.
%
%    Input, real BETA, the value of Beta, if needed.
%
%    Output, real T(NT), the knots.
%
%    Output, real WTS(NT), the weights.
%
  parchk ( kind, 2 * nt, alpha, beta );
%
%  Get the Jacobi matrix and zero-th moment.
%
  [ aj, bj, zemu ] = class_matrix ( kind, nt, alpha, beta );
%
%  Compute the knots and weights.
%
  [ t, wts ] = sgqf ( nt, aj, bj, zemu );

  return
end
function [ t, wts ] = cgqf ( nt, kind, alpha, beta, a, b )

%*****************************************************************************80
%
%% CGQF computes knots and weights of a Gauss quadrature formula.
%
%  Discussion:
%
%    The user may specify the interval (A,B).
%
%    Only simple knots are produced.
%
%    The user may request that the routine print the knots and weights,
%    and perform a moment check.
%
%    Use routine EIQFS to evaluate this quadrature formula.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer NT, the number of knots.
%
%    Input, integer KIND, the rule.
%    1, Legendre,             (a,b)       1.0
%    2, Chebyshev Type 1,     (a,b)       ((b-x)*(x-a))^(-0.5)
%    3, Gegenbauer,           (a,b)       ((b-x)*(x-a))^alpha
%    4, Jacobi,               (a,b)       (b-x)^alpha*(x-a)^beta
%    5, Generalized Laguerre, (a,+oo)     (x-a)^alpha*exp(-b*(x-a))
%    6, Generalized Hermite,  (-oo,+oo)   |x-a|^alpha*exp(-b*(x-a)^2)
%    7, Exponential,          (a,b)       |x-(a+b)/2.0|^alpha
%    8, Rational,             (a,+oo)     (x-a)^alpha*(x+b)^beta
%    9, Chebyshev Type 2,     (a,b)       ((b-x)*(x-a))^(+0.5)
%
%    Input, real ALPHA, the value of Alpha, if needed.
%
%    Input, real BETA, the value of Beta, if needed.
%
%    Input, real A, B, the interval endpoints.
%
%    Output, real T(NT), the knots.
%
%    Output, real WTS(NT), the weights.
%

%
%  Compute the Gauss quadrature formula for default values of A and B.
%
  [ t, wts ] = cdgqf ( nt, kind, alpha, beta );
%
%  All knots have multiplicity = 1.
%
  mlt = zeros(nt,1);
  mlt(1:nt) = 1;
%
%  NDX(I) = I.
%
  ndx = ( 1 : nt );
%
%  Scale the quadrature rule.
%
  [ t, wts ] = scqf ( nt, t, mlt, wts, nt, ndx, kind, alpha, beta, a, b );

  return
end
function [ aj, bj, zemu ] = class_matrix ( kind, m, alpha, beta )

%*****************************************************************************80
%
%% CLASS_MATRIX computes the Jacobi matrix for a quadrature rule.
%
%  Discussion:
%
%    This routine computes the diagonal AJ and subdiagonal BJ
%    elements of the order M tridiagonal symmetric Jacobi matrix
%    associated with the polynomials orthogonal with respect to
%    the weight function specified by KIND.
%
%    For weight functions 1-7, M elements are defined in BJ even
%    though only M-1 are needed.  For weight function 8, BJ(M) is
%    set to zero.
%
%    The zero-th moment of the weight function is returned in ZEMU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer KIND, the rule.
%    1, Legendre,             (a,b)       1.0
%    2, Chebyshev,            (a,b)       ((b-x)*(x-a))^(-0.5)
%    3, Gegenbauer,           (a,b)       ((b-x)*(x-a))^alpha
%    4, Jacobi,               (a,b)       (b-x)^alpha*(x-a)^beta
%    5, Generalized Laguerre, (a,inf)     (x-a)^alpha*exp(-b*(x-a))
%    6, Generalized Hermite,  (-inf,inf)  |x-a|^alpha*exp(-b*(x-a)^2)
%    7, Exponential,          (a,b)       |x-(a+b)/2.0|^alpha
%    8, Rational,             (a,inf)     (x-a)^alpha*(x+b)^beta
%
%    Input, integer M, the order of the Jacobi matrix.
%
%    Input, real ALPHA, the value of Alpha, if needed.
%
%    Input, real BETA, the value of Beta, if needed.
%
%    Output, real AJ(M), BJ(M), the diagonal and subdiagonal
%    of the Jacobi matrix.
%
%    Output, real ZEMU, the zero-th moment.
%
  temp = eps;

  parchk ( kind, 2 * m - 1, alpha, beta );

  temp2 = 0.5;

  if ( 500.0 * temp < abs ( ( gamma ( temp2 ) )^2 - pi ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CLASS - Fatal error!\n' );
    fprintf ( 1, '  Gamma function does not match machine parameters.\n' );
    error ( 'CLASS - Fatal error!' );
  end

  bj = zeros(m,1);
  aj = zeros(m,1);

  if ( kind == 1 )

    ab = 0.0;

    zemu = 2.0 / ( ab + 1.0 );

    aj(1:m) = 0.0;

    for i = 1 : m
      abi = i + ab * mod ( i, 2 );
      abj = 2 * i + ab;
      bj(i) = abi * abi / ( abj * abj - 1.0 );
    end
    bj(1:m) =  sqrt ( bj(1:m) );

  elseif ( kind == 2 )

    zemu = pi;

    aj(1:m) = 0.0;

    bj(1) =  sqrt ( 0.5 );
    bj(2:m) = 0.5;

  elseif ( kind == 3 )

    ab = alpha * 2.0;
    zemu = 2.0^( ab + 1.0 ) * gamma ( alpha + 1.0 )^2 ...
      / gamma ( ab + 2.0 );

    aj(1:m) = 0.0;
    bj(1) = 1.0 / ( 2.0 * alpha + 3.0 );
    for i = 2 : m
      bj(i) = i * ( i + ab ) / ( 4.0 * ( i + alpha )^2 - 1.0 );
    end
    bj(1:m) =  sqrt ( bj(1:m) );

  elseif ( kind == 4 )

    ab = alpha + beta;
    abi = 2.0 + ab;
    zemu = 2.0^( ab + 1.0 ) * gamma ( alpha + 1.0 ) ...
      * gamma ( beta + 1.0 ) / gamma ( abi );
    aj(1) = ( beta - alpha ) / abi;
    bj(1) = 4.0 * ( 1.0 + alpha ) * ( 1.0 + beta ) ...
      / ( ( abi + 1.0 ) * abi * abi );
    a2b2 = beta * beta - alpha * alpha;

    for i = 2 : m
      abi = 2.0 * i + ab;
      aj(i) = a2b2 / ( ( abi - 2.0 ) * abi );
      abi = abi^2;
      bj(i) = 4.0 * i * ( i + alpha ) * ( i + beta ) * ( i + ab ) ...
        / ( ( abi - 1.0 ) * abi );
    end
    bj(1:m) =  sqrt ( bj(1:m) );

  elseif ( kind == 5 )

    zemu = gamma ( alpha + 1.0 );

    for i = 1 : m
      aj(i) = 2.0 * i - 1.0 + alpha;
      bj(i) = i * ( i + alpha );
    end
    bj(1:m) =  sqrt ( bj(1:m) );

  elseif ( kind == 6 )

    zemu = gamma ( ( alpha + 1.0 ) / 2.0 );

    aj(1:m) = 0.0;

    for i = 1 : m
      bj(i) = ( i + alpha * mod ( i, 2 ) ) / 2.0;
    end
    bj(1:m) =  sqrt ( bj(1:m) );

  elseif ( kind == 7 )

    ab = alpha;
    zemu = 2.0 / ( ab + 1.0 );

    aj(1:m) = 0.0;

    for i = 1 : m
      abi = i + ab * mod(i,2);
      abj = 2 * i + ab;
      bj(i) = abi * abi / ( abj * abj - 1.0 );
    end
    bj(1:m) =  sqrt ( bj(1:m) );

  elseif ( kind == 8 )

    ab = alpha + beta;
    zemu = gamma ( alpha + 1.0 ) * gamma ( - ( ab + 1.0 ) ) ...
      / gamma ( - beta );
    apone = alpha + 1.0;
    aba = ab * apone;
    aj(1) = - apone / ( ab + 2.0 );
    bj(1) = - aj(1) * ( beta + 1.0 ) / ( ab + 2.0 ) / ( ab + 3.0 );
    for i = 2 : m
      abti = ab + 2.0 * i;
      aj(i) = aba + 2.0 * ( ab + i ) * ( i - 1 );
      aj(i) = - aj(i) / abti / ( abti - 2.0 );
    end

    for i = 2 : m - 1
      abti = ab + 2.0 * i;
      bj(i) = i * ( alpha + i ) / ( abti - 1.0 ) * ( beta + i ) ...
        / ( abti^2 ) * ( ab + i ) / ( abti + 1.0 );
    end

    bj(m) = 0.0;
    bj(1:m) =  sqrt ( bj(1:m) );

  end

  return
end
function [ d, z ] = imtqlx ( n, d, e, z )

%*****************************************************************************80
%
%% IMTQLX diagonalizes a symmetric tridiagonal matrix.
%
%  Discussion:
%
%    This routine is a slightly modified version of the EISPACK routine to
%    perform the implicit QL algorithm on a symmetric tridiagonal matrix.
%
%    The authors thank the authors of EISPACK for permission to use this
%    routine.
%
%    It has been modified to produce the product Q' * Z, where Z is an input
%    vector and Q is the orthogonal matrix diagonalizing the input matrix.
%    The changes consist (essentialy) of applying the orthogonal transformations
%    directly to Z as they are generated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%    Roger Martin, James Wilkinson,
%    The Implicit QL Algorithm,
%    Numerische Mathematik,
%    Volume 12, Number 5, December 1968, pages 377-383.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real D(N), the diagonal entries of the matrix.
%
%    Input, real E(N), the subdiagonal entries of the
%    matrix, in entries E(1) through E(N-1). 
%
%    Input, real Z(N), a vector to be operated on.
%
%    Output, real D(N), the diagonal entries of the diagonalized matrix.
%
%    Output, real Z(N), the value of Q' * Z, where Q is the matrix that 
%    diagonalizes the input symmetric tridiagonal matrix.
%
  itn = 30;

  prec = eps;

  if ( n == 1 )
    return
  end

  e(n) = 0.0;

  for l = 1 : n

    j = 0;

    while ( 1 )

      for m = l : n

        if ( m == n )
          break
        end

        if ( abs ( e(m) ) <= prec * ( abs ( d(m) ) + abs ( d(m+1) ) ) )
          break
        end

      end

      p = d(l);

      if ( m == l )
        break
      end

      if ( j == itn )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'IMTQLX - Fatal error!\n' );
        fprintf ( 1, '  Iteration limit exceeded.\n' );
        error ( 'IMTQLX - Fatal error!' );
      end

      j = j + 1;
      g = ( d(l+1) - p ) / ( 2.0 * e(l) );
      r =  sqrt ( g * g + 1.0 );
      g = d(m) - p + e(l) / ( g + r8_sign ( g ) * abs ( r ) );
      s = 1.0;
      c = 1.0;
      p = 0.0;
      mml = m - l;

      for ii = 1 : mml

        i = m - ii;
        f = s * e(i);
        b = c * e(i);

        if ( abs ( f ) >= abs ( g ) )
          c = g / f;
          r =  sqrt ( c * c + 1.0 );
          e(i+1) = f * r;
          s = 1.0 / r;
          c = c * s;
        else
          s = f / g;
          r =  sqrt ( s * s + 1.0 );
          e(i+1) = g * r;
          c = 1.0 / r;
          s = s * c;
        end

        g = d(i+1) - p;
        r = ( d(i) - g ) * s + 2.0 * c * b;
        p = s * r;
        d(i+1) = g + p;
        g = c * r - b;
        f = z(i+1);
        z(i+1) = s * z(i) + c * f;
        z(i) = c * z(i) - s * f;

      end

      d(l) = d(l) - p;
      e(l) = g;
      e(m) = 0.0;

    end

  end

  for ii = 2 : n

     i = ii - 1;
     k = i;
     p = d(i);

     for j = ii : n
       if ( d(j) < p )
         k = j;
         p = d(j);
       end
     end

     if ( k ~= i )
       d(k) = d(i);
       d(i) = p;
       p = z(i);
       z(i) = z(k);
       z(k) = p;
     end

  end

  return
end
function parchk ( kind, m, alpha, beta )

%*****************************************************************************80
%
%% PARCHK checks parameters ALPHA and BETA for classical weight functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer KIND, the rule.
%    1, Legendre,             (a,b)       1.0
%    2, Chebyshev,            (a,b)       ((b-x)*(x-a))^(-0.5)
%    3, Gegenbauer,           (a,b)       ((b-x)*(x-a))^alpha
%    4, Jacobi,               (a,b)       (b-x)^alpha*(x-a)^beta
%    5, Generalized Laguerre, (a,inf)     (x-a)^alpha*exp(-b*(x-a))
%    6, Generalized Hermite,  (-inf,inf)  |x-a|^alpha*exp(-b*(x-a)^2)
%    7, Exponential,          (a,b)       |x-(a+b)/2.0|^alpha
%    8, Rational,             (a,inf)     (x-a)^alpha*(x+b)^beta
%
%    Input, integer M, the order of the highest moment to
%    be calculated.  This value is only needed when KIND = 8.
%
%    Input, real ALPHA, BETA, the parameters, if required
%    by the value of KIND.
%
  if ( kind <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARCHK - Fatal error!\n' );
    fprintf ( 1, '  KIND <= 0.\n' );
    error ( 'PARCHK - Fatal error!' );
  end
%
%  Check ALPHA for Gegenbauer, Jacobi, Laguerre, Hermite, Exponential.
%
  if ( 3 <= kind && alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARCHK - Fatal error!\n' );
    fprintf ( 1, '  3 <= KIND and ALPHA <= -1.\n' );
    error ( 'PARCHK - Fatal error!' );
  end
%
%  Check BETA for Jacobi.
%
  if ( kind == 4 && beta <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARCHK - Fatal error!\n' );
    fprintf ( 1, '  KIND == 4 and BETA <= -1.0.\n' );
    error ( 'PARCHK - Fatal error!' );
  end
%
%  Check ALPHA and BETA for rational.
%
  if ( kind == 8 )
    tmp = alpha + beta + m + 1.0;
    if ( 0.0 <= tmp || tmp <= beta )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PARCHK - Fatal error!\n' );
      fprintf ( 1, '  KIND == 8 but condition on ALPHA and BETA fails.\n' );
      error ( 'PARCHK - Fatal error!' );
    end
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
function value = r8_sign ( x )

%*****************************************************************************80
%
%% R8_SIGN returns the sign of an R8.
%
%  Discussion:
%
%    The value is +1 if the number is positive or zero, and it is -1 otherwise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose sign is desired.
%
%    Output, real VALUE, the sign of X.
%
  if ( 0 <= x )
    value = +1.0;
  else
    value = -1.0;
  end

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
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function rule_write ( order, filename, x, w, r )

%*****************************************************************************80
%
%% RULE_WRITE writes a quadrature rule to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, string FILENAME, specifies the output files.
%    write files 'filename_w.txt', 'filename_x.txt', 'filename_r.txt' defining 
%    weights, abscissas, and region.
%
%    Input, real X(ORDER), the abscissas.
%
%    Input, real W(ORDER), the weights.
%
%    Input, real R(2), the region.
%
  filename_x = strcat ( filename, '_x.txt' );
  filename_w = strcat ( filename, '_w.txt' );
  filename_r = strcat ( filename, '_r.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1,'  Creating quadrature files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "Root" file name is   "%s".\n', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weight file will be   "%s".\n', filename_w );
  fprintf ( 1, '  Abscissa file will be "%s".\n', filename_x );
  fprintf ( 1, '  Region file will be   "%s".\n', filename_r );

  r8mat_write ( filename_w, 1, order, w' );
  r8mat_write ( filename_x, 1, order, x' );
  r8mat_write ( filename_r, 1, 2,     r' );

  return
end
function [ t, wts ] = scqf ( nt, t, mlt, wts, nwts, ndx, kind, alpha, ...
  beta, a, b )

%*****************************************************************************80
%
%% SCQF scales a quadrature formula to a nonstandard interval.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer NT, the number of knots.
%
%    Input, real T(NT), the original knots.
%
%    Input, integer MLT(NT), the multiplicity of the knots.
%
%    Input, real WTS(NWTS), the weights.
%
%    Input, integer NWTS, the number of weights.
%
%    Input, integer NDX(NT), used to index the array WTS.
%    For more details see the comments in CAWIQ.
%
%    Input, integer KIND, the rule.
%    1, Legendre,             (a,b)       1.0
%    2, Chebyshev Type 1,     (a,b)       ((b-x)*(x-a))^(-0.5)
%    3, Gegenbauer,           (a,b)       ((b-x)*(x-a))^alpha
%    4, Jacobi,               (a,b)       (b-x)^alpha*(x-a)^beta
%    5, Generalized Laguerre, (a,+oo)     (x-a)^alpha*exp(-b*(x-a))
%    6, Generalized Hermite,  (-oo,+oo)   |x-a|^alpha*exp(-b*(x-a)^2)
%    7, Exponential,          (a,b)       |x-(a+b)/2.0|^alpha
%    8, Rational,             (a,+oo)     (x-a)^alpha*(x+b)^beta
%    9, Chebyshev Type 2,     (a,b)       ((b-x)*(x-a))^(+0.5)
%
%    Input, real ALPHA, the value of Alpha, if needed.
%
%    Input, real BETA, the value of Beta, if needed.
%
%    Input, real A, B, the interval endpoints.
%
%    Output, real T(NT), the scaled knots.
%
%    Output, real WTS(NWTS), the scaled weights.
%
  temp = eps;

  parchk ( kind, 1, alpha, beta )

  if ( kind == 1 )

    al = 0.0;
    be = 0.0;

    if ( abs ( b - a ) <= temp )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  |B - A| too small.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = ( a + b ) / 2.0;
    slp = ( b - a ) / 2.0;

  elseif ( kind == 2 )

    al = -0.5;
    be = -0.5;

    if ( abs ( b - a ) <= temp )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  |B - A| too small.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = ( a + b ) / 2.0;
    slp = ( b - a ) / 2.0;

  elseif ( kind == 3 )

    al = alpha;
    be = alpha;

    if ( abs ( b - a ) <= temp )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  |B - A| too small.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = ( a + b ) / 2.0;
    slp = ( b - a ) / 2.0;

  elseif ( kind == 4 )

    al = alpha;
    be = beta;

    if ( abs ( b - a ) <= temp )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  |B - A| too small.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = ( a + b ) / 2.0;
    slp = ( b - a ) / 2.0;

  elseif ( kind == 5 )

    if ( b <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  B <= 0.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = a;
    slp = 1.0 / b;
    al = alpha;
    be = 0.0;

  elseif ( kind == 6 )

    if ( b <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  B <= 0.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = a;
    slp = 1.0 / sqrt ( b );
    al = alpha;
    be = 0.0;

  elseif ( kind == 7 )

    al = alpha;
    be = 0.0;

    if ( abs ( b - a ) <= temp )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  |B - A| too small.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = ( a + b ) / 2.0;
    slp = ( b - a ) / 2.0;

  elseif ( kind == 8 )

    if ( a + b <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  A + B <= 0.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = a;
    slp = a + b;
    al = alpha;
    be = beta;

  elseif ( kind == 9 )

    al = 0.5;
    be = 0.5;

    if ( abs ( b - a ) <= temp )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SCQF - Fatal error!\n' );
      fprintf ( 1, '  |B - A| too small.\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      error ( 'SCQF - Fatal error!' );
    end

    shft = ( a + b ) / 2.0;
    slp = ( b - a ) / 2.0;

  end

  p = slp^( al + be + 1.0 );

  for k = 1 : nt

    t(k) = shft + slp * t(k);
    l = abs ( ndx(k) );

    if ( l ~= 0 )
      tmp = p;
      for i = l : l + mlt(k) - 1
        wts(i) = wts(i) * tmp;
        tmp = tmp * slp;
      end
    end

  end

  return
end
function [ t, wts ] = sgqf ( nt, aj, bj, zemu )

%*****************************************************************************80
%
%% SGQF computes knots and weights of a Gauss Quadrature formula.
%
%  Discussion:
%
%    This routine computes all the knots and weights of a Gauss quadrature
%    formula with simple knots from the Jacobi matrix and the zero-th
%    moment of the weight function, using the Golub-Welsch technique.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2010
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer NT, the number of knots.
%
%    Input, real AJ(NT), the diagonal of the Jacobi matrix.
%
%    Input, real BJ(NT), the subdiagonal of the Jacobi
%    matrix, in entries 1 through NT-1.  On output, BJ has been overwritten.
%
%    Input, real ZEMU, the zero-th moment of the weight function.
%
%    Output, real T(NT), the knots.
%
%    Output, real WTS(NT), the weights.
%

%
%  Exit if the zero-th moment is not positive.
%
  if ( zemu <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SGQF - Fatal error!\n' );
    fprintf ( 1, '  ZEMU <= 0.\n' );
    error ( 'SGQF - Fatal error!' );
  end
%
%  Set up vectors for IMTQLX.
%
  wts = zeros ( nt, 1 );

  wts(1) = sqrt ( zemu );
  wts(2:nt) = 0.0;
%
%  Diagonalize the Jacobi matrix.
%
  [ t, wts ] = imtqlx ( nt, aj, bj, wts );

  wts(1:nt) = wts(1:nt).^2;

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

  
