function linpack_bench ( n, lda )

%*****************************************************************************80
%
%% LINPACK_BENCH drives LINPACK benchmark program.
%
%  Modified:
%
%    22 May 2008
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.  If no value is supplied,
%    the default value of 1000 is used.
%
%    Input, integer LDA, the leading dimension of the matrix.  
%    If no value is supplied, the default value of N+1 is used.
%
  timestamp ( );

  if ( nargin < 1 ) 
    n = 1000;
  end

  if ( nargin < 2 )
    lda = n + 1;
  end

  cray = 0.056;
  ops = ( 2 * n * n * n ) / 3.0 + 2.0 * n * n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_BENCH\n' );
  fprintf ( 1, '  The LINPACK benchmark.\n' );
  fprintf ( 1, '  Language: MATLAB\n' );
  fprintf ( 1, '  Datatype: Real Double Precision\n' );
  fprintf ( 1, '  Matrix order N               = %d\n', n );
  fprintf ( 1, '  Leading matrix dimension LDA = %d\n', lda );

  a = r8_matgen ( lda, n );

  a_max = max ( max ( a(1:n,1:n) ) );

  x(1:n) = 1.0;
  b(1:n) = a(1:n,1:n) * x(1:n)';

  t1 = cputime;

  [ a, ipvt, info ] = dgefa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINPACK_BENCH - Fatal error!\n' );
    fprintf ( 1, '  The matrix A is apparently singular.\n' );
    fprintf ( 1, '  Abnormal end of execution.\n' );
    error ( 'LINPACK_BENCH - Fatal error!' );
  end

  t2 = cputime;
  time(1) = t2 - t1;

  t1 = cputime;

  job = 0;
  b = dgesl ( a, lda, n, ipvt, b, job );

  t2 = cputime;
  time(2) = t2 - t1;

  total = time(1) + time(2);
