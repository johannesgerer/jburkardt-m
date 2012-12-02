function linpack_bench_backslash ( n, lda )

%*****************************************************************************80
%
%% LINPACK_BENCH_BACKSLASH drives the "backslash" LINPACK benchmark program.
%
%  Discussion:
%
%    This version of the program uses the MATLAB "backslash" operator
%    to factor and solve the linear system.
%
%    The standard LINPACK benchmark uses N = 1000, LDA = N + 1.
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
  fprintf ( 1, 'LINPACK_BENCH_BACKSLASH\n' );
  fprintf ( 1, '  The LINPACK benchmark (using the MATLAB "backslash" operator).\n' );
  fprintf ( 1, '  Language: MATLAB\n' );
  fprintf ( 1, '  Datatype: Real Double Precision\n' );
  fprintf ( 1, '  Matrix order N        = %d\n', n );
  fprintf ( 1, '  Leading dimension LDA = %d\n', lda );

  a = r8_matgen ( n, n );

  a_max = max ( max ( a(1:n,1:n) ) );

  x_true(1:n,1) = 1.0;
  b(1:n,1) = a(1:n,1:n) * x_true(1:n,1);

  t1 = cputime;

  x = a \ b;

  t2 = cputime;
  time(1) = t2 - t1;
  time(2) = 0;

  total = time(1) + time(2);
%
%  Compute a residual to verify results.
%
  a = r8_matgen ( n, n );

  resid(1:n,1) = a(1:n,1:n) * x(1:n,1) - b(1:n,1);
  resid_max = max ( abs ( resid(1:n,1) ) );

  x_max = max ( abs ( x(1:n,1) ) );

  residn = resid_max /  ( n * a_max * x_max * eps );

  time(3) = total;
  time(4) = ops / ( 1000000 * total );
  time(5) = 2.0 / time(4);
  time(6) = total / cray;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     Norm. Resid      Resid           MACHEP' );
  fprintf ( 1, '         X(1)          X(N)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14e  %14e  %14e  %14f  %14f\n', ...
    residn, resid_max, eps, x(1,1), x(n,1) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Factor     Solve      Total     MFLOPS' );
  fprintf ( 1, '       Unit      Cray-Ratio\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %9f  %9f  %9f  %9f  %9f  %9f\n', time(1:6) );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINPACK_BENCH_BACKSLASH\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

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
