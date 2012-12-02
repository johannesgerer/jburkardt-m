function r = normal_dataset ( m, n, seed, mu, a )

%*****************************************************************************80
%
%% NORMAL_DATASET generates a multivariate normal dataset and writes it to a file.
%
%  Usage:
%
%    x = normal_dataset ( m, n, seed, mu, a )
%
%    where
%
%    * M the spatial dimension;
%    * N the number of points to generate;
%    * SEED the seed, a positive integer;
%    * MU is the mean vector of dimension M;
%    * A is the MxM positive definite symmetric variance-covariance matrix;
%    * R is the M by N array created.
%
%    The command creates an M by N multivariate normal dataset and writes 
%    it to the file "normal_M_N.txt".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate a multivariate normal random dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program requests input values from the user:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * M, the spatial dimension,\n' );
  fprintf ( 1, '  * N, the number of points to generate,\n' );
  fprintf ( 1, '  * SEED, a seed for the random number generator.\n' );
  fprintf ( 1, '  * MU, the mean vector of length M.\n' );
  fprintf ( 1, '  * A, the MxM positive definite symmetric variance-covariance matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program generates the data and writes it to the file\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    normal_M_N.txt\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where "M" and "N" are the numeric values.\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    m = input ( '  Enter the spatial dimension M: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
%
%  Get the number of points.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    n = input ( '  Enter the number of points N: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points N = %d\n', n );
%
%  Get the seed.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    seed = input ( '  Enter the seed: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The seed = %d\n', seed );
%
%  Get the mean vector.
%
  if ( nargin < 4 )
    fprintf ( 1, '\n' );
    mu(1:m) = input ( '  Enter the mean vector MU' );
  end

  r8vec_print ( m, mu, '  The mean vector MU:' )
%
%  Get the variance-covariance matrix A.
%
  if ( nargin < 5 )
    fprintf ( 1, '\n' );
    a(1:m,1:m) = input ( '  Enter the variance-covariance matrix A' );
  end

  r8mat_print ( m, m, a, '  The variance-covariance matrix A:' )
%
%  Compute the data.
%
  r = multinormal_sample ( m, n, a, mu, seed );
%
%  Write it to a file.
%
  output_filename = ...
    strcat ( 'normal_', num2str ( m ), '_', num2str ( n ), '.txt' );

  r8mat_write ( output_filename, m, n, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', ...
    output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ x, seed ] = multinormal_sample ( m, n, a, mu, seed )

%*****************************************************************************80
%
%% MULTINORMAL_SAMPLE samples a multivariate normal distribution.
%
%  Discussion:
%
%    The multivariate normal distribution for the M dimensional vector X
%    has the form:
%
%      pdf(X) = (2*pi*det(A))**(-M/2) * exp(-0.5*(X-MU)'*inverse(A)*(X-MU))
%
%    where MU is the mean vector, and A is a positive definite symmetric
%    matrix called the variance-covariance matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input, real A(M,M), the variance-covariance 
%    matrix.  A must be positive definite symmetric.
%
%    Input, real MU(M), the mean vector.
%
%    Input, integer SEED, the random number seed.
%
%    Output, real X(M), the points.
%
%    Output, integer SEED, the random number seed.
%

%
%  Compute the upper triangular Cholesky factor R of the variance-covariance
%  matrix.
%
  [ r, info ] = r8po_fa ( m, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MULTINORMAL_SAMPLE - Fatal error!\n' );
    fprintf ( 1, ...
      '  The variance-covariance matrix is not positive definite symmetric.\n' );
    error ( 'MULTINORMAL_SAMPLE - Fatal error!' );
  end
%
%  Get an MxN vector of samples of the 1D normal distribution with mean 0
%  and variance 1.  
%
  [ x(1:m*n), seed ] = r8vec_normal_01 ( m*n, seed );
%
%  Reshape the vector to an MxN matrix.
%
  x = reshape ( x, m, n );
%
%  Compute MU + R' * X.
%
  for j = 1 : n
    x(1:m,j) = mu(1:m)' + r(1:m,1:m)' * x(1:m,j);
  end

  return
end
function r8mat_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8MAT_PRINT prints an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8mat_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
function r8mat_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_PRINT_SOME prints out a portion of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for j2lo = max ( jlo, 1 ): incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j2lo : j2hi
      fprintf ( 1, '%7d       ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );

    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi

      fprintf ( 1, '%7d  ', i );
      
      for j = j2lo : j2hi
        fprintf ( 1, '%12g  ', a(i,j) );
      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
function [ r, info ] = r8po_fa ( n, a )

%*****************************************************************************80
%
%% R8PO_FA factors a R8PO matrix.
%
%  Discussion:
%
%    The R8PO storage format is appropriate for a symmetric positive definite 
%    matrix and its inverse.  (The Cholesky factor of a R8PO matrix is an
%    upper triangular matrix, so it will be in R8GE storage format.)
%
%    Only the diagonal and upper triangle of the square array are used.
%    This same storage scheme is used when the matrix is factored by
%    R8PO_FA, or inverted by R8PO_INVERSE.  For clarity, the lower triangle
%    is set to zero.
%
%    The positive definite symmetric matrix A has a Cholesky factorization
%    of the form:
%
%      A = R' * R
%
%    where R is an upper triangular matrix with positive elements on
%    its diagonal.  This routine overwrites the matrix A with its
%    factor R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix in R8PO storage.
%
%    Output, real R(N,N), the Cholesky factor R in R8GE storage.
%
%    Output, integer INFO, error flag.
%    0, normal return.
%    K, error condition.  The principal minor of order K is not
%    positive definite, and the factorization was not completed.
%
  r(1:n,1:n) = a(1:n,1:n);

  for j = 1 : n

    for k = 1 : j - 1
      t = 0.0;
      for i = 1 : k-1
        t = t + r(i,k) * r(i,j);
      end
      r(k,j) = ( r(k,j) - t ) / r(k,k);
    end

    t = 0.0;
    for i = 1 : j - 1
      t = t + r(i,j)^2;
    end

    s = r(j,j) - t;

    if ( s <= 0.0 )
      info = j;
      return;
    end

    r(j,j) = sqrt ( s );

  end

  info = 0;
%
%  Since the Cholesky factor is stored in R8GE format, be sure to
%  zero out the lower triangle.
%
  for i = 1 : n
    for j = 1 : i-1
      r(i,j) = 0.0;
    end
  end

  return
end
function [ x, seed ] = r8vec_normal_01 ( n, seed )

%*****************************************************************************80
%
%% R8VEC_NORMAL_01 returns a unit pseudonormal R8VEC.
%
%  Discussion:
%
%    The standard normal probability distribution function (PDF) has
%    mean 0 and standard deviation 1.
%
%    This routine can generate a vector of values on one call.  It
%    has the feature that it should provide the same results
%    in the same order no matter how we break up the task.
%
%    Before calling this routine, the user may call RANDOM_SEED
%    in order to set the seed of the random number generator.
%
%    The Box-Muller method is used, which is efficient, but
%    generates an even number of values each time.  On any call
%    to this routine, an even number of new values are generated.
%    Depending on the situation, one value may be left over.
%    In that case, it is saved for the next call.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values desired.  If N is negative,
%    then the code will flush its internal memory; in particular,
%    if there is a saved value to be used on the next call, it is
%    instead discarded.  This is useful if the user has reset the
%    random number seed, for instance.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
%  Local parameters:
%
%    Local, integer MADE, records the number of values that have
%    been computed.  On input with negative N, this value overwrites
%    the return value of N, so the user can get an accounting of
%    how much work has been done.
%
%    Local, real R(N+1), is used to store some uniform random values.
%    Its dimension is N+1, but really it is only needed to be the
%    smallest even number greater than or equal to N.
%
%    Local, integer SAVED, is 0 or 1 depending on whether there is a
%    single saved value left over from the previous call.
%
%    Local, integer X_LO_INDEX, X_HI_INDEX, records the range of entries of
%    X that we need to compute.  This starts off as 1:N, but is adjusted
%    if we have a saved value that can be immediately stored in X(1),
%    and so on.
%
%    Local, real Y, the value saved from the previous call, if
%    SAVED is 1.
%
  persistent made;
  persistent saved;
  persistent y;
%
%  I'd like to allow the user to reset the internal data.
%  But this won't work properly if we have a saved value Y.
%  I'm making a crock option that allows the user to signal
%  explicitly that any internal memory should be flushed,
%  by passing in a negative value for N.
%
  if ( n < 0 )
    made = 0;
    saved = 0;
    y = 0.0;
    x = [];
    return
  elseif ( n == 0 )
    x = [];
    return
  end
%
%  Record the range of X we need to fill in.
%
  x_lo_index = 1;
  x_hi_index = n;
%
%  Use up the old value, if we have it.
%
  if ( saved == 1 )
    x(1) = y;
    saved = 0;
    x_lo_index = 2;
  end
%
%  Maybe we don't need any more values.
%
  if ( x_hi_index - x_lo_index + 1 == 0 )
%
%  If we need just one new value, do that here to avoid null arrays.
%
  elseif ( x_hi_index - x_lo_index + 1 == 1 )

    [ r, seed ] = r8vec_uniform_01 ( 2, seed );

    x(x_hi_index) = ...
      sqrt ( -2.0 * log ( r(1) ) ) * cos ( 2.0 * pi * r(2) );
    y =      sqrt ( -2.0 * log ( r(1) ) ) * sin ( 2.0 * pi * r(2) );

    saved = 1;

    made = made + 2;
%
%  If we require an even number of values, that's easy.
%
  elseif ( mod ( x_hi_index - x_lo_index + 1, 2 ) == 0 )

    m = floor ( ( x_hi_index - x_lo_index + 1 ) / 2 );

    [ r, seed ] = r8vec_uniform_01 ( 2*m, seed );

    x(x_lo_index:2:x_hi_index-1) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-1) ) ) ...
      .* cos ( 2.0 * pi * r(2:2:2*m) );

    x(x_lo_index+1:2:x_hi_index) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-1) ) ) ...
      .* sin ( 2.0 * pi * r(2:2:2*m) );

    made = made + x_hi_index - x_lo_index + 1;
