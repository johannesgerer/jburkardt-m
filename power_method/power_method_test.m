function power_method_test ( )

%*****************************************************************************80
%
%% POWER_METHOD_TEST tests the POWER_METHOD library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_METHOD_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the POWER_METHOD library.\n' );

  power_method_test01 ( );
  power_method_test02 ( );
  power_method_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_METHOD_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function power_method_test01 ( )

%*****************************************************************************80
%
%% POWER_METHOD_TEST01 uses POWER_METHOD on the Fibonacci2 matrix.
%
%  Discussion:
%
%    This matrix, despite having a single dominant eigenvalue, will generally
%    converge only very slowly under the power method.  This has to do with
%    the fact that the matrix has only 3 eigenvectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 July 2008
%
%  Author:
%
%    John Burkardt
%
  n = 50;

  a = fibonacci2 ( n );

  seed = 123456789;

  [ x, seed ] = r8vec_uniform_01 ( n, seed );

  it_max = 300;
  tol = 0.000001;

  phi = ( 1.0 + sqrt ( 5.0 ) ) / 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_METHOD_TEST01\n' );
  fprintf ( 1, '  Use the power method on the Fibonacci2 matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N       = %d\n', n );
  fprintf ( 1, '  Maximum iterations   = %d\n', it_max );
  fprintf ( 1, '  Error tolerance      = %g\n', tol );

  ctime1 = cputime;

  [ x, lambda, it_num ] = power_method ( n, a, x, it_max, tol );

  ctime2 = cputime;
  ctime = ctime2 - ctime1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations = %d\n', it_num );
  fprintf ( 1, '  CPU time             = %f\n', ctime );
  fprintf ( 1, '  Estimated eigenvalue = %f\n', lambda );
  fprintf ( 1, '  Correct value        = %f\n', phi );
  fprintf ( 1, '  Error                = %e\n', abs ( lambda - phi ) );
%
%  X2 is the exact eigenvector.
%
  x2(1:n,1) = phi.^(0:n-1);
  x2 = x2 / norm ( x2 );
%
%  The sine of the angle between X and X2 is a measure of error.
%
  cos_x1x2 = x' * x2;
  sin_x1x2 = sqrt ( ( 1.0 - cos_x1x2 ) * ( 1.0 + cos_x1x2 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sine of angle between true and estimated vectors = %e\n', ...
    sin_x1x2 );

  return
end
function power_method_test02 ( )

%*****************************************************************************80
%
%% POWER_METHOD_TEST02 uses POWER_METHOD2 on the Fibonacci2 matrix.
%
%  Discussion:
%
%    This matrix, despite having a single dominant eigenvalue, will generally
%    converge only very slowly under the power method.  This has to do with
%    the fact that the matrix has only 3 eigenvectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 July 2008
%
%  Author:
%
%    John Burkardt
%
  n = 50;

  a = fibonacci2 ( n );

  seed = 123456789;

  [ x, seed ] = r8vec_uniform_01 ( n, seed );

  it_max = 300;
  tol = 0.000001;

  phi = ( 1.0 + sqrt ( 5.0 ) ) / 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_METHOD_TEST02\n' );
  fprintf ( 1, '  Use the power method2 on the Fibonacci2 matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N       = %d\n', n );
  fprintf ( 1, '  Maximum iterations   = %d\n', it_max );
  fprintf ( 1, '  Error tolerance      = %g\n', tol );

  ctime1 = cputime;

  [ lambda, v, it_num ] = power_method2 ( n, a, x, it_max, tol );

  ctime2 = cputime;
  ctime = ctime2 - ctime1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations = %d\n', it_num );
  fprintf ( 1, '  CPU time             = %f\n', ctime );
  fprintf ( 1, '  Estimated eigenvalue = %f  %f\n', real ( lambda ), imag ( lambda ) );
  fprintf ( 1, '  Correct value        = %f\n', phi );
  fprintf ( 1, '  Error                = %e\n', abs ( lambda - phi ) );

  return
end
function power_method_test03 ( )

%*****************************************************************************80
%
%% POWER_METHOD_TEST03 uses POWER_METHOD2 on the TRIS matrix.
%
%  Discussion:
%
%    This matrix, despite having a single dominant eigenvalue, will generally
%    converge only very slowly under the power method.  This has to do with
%    the fact that the matrix has only 3 eigenvectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 July 2008
%
%  Author:
%
%    John Burkardt
%
  n = 50;

  alpha = -1.0;
  beta = 10.0;
  gamma = 8.0;

  a = tris ( n, n, alpha, beta, gamma );

  seed = 123456789;

  [ x, seed ] = r8vec_uniform_01 ( n, seed );

  it_max = 4000;
  tol = 0.000001;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_METHOD_TEST03\n' );
  fprintf ( 1, '  Use the power method2 on the TRIS matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N       = %d\n', n );
  fprintf ( 1, '  Maximum iterations   = %d\n', it_max );
  fprintf ( 1, '  Error tolerance      = %g\n', tol );

  ctime1 = cputime;

  [ lambda, v, it_num ] = power_method2 ( n, a, x, it_max, tol );

  ctime2 = cputime;
  ctime = ctime2 - ctime1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations = %d\n', it_num );
  fprintf ( 1, '  CPU time             = %f\n', ctime );
  fprintf ( 1, '  Estimated eigenvalue = %f  %f\n', ...
    real ( lambda ), imag ( lambda ) );

  lambda_vec = tris_eigenvalues ( n, alpha, beta, gamma );

  lambda_max = lambda_vec(1);

  for i = 2 : n
    if ( abs ( lambda_max ) < abs ( lambda_vec(i) ) )
      lambda_max = lambda_vec(i);
    end
  end

  fprintf ( 1, '  Correct value        = %f  %f\n', ...
    real ( lambda_max ), imag ( lambda_max ) );
  fprintf ( 1, '  Error                = %e\n', abs ( lambda - lambda_max ) );

  return
end
function a = fibonacci2 ( n )

%*****************************************************************************80
%
%% FIBONACCI2 returns the Fibonacci2 matrix.
%
%  Example:
%
%    N = 5
%
%    0 1 0 0 0
%    1 1 0 0 0
%    0 1 1 0 0
%    0 0 1 1 0
%    0 0 0 1 1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    A is integral: int ( A ) = A.
%
%    A is a zero/one matrix.
%
%    If N = 1 then
%      det ( A ) = 0
%    else
%      det ( A ) = (-1)**(N-1)
%
%    If 1 < N, then A is unimodular.
%
%    For 2 <= N, A has the eigenvalues:
%
%      PHI   (once),
%      1     (N-2) times,
%      1-PHI (once).
%
%    When applied to a Fibonacci1 matrix B, the Fibonacci2 matrix
%    A produces the "next" Fibonacci1 matrix C = A*B.
%
%    Let PHI be the golden ratio (1+sqrt(5))/2.
%
%    For 2 <= N, the eigenvalues and eigenvectors are:
%
%    LAMBDA(1)     = PHI,     vector = (1,PHI,PHI^2,...PHI^(N-1));
%    LAMBDA(2:N-1) = 1        vector = (0,0,0,...,0,1);
%    LAMBDA(N)     = 1 - PHI. vector = ((-PHI)^(N-1),(-PHI)^(N-2),...,1)
%
%    Note that there is only one eigenvector corresponding to 1.
%    Hence, for 3 < N, the matrix is defective.  This fact means, 
%    for instance, that the convergence of the eigenvector in the power 
%    method will be very slow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 )

        if ( j == 2 )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end

      else

        if ( j == i-1 | j == i )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end

      end

    end
  end

  return
