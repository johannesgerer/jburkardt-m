function r = faure_dataset ( m, n, skip )

%*****************************************************************************80
%
%% FAURE_DATASET generates a Faure dataset and writes it to a file.
%
%  Discussion:
%
%    FAURE_DATASET generates a Faure dataset and writes it to a file.
%
%  Usage:
%
%    r = faure_dataset ( m, n, skip )
%
%    where
%
%    * M, the spatial dimension,
%    * N, the number of points to generate,
%    * SKIP, the number of initial values to skip.
%    * R is the M by N array created.
%
%    creates an M by N dataset and writes it to the
%    file "faure_M_N.txt".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FAURE_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate a Faure dataset.\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    m = input ( '  Enter the spatial dimension M: ' );
  else
    m = str2num ( m );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
%
%  Get the number of points.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    n = input ( '  Enter the number of points N: ' );
  else
    n = str2num ( n );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points N = %d\n', n );
%
%  Get the skip.
%
  base = prime_ge ( m );
  skip_suggest = base^4 - 1;

  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  SKIP is the number of initial values to skip.\n' );
    fprintf ( 1, '  0 is a common choice.\n' );
    fprintf ( 1, '  %d is a recommended choice\n', skip_suggest );
    skip = input ( '  Enter SKIP: ' );
  else
    skip = str2num ( skip );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SKIP = %d\n', skip );
%
%  Compute the data.
%
  r = faure_generate ( m, n, skip );