%
%  If we require an odd number of values, we generate an even number,
%  and handle the last pair specially, storing one in X(N), and
%  saving the other for later.
%
  else

    x_hi_index = x_hi_index - 1;

    m = floor ( ( x_hi_index - x_lo_index + 1 ) / 2 ) + 1;

    [ r, seed ] = r8vec_uniform_01 ( 2*m, seed );

    x(x_lo_index:2:x_hi_index-1) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-3) ) ) ...
      .* cos ( 2.0 * pi * r(2:2:2*m-2) );

    x(x_lo_index+1:2:x_hi_index) = ...
      sqrt ( -2.0 * log ( r(1:2:2*m-3) ) ) ...
      .* sin ( 2.0 * pi * r(2:2:2*m-2) );

    x(n) = sqrt ( -2.0 * log ( r(2*m-1) ) ) ...
      * cos ( 2.0 * pi * r(2*m) );

    y = sqrt ( -2.0 * log ( r(2*m-1) ) ) ...
      * sin ( 2.0 * pi * r(2*m) );

    saved = 1;

    made = made + x_hi_index - x_lo_index + 2;

  end

  return
end
function r8vec_print ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_PRINT prints a real vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d  %12f\n', i, a(i) );
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

  r = zeros ( n, 1 );
  
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