end
function [ r, seed ] = r8vec_uniform_01 ( n, seed )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_01 returns a unit pseudorandom R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real R(N), the vector of pseudorandom values.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8VEC_UNIFORM_01 - Fatal error!' );
  end

  for i = 1 : n

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + i4_huge;
    end

    r(i) = seed * 4.656612875E-10;

  end

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
function a = tris ( m, n, x, y, z )

%*****************************************************************************80
%
%% TRIS returns the tridiagonal scalar matrix.
%
%  Formula:
%
%    if ( J = I-1 )
%      A(I,J) = X
%    elseif ( J = I )
%      A(I,J) = Y
%    elseif ( J = I + 1 )
%      A(I,J) = Z
%    else
%      A(I,J) = 0
%
%  Example:
%
%    M = 5, N = 5, X = 1, Y = 2, Z = 3
%
%    2 3 0 0 0
%    1 2 3 0 0
%    0 1 2 3 0
%    0 0 1 2 3
%    0 0 0 1 2
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    A is Toeplitz: constant along diagonals.
%
%    If Y is not zero, then for A to be singular, it must be the case that
%
%      0.5 * Y / sqrt ( X * Z ) < 1
%
%    and
%
%      cos (K*PI/(N+1)) = - 0.5 * Y / sqrt ( X * Z ) for some 1 <= K <= N.
%
%    If Y is zero, then A is singular when N is odd, or if X or Z is zero.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A has eigenvalues
%
%      LAMBDA(I) = Y + 2 * sqrt(X*Z) * COS(I*PI/(N+1))
%
%    The eigenvalues will be complex if X * Z < 0.
%
%    If X = Z, the matrix is symmetric.
%
%    As long as X and Z are nonzero, the matrix is irreducible.
%
%    If X = Z = -1, and Y = 2, the matrix is a symmetric, positive
%    definite M matrix, the negative of the second difference matrix.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Todd,
%    Basic Numerical Mathematics,
%    Volume 2: Numerical Algebra,
%    Academic Press, 1978, page 155.
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Input, real X, Y, Z, the scalars that define A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( j == i - 1 )
        a(i,j) = x;
      elseif ( j == i )
        a(i,j) = y;
      elseif ( j == i + 1 )
        a(i,j) = z;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
function lambda = tris_eigenvalues ( n, x, y, z )

%*****************************************************************************80
%
%% TRIS_EIGENVALUES returns the eigenvalues of the tridiagonal scalar matrix.
%
%  Discussion:
%
%    The eigenvalues will be complex if X * Z < 0.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X, Y, Z, the scalars that define A.
%
%    Output, complex LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    angle = i * pi / ( n + 1 );
    lambda(i) = y + 2.0 * sqrt ( x * z ) * cos ( angle );
  end

  return
end