%
%  Write it to a file.
%
  output_filename = ...
    strcat ( 'faure_', num2str ( m ), '_', num2str ( n ), '.txt' );

  r8mat_write ( output_filename, m, n, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', ...
    output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FAURE_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function coef = binomial_table ( qs, m, n )

%*****************************************************************************80
%
%% BINOMIAL_TABLE computes a table of bionomial coefficients MOD QS.
%
%  Discussion:
%
%    Thanks to Michael Baudin for pointing out an error in a previous
%    version of this function, 07 December 2009.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer QS, the base for the MOD operation.
%
%    Input, integer M, N, the limits of the binomial table.
%
%    Output, integer COEF(0:M,0:N), the table of binomial coefficients
%    modulo QS.
%
  coef = zeros ( m+1, n+1 );

  coef(1:m+1,1) = 1;

  for j = 1 : min ( m, n )
    coef(j+1,j+1) = 1;
  end

  for j = 1 : n
    for i = j + 1 : m
      coef(i+1,j+1) = mod ( coef(i,j+1) + coef(i,j), qs );
    end
  end

  return
end
function [ quasi, seed ] = faure ( dim_num, seed )

%*****************************************************************************80
%
%% FAURE generates a new quasirandom Faure vector with each call.
%
%  Discussion:
%
%    This routine implements a method of Henri Faure for computing
%    quasirandom numbers.  It is a merging and adaptation of
%    the routines INFAUR and GOFAUR from ACM TOMS 647.
%
%    Thanks to Ernst Kloppenburg for suggesting the use of persistent
%    variables to improve the MATLAB implementation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Henri Faure,
%    Discrepance de suites associees a un systeme de numeration
%    (en dimension s),
%    Acta Arithmetica,
%    Volume 41, 1982, pages 337-351, especially page 342.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension, which should be
%    at least 2.
%
%    Input, integer SEED, the seed, which indicates the index of the
%    element of the sequence to be calculated.  If SEED is negative,
%    it is effectively replaced by a more suitable value.
%
%    Output, real QUASI(DIM_NUM), the next quasirandom vector.
%
%    Output, integer SEED, the appropriate value of SEED to be
%    used on the next call, if the next element of the sequence is desired.
%
  persistent coef;
  persistent hisum_save;
  persistent qs;
  persistent ytemp;
%
%  If the internal variable QS has never been set, then its SIZE is zero.
%
  if ( size ( qs ) == 0 || seed <= 0 )
    qs = prime_ge ( dim_num );
    hisum_save = -1;
  end
%
%  If SEED < 0, reset for recommended initial skip.
%
  if ( seed < 0 )
    hisum = 3;
    seed = qs^(hisum+1) - 1;
  elseif ( seed == 0 )
    hisum = 0;
  else

    hisum = i4_log_i4 ( seed, qs );

  end
%
%  Is it necessary to recompute the coefficient table?
%
  if ( hisum_save < hisum )

    hisum_save = hisum;

    coef = binomial_table ( qs, hisum, hisum );

  end
%
%  Find QUASI(1) using the method of Faure.
%
%  SEED has a representation in base QS of the form:
%
%    Sum ( 0 <= J <= HISUM ) YTEMP(J) * QS^J
%
%  We now compute the YTEMP(J)'s.
%
  ktemp = qs^( hisum + 1 );
  ltemp = seed;
  for i = hisum : -1 : 0
    ktemp = ktemp / qs;
    mtemp = mod ( ltemp, ktemp );
    ytemp(i+1) = ( ltemp - mtemp ) / ktemp;
    ltemp = mtemp;
  end
%
%  QUASI(K) has the form
%
%    Sum ( 0 <= J <= HISUM ) YTEMP(J) / QS**(J+1)
%
%  Compute QUASI(1) using nested multiplication.
%
  r = ytemp(hisum+1);
  for i = hisum - 1 : -1 : 0
    r = ytemp(i+1) + r / qs;
  end

  quasi = zeros ( dim_num, 1 );
  
  quasi(1) = r / qs;
%
%  Find components QUASI(2:DIM_NUM) using the Faure method.
%
  for k = 2 : dim_num

    quasi(k) = 0.0;
    r = 1.0 / qs;

    for j = 0 : hisum

      ztemp = ytemp(j+1:hisum+1) * coef(j+1:hisum+1,j+1);
%
%  New YTEMP(J) is:
%
%    Sum ( J <= I <= HISUM ) ( old ytemp(i) * binom(i,j) ) mod QS.
%
      ytemp(j+1) = mod ( ztemp, qs );
      quasi(k) = quasi(k) + ytemp(j+1) * r;
      r = r / qs;

    end

  end
%
%  Update SEED.
%
  seed = seed + 1;

  return
end
function r = faure_generate ( dim_num, n, skip )

%*****************************************************************************80
%
%% FAURE_GENERATE generates a Faure dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points to generate.
%
%    Input, integer SKIP, the number of initial points to skip.
%
%    Output, real  R(DIM_NUM,N), the points.
%
  r = zeros ( dim_num, n );

  seed = skip;

  for j = 1 : n
    [ r(1:dim_num,j), seed ] = faure ( dim_num, seed );
  end

  return
end
function value = i4_log_i4 ( i4, j4 )

%*****************************************************************************80
%
%% I4_LOG_I4 returns the logarithm of an I4 to an I4 base.
%
%  Discussion:
%
%    Only the integer part of the logarithm is returned.
%
%    If
%
%      K4 = I4_LOG_J4 ( I4, J4 ),
%
%    then we ordinarily have
%
%      J4^(K4-1) < I4 <= J4^K4.
%
%    The base J4 should be positive, and at least 2.  If J4 is negative,
%    a computation is made using the absolute value of J4.  If J4 is
%    -1, 0, or 1, the logarithm is returned as 0.
%
%    The number I4 should be positive and at least 2.  If I4 is negative,
%    a computation is made using the absolute value of I4.  If I4 is
%    -1, 0, or 1, then the logarithm is returned as 0.
%
%    An I4 is an integer value.
%
%  Example:
%
%    I4  J4  K4
%
%     0   3   0
%     1   3   0
%     2   3   0
%     3   3   1
%     4   3   1
%     8   3   1
%     9   3   2
%    10   3   2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I4, the number whose logarithm is desired.
%
%    Input, integer J4, the base of the logarithms.
%
%    Output, integer VALUE, the integer part of the logarithm
%    base abs(J4) of abs(I4).
%
  value = 0;

  i4_abs = abs ( i4 );

  if ( 2 <= i4_abs )

    j4_abs = abs ( j4 );

    if ( 2 <= j4_abs )

      while ( j4_abs <= i4_abs )
        i4_abs = floor ( i4_abs / j4_abs );
        value = value + 1;
      end

    end

  end

  return
end
function p = prime_ge ( n )

%*****************************************************************************80
%
%% PRIME_GE returns the smallest prime greater than or equal to N.
%
%
%  Discussion:
%
%    The MATLAB version of this program is made much simpler
%    because of the availability of the IS_PRIME logical function.
%
%  Example:
%
%    N     PRIME_GE
%
%    -10    2
%      1    2
%      2    2
%      3    3
%      4    5
%      5    5
%      6    7
%      7    7
%      8   11
%      9   11
%     10   11
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number to be bounded.
%
%    Output, integer P, the smallest prime number that is greater
%    than or equal to N.  
%
  p = max ( ceil ( n ), 2 );
  
  while ( ~ isprime ( p ) )
      p = p + 1;
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