%
%  Compute a residual to verify results.
%
  a = r8_matgen ( lda, n );
  x(1:n) = 1.0;
  rhs(1:n) = a(1:n,1:n) * x(1:n)';

  resid(1:n) = ( a(1:n,1:n) * b(1:n)' - rhs(1:n)' )';

  resid_max = max ( abs ( resid(1:n) ) );
  b_max = max ( abs ( b(1:n) ) );

  residn = resid_max /  ( n * a_max * b_max * eps );

  time(3) = total;
  time(4) = ops / ( 1000000 * total );
  time(5) = 2.0 / time(4);
  time(6) = total / cray;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Norm. Resid      Resid           MACHEP' );
  fprintf ( 1, '         X(1)          X(N)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14f  %14f  %14f  %14f  %14f\n', ...
    residn, resid_max, eps, b(1), b(n) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Factor     Solve      Total     MFLOPS' );
  fprintf ( 1, '       Unit      Cray-Ratio\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %9f  %9f  %9f  %9f  %9f  %9f\n', time(1:6) );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_BENCH\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function y = daxpy ( n, sa, x, incx, y, incy )

%*****************************************************************************80
%
%% DAXPY adds a constant times one vector to another.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB translation by John Burkardt
%
%  Reference:
%
%    Lawson, Hanson, Kincaid, Krogh,
%    Basic Linear Algebra Subprograms for Fortran Usage,
%    Algorithm 539,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, September 1979, pages 308-323.
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real SA, the multiplier.
%
%    Input, real ( kind = 8 ) X(*), the vector to be scaled and added to Y.
%
%    Input, integer INCX, the increment between successive entries of X.
%
%    Input/output, real ( kind = 8 ) Y(*), the vector to which a 
%    multiple of X is to be added.
%
%    Input, integer INCY, the increment between successive entries of Y.
%
  if ( n <= 0 )

  elseif ( sa == 0.0 )

  elseif ( incx == 1 & incy == 1 )

    y(1:n) = y(1:n) + sa * x(1:n);

  else

    if ( 0 <= incx )
      ix = 1;
    else
      ix = ( - n + 1 ) * incx + 1;
    end

    if ( 0 <= incy )
      iy = 1;
    else
      iy = ( - n + 1 ) * incy + 1;
    end

    for i = 1 : n
      y(iy) = y(iy) + sa * x(ix);
      ix = ix + incx;
      iy = iy + incy;
    end

  end

  return
end
function [ a, ipvt, info ] = dgefa ( a, lda, n )

%*****************************************************************************80
%
%% DGEFA factors a real matrix.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB translation by John Burkardt
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real A(LDA,N), the matrix to be factored.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix A.
%
%    Output, real A(LDA,N), an upper triangular matrix and the multipliers used to obtain
%    it.  The factorization can be written A=L*U, where L is a product of
%    permutation and unit lower triangular matrices, and U is upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO, singularity indicator.
%    0, normal value.
%    K, if U(K,K) == 0.  This is not an error condition for this subroutine,
%    but it does indicate that DGESL or DGEDI will divide by zero if called.
%    Use RCOND in DGECO for a reliable indication of singularity.
%

%
%  Gaussian elimination with partial pivoting.
%
  info = 0;

  for k = 1 : n - 1
%
%  Find L = pivot index.
%
    l = idamax ( n-k+1, a(k:n,k), 1 ) + k - 1;
    ipvt(k) = l;
%
%  Zero pivot implies this column already triangularized.
%
    if ( a(l,k) == 0.0 )
      info = k;
      continue
    end
%
%  Interchange if necessary.
%
    if ( l ~= k )
      t      = a(l,k);
      a(l,k) = a(k,k);
      a(k,k) = t;
    end
%
%  Compute multipliers.
%
    a(k+1:n,k) = - a(k+1:n,k) / a(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n
      t = a(l,j);
      if ( l ~= k )
        a(l,j) = a(k,j);
        a(k,j) = t;
      end
      a(k+1:n,j) = daxpy ( n-k, t, a(k+1:n,k), 1, a(k+1:n,j), 1 );
    end

  end

  ipvt(n) = n;

  if ( a(n,n) == 0.0 )
    info = n;
  end

  return
end
function b = dgesl ( a, lda, n, ipvt, b, job )

%*****************************************************************************80
%
%% DGESL solves a real general linear system A * X = B.
%
%  Discussion:
%
%    DGESL can solve either of the systems A * X = B or A' * X = B.
%
%    The system matrix must have been factored by DGECO or DGEFA.
%
%    A division by zero will occur if the input factor contains a
%    zero on the diagonal.  Technically this indicates singularity
%    but it is often caused by improper arguments or improper
%    setting of LDA.  It will not occur if the subroutines are
%    called correctly and if DGECO has set 0.0 < RCOND 
%    or DGEFA has set INFO == 0.
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real A(LDA,N), the output from DGECO or DGEFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix A.
%
%    Input, integer IPVT(N), the pivot vector from DGECO or DGEFA.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, integer JOB.
%    0, solve A * X = B;
%    nonzero, solve A' * X = B.
%
%    Output, real B(N), the solution vector.
%

%
%  Solve A * X = B.
%
  if ( job == 0 )

    for k = 1 : n-1

      l = ipvt(k);
      t = b(l);

      if ( l ~= k )
        b(l) = b(k);
        b(k) = t;
      end

      b(k+1:n) = daxpy ( n-k, t, a(k+1:n,k)', 1, b(k+1:n), 1 );

    end

    for k = n : -1 : 1
      b(k) = b(k) / a(k,k);
      t = -b(k);
      b(1:k-1) = daxpy ( k-1, t, a(1:k-1,k)', 1, b(1:k-1), 1 );
    end

  else
%
%  Solve A' * X = B.
%
    for k = 1 : n
      t = a(1:k-1,k)' * b(1:k-1);
      b(k) = ( b(k) - t ) / a(k,k);
    end

    for k = n-1 : -1 : 1

      b(k) = b(k) + a(k+1:n,k)' * b(k+1:n);
      l = ipvt(k);

      if ( l ~= k )
        t    = b(l);
        b(l) = b(k);
        b(k) = t;
      end

    end

  end

  return
end
function value = idamax ( n, x, incx )

%*****************************************************************************80
%
%% IDAMAX finds the index of the vector element of maximum absolute value.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB translation by John Burkardt
%
%  Reference:
%
%    Lawson, Hanson, Kincaid, Krogh,
%    Basic Linear Algebra Subprograms for Fortran Usage,
%    Algorithm 539,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, September 1979, pages 308-323.
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real X(*), the vector to be examined.
%
%    Input, integer INCX, the increment between successive entries of SX.
%
%    Output, integer VALUE, the index of the element of SX of maximum
%    absolute value.
%
  if ( n <= 0 )

    value = 0;

  elseif ( n == 1 )

    value = 1;

  elseif ( incx == 1 )

    value = 1;
    samax = abs ( x(1) );

    for i = 2 : n

      if ( samax < abs ( x(i) ) )
        value = i;
        samax = abs ( x(i) );
      end

    end

  else

    if ( 0 <= incx )
      ix = 1;
    else
      ix = ( - n + 1 ) * incx + 1;
    end

    value = 1;
    samax = abs ( x(ix) );

    ix = ix + incx;

    for i = 2 : n
      if ( samax < abs ( x(ix) ) )
        value = i;
        samax = abs ( x(ix) );
      end
      ix = ix + incx;
    end

  end

  return
end
function a = r8_matgen ( lda, n )

%*****************************************************************************80
%
%% R8_MATGEN generates a random matrix.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer LDA, the leading dimension of the matrix.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(LDA,N), the N by N matrix.
%
  a = zeros ( lda, n );

  init(1:4) = [ 1, 2, 3, 1325 ];

  for j = 1 : n
     for i = 1 : n
       [ a(i,j), init ] = r8_random ( init );
    end
  end
  
  a(1:n,1:n) = a(1:n,1:n) - 0.5;

  return
end
function [ value, seed ] = r8_random ( seed )

%*****************************************************************************80
%
%% R8_RANDOM returns a uniformly distributed random number between 0 and 1.
%
%  Discussion:
%
%    This routine uses a multiplicative congruential method with modulus
%    2**48 and multiplier 33952834046453.
%
%    48-bit integers are stored in 4 integer array elements with 12 bits
%    per element.  Hence the routine is portable across machines with
%    integers of 32 bits or more.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    George Fishman,
%    Multiplicative congruential random number generators with modulus 2**b: 
%    an exhaustive analysis for b = 32 and a partial analysis for b = 48, 
%    Mathematics of Computation,
%    Volume 189, 1990, pages 331-344.
%
%  Parameters:
%
%    Input, integer SEED(4), the seed of the random number generator; the array
%    elements must be between 0 and 4095, and SEED(4) must be odd.
%
%    Output, real VALUE, the next pseudorandom number.
%
%    Output, integer SEED(4), the updated seed.
%
  ipw2 = 4096;
  m1 = 494;
  m2 = 322;
  m3 = 2508;
  m4 = 2549;
  one = 1.0;
  r = 1.0 / 4096.0;
%
%  Multiply the seed by the multiplier modulo 2**48.
%
  it4 = seed(4) * m4;
  it3 = floor ( it4 / ipw2 );
  it4 = it4 - ipw2 * it3;
  it3 = it3 + seed(3) * m4 + seed(4) * m3;
  it2 = floor ( it3 / ipw2 );
  it3 = it3 - ipw2 * it2;
  it2 = it2 + seed(2) * m4 + seed(3) * m3 + seed(4) * m2;
  it1 = floor ( it2 / ipw2 );
  it2 = it2 - ipw2 * it1;
  it1 = it1 + seed(1) * m4 + seed(2) * m3 + seed(3) * m2 + seed(4) * m1;
  it1 = mod ( it1, ipw2 );
%
%  Return updated seed
%
  seed(1) = it1;
  seed(2) = it2;
  seed(3) = it3;
  seed(4) = it4;
%
%  Convert 48-bit integer to a real number in the interval (0,1)
%
  value = ...
      r * ( it1  ...
    + r * ( it2  ...
    + r * ( it3  ...
    + r * ( it4 ) ) ) );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
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
