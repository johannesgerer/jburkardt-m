function svd_demo ( m, n, seed )

%*****************************************************************************80
%
%% SVD_DEMO demonstrates the SVD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modififed:
%
%    27 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    svd_demo ( m, n, seed )
%
%  Command Parameters:
%
%    Command parameter, integer M, N, the number of rows and columns
%    of the matrix.  If M and N are not provided on input, the user
%    is prompted to supply them.
%
%    Command parameter, integer SEED, the optional random number seed.
%    If SEED is not provided on input, a value is generated internally.
%
%  Local Parameters:
%
%    Local, real A(M,N), the matrix whose singular value
%    decomposition we are investigating.
%
%    Local, real S(M,N), the diagonal factor
%    int the singular value decomposition of A.
%
%    Local, integer SEED, a seed used to define the random number generator.
%
%    Output, real U(M,M), the first orthogonal factor
%    in the singular value decomposition of A.
%
%    Output, real V(N,N), the second orthogonal factor
%    in the singular value decomposition of A.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_DEMO\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Demonstrate the singular value decomposition (SVD)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A real MxN matrix A can be factored as:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A = U * S * V''\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    U = MxM orthogonal,\n' );
  fprintf ( 1, '    S = MxN zero except for diagonal,\n' );
  fprintf ( 1, '    V = NxN orthogonal.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The diagonal of S contains only nonnegative numbers\n' );
  fprintf ( 1, '  and these are arranged in descending order.\n' );
%
%  If at least one command line argument, it's M.
%
  if ( nargin < 1 )
    m = input ( 'Enter the value of M (M <= 10 is best):' );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix row order    M = %d\n', m );
%
%  If at least two command line argument, it's N.
%
  if ( nargin < 2 )
    n = input ( 'Enter the value of N (N <= 10 is best):' );
  end
  fprintf ( 1, '  Matrix column order N = %d\n', n );

  if ( nargin < 3 )
    seed = get_seed ( );
    fprintf ( 1, '  Random number SEED  = %d\n', seed )
    fprintf ( 1, '  (Chosen by the program).\n' )
  else
    fprintf ( 1, '  Random number SEED  = %d\n', seed )
    fprintf ( 1, '  (Chosen by the user).\n' )
  end
%
%  Generate the matrix A.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We choose a "random" matrix A, with integral\n' );
  fprintf ( 1, '  values between 0 and 10.\n' );

  [ a, seed ] = r8mat_uniform_01 ( m, n, seed );

  a(1:m,1:n) = round ( 10.0 * a(1:m,1:n) );

  r8mat_print ( m, n, a, '  The matrix A:' );
%
%  Get the SVD, as MATLAB computes it.
%
  [ u, s, v ] = svd ( a );
%
%  Print the SVD.
%
  r8mat_print ( m, m, u, '  The orthogonal factor U:' );
  r8mat_print ( m, n, s, '  The diagonal factor S:' );
  r8mat_print ( n, n, v, '  The orthogonal factor V:' );
%
%  Check that A = U * S * V'.
%
  svd_product_test ( m, n, a, u, s, v );
%
%  Compute the norm of the difference between A and the successive
%  sums of rank one approximants.
%
  rank_one_test ( m, n, a, u, s, v );
%
%  Actually print the sums of rank one approximants.
%
  rank_one_print_test ( m, n, a, u, s, v );
%
%  Compute the pseudoinverse.
%
  a_pseudo = pseudo_inverse ( m, n, u, s, v );

  r8mat_print ( n, m, a_pseudo, '  The pseudoinverse of A:' );
%
%  Test A*A+ = I+, A+*A = I+
%
  pseudo_product_test ( m, n, a, a_pseudo );
%
%  Demonstrate the use of the pseudoinverse for linear systems.
%
  seed = pseudo_linear_solve_test ( m, n, a, a_pseudo, seed );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_DEMO:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );
  
  return
end
function seed = get_seed ( )

%*****************************************************************************80
%
%% GET_SEED returns a seed for the random number generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer SEED, a random seed value.
%
  I_MAX = 2147483647;

  time_array = clock;

  hour = time_array(4);
  minute = time_array(5);
  second = time_array(6);

  temp = ( second + 60 * ( minute + 60 * hour ) ) / ( 60.0 * 60.0 * 24.0 );

  if ( temp <= 0.0 ) 
    temp = temp + 1.0;
  end

  if ( 1.0 < temp )
    temp = temp - 1.0;
  end

  seed = 1 + floor ( I_MAX * temp );

  return
end
function a_pseudo = pseudo_inverse ( m, n, u, s, v )

%*****************************************************************************80
%
%% PSEUDO_INVERSE computes the pseudoinverse.
%
%  Discussion:
%
%    Given the singular value decomposition of a real MxN matrix A:
%
%      A = U * S * V'
%
%    where 
%
%      U is MxM orthogonal,
%      S is MxN, and entirely zero except for the diagonal;
%      V is NxN orthogonal.
%
%    the pseudo inverse is the NxM matrix A+ with the form
%
%      A+ = V * S+ * U'
%
%    where 
%
%      S+ is the NxM matrix whose nonzero diagonal elements are
%      the inverses of the corresponding diagonal elements of S.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix A.
%
%    Input, real A(M,N), the matrix whose singular value
%    decomposition we are investigating.
%
%    Input, real U(M,M), S(M,N), V(N,N), the factors
%    that form the singular value decomposition of A.
%
%    Output, real A_PSEUDO(N,M), the pseudoinverse of A.
%
  sp(1:n,1:m) = 0.0;
  for i = 1 : min ( m, n )
    if ( s(i,i) ~= 0.0 )
      sp(i,i) = 1.0 / s(i,i);
    end
  end

  a_pseudo(1:n,1:m) = v(1:n,1:n) * sp(1:n,1:m) * u(1:m,1:m)';

  return
end
function seed = pseudo_linear_solve_test ( m, n, a, a_pseudo, seed )

%*****************************************************************************80
%
%% PSEUDO_LINEAR_SOLVE_TEST uses the pseudoinverse for linear systems.
%
%  Discussion:
%
%    Given an MxN matrix A, and its pseudoinverse A+:
%
%      "Solve" A  * x = b by x = A+  * b.
%
%      "Solve" A' * x = b by x = A+' * b.
%
%    When the system is overdetermined, the solution minimizes the
%    L2 norm of the residual.  
%
%    When the system is underdetermined, the solution
%    is the solution of minimum L2 norm.     
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix A.
%
%    Input, real A(M,N), the matrix whose singular value
%    decomposition we are investigating.
%
%    Input, real A_PSEUDO(N,M), the pseudo_inverse of A.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PSEUDO_LINEAR_SOLVE_TEST\n' );
%
%  A * x = b, b in range of A.
%
  [ xn1(1:n,1), seed ] = r8vec_uniform_01 ( n, seed );
  xn1(1:n,1) = round ( 10.0 * xn1(1:n,1) );
  bm(1:m,1) = a(1:m,1:n) * xn1(1:n,1);
  xn2(1:n,1) = a_pseudo(1:n,1:m) * bm(1:m,1);
  rm(1:m,1) = a(1:m,1:n) * xn2(1:n,1) - bm(1:m,1);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given:\n' );
  fprintf ( 1, '    b = A * x1\n' );
  fprintf ( 1, '  so that b is in the range of A, solve\n' );
  fprintf ( 1, '    A * x = b\n' );
  fprintf ( 1, '  using the pseudoinverse:\n' );
  fprintf ( 1, '    x2 = A+ * b.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Norm of x1 = %f\n', r8vec_norm_l2 ( n, xn1 ) );
  fprintf ( 1, '  Norm of x2 = %f\n', r8vec_norm_l2 ( n, xn2 ) );
  fprintf ( 1, '  Norm of residual = %f\n', r8vec_norm_l2 ( m, rm ) );
%
%  A * x = b, b not in range of A.
%
  if ( n < m )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  For N < M, most systems A*x=b will not be\n' );
    fprintf ( 1, '  exactly and uniquely solvable, except in the\n' );
    fprintf ( 1, '  least squares sense.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Here is an example:\n' );

    [ b8(1:m,1), seed ] = r8vec_uniform_01 ( m, seed );
    xn2(1:n,1) = a_pseudo(1:n,1:m) * bm(1:m,1);
    rm(1:m,1) = a(1:m,1:n) * xn2(1:n,1) - bm(1:m,1);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Given b is NOT in the range of A, solve\n' );
    fprintf ( 1, '    A * x = b\n' );
    fprintf ( 1, '  using the pseudoinverse:\n' );
    fprintf ( 1, '    x2 = A+ * b.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Norm of x2 = %f\n', r8vec_norm_l2 ( n, xn2 ) );
    fprintf ( 1, '  Norm of residual = %f\n', r8vec_norm_l2 ( m, rm ) );

  end
%
%  A' * x = b, b is in the range of A'.
%
  [ xm1(1:m,1), seed ] = r8vec_uniform_01 ( m, seed );
  xm1(1:m,1) = round ( 10.0 * xm1(1:m,1) );
  bn(1:n,1) = a(1:m,1:n)' * xm1(1:m,1);
  xm2(1:m,1) = a_pseudo(1:n,1:m)' * bn(1:n,1);
  rn(1:n,1) = a(1:m,1:n)' * xm2(1:m,1) - bn(1:n,1);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given:\n' );
  fprintf ( 1, '    b = A'' * x1\n' );
  fprintf ( 1, '  so that b is in the range of A'', solve\n' );
  fprintf ( 1, '    A'' * x = b\n' );
  fprintf ( 1, '  using the pseudoinverse:\n' );
  fprintf ( 1, '    x2 = A+'' * b.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Norm of x1 = %f\n', r8vec_norm_l2 ( m, xm1 ) );
  fprintf ( 1, '  Norm of x2 = %f\n', r8vec_norm_l2 ( m, xm2 ) );
  fprintf ( 1, '  Norm of residual = %f\n', r8vec_norm_l2 ( n, rn ) );
%
%  A' * x = b, b is not in the range of A'.
%
  if ( m < n )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  For M < N, most systems A''*x=b will not be\n' );
    fprintf ( 1, '  exactly and uniquely solvable, except in the\n' );
    fprintf ( 1, '  least squares sense.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Here is an example:\n' );

    [ bn(1:n,1), seed ] = r8vec_uniform_01 ( n, seed );
    xm2(1:m,1) = a_pseudo(1:n,1:m)' * bn(1:n,1);
    rn(1:n,1) = a(1:m,1:n)' * xm2(1:m,1) - bn(1:n,1);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Given b is NOT in the range of A'', solve\n' );
    fprintf ( 1, '    A'' * x1 = b\n' );
    fprintf ( 1, '  using the pseudoinverse:\n' );
    fprintf ( 1, '    x2 = A+'' * b.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Norm of x2 = %f\n', r8vec_norm_l2 ( m, xm2 ) );
    fprintf ( 1, '  Norm of residual = %f\n', r8vec_norm_l2 ( n, rn ) );

  end

  return
end
function pseudo_product_test ( m, n, a, a_pseudo )

%*****************************************************************************80
%
%% PSEUDO_PRODUCT_TEST examines the products A*A+ and A+*A.
%
%  Discussion:
%
%    Given an MxN matrix A, and its pseudoinverse A+, we must have
%
%      A+ * A * A+ = A+
%      A * A+ * A = A
%      ( A * A+ )' = A * A+ (MxM symmetry)
%      ( A+ * A )' = A+ * A (NxN symmetry)
%
%    If M <= N, A * A+ may be "interesting" (equal to or "like" the identity),
%    if N <= M, A+ * A may be "interesting" (equal to or "like" the identity).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix A.
%
%    Input, real A(M,N), the matrix whose singular value
%    decomposition we are investigating.
%
%    Input, real A_PSEUDO(N,M), the pseudo_inverse of A.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PSEUDO_PRODUCT_TEST\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The following relations MUST hold:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   A  * A+ * A  = A\n' );
  fprintf ( 1, '   A+ * A  * A+ = A+\n' );
  fprintf ( 1, ' ( A  * A+ ) is MxM symmetric;\n' );
  fprintf ( 1, ' ( A+ * A  ) is NxN symmetric\n' );

  bmn(1:m,1:n) = a(1:m,1:n) * a_pseudo(1:n,1:m) * a(1:m,1:n);

  dif1 = r8mat_dif_fro ( m, n, a, bmn );

  bnm(1:n,1:m) = a_pseudo(1:n,1:m) * a(1:m,1:n) * a_pseudo(1:n,1:m);

  dif2 = r8mat_dif_fro ( n, m, a_pseudo, bnm );

  bmm(1:m,1:m) = a(1:m,1:n) * a_pseudo(1:n,1:m);

  dif3 = r8mat_dif_fro ( m, m, bmm, transpose ( bmm ) );

  bnn(1:n,1:n) = a_pseudo(1:n,1:m) * a(1:m,1:n);

  dif4 = r8mat_dif_fro ( n, n, bnn, transpose ( bnn ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here are the Frobenius norms of the errors\n' );
  fprintf ( 1, '  in these relationships:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   A  * A+ * A  = A            %f\n', dif1 );
  fprintf ( 1, '   A+ * A  * A+ = A+           %f\n', dif2 );
  fprintf ( 1, ' ( A  * A+ ) is MxM symmetric; %f\n', dif3 );
  fprintf ( 1, ' ( A+ * A  ) is NxN symmetric; %f\n', dif4 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In some cases, the matrix A * A+\n' );
  fprintf ( 1, '  may be interesting (if M <= N, then\n' );
  fprintf ( 1, '  it MIGHT look like the identity.)\n' );
  fprintf ( 1, '\n' );

  r8mat_print ( m, m, bmm, '  A * A+:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In some cases, the matrix A+ * A\n' );
  fprintf ( 1, '  may be interesting (if N <= M, then\n' );
  fprintf ( 1, '  it MIGHT look like the identity.)\n' );
  fprintf ( 1, '\n' );

  r8mat_print ( n, n, bnn, '  A+ * A' );

  return
end
function dif = r8mat_dif_fro ( m, n, a, b )

%*****************************************************************************80
%
%% R8MAT_DIF_FRO returns the Frobenius norm of the difference of two R8MAT's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2006
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
%    Input, real A(M,N), B(M,N), the matrices for which we
%    are to compute the Frobenius norm of the difference.
%
%    Output, real DIF, the Frobenius norm of A-B.
%
  dif = sqrt ( sum ( sum ( ( a(1:m,1:n) - b(1:m,1:n) ).^2 ) ) );

  return
end
function norm = r8mat_norm_fro ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NORM_FRO returns the Frobenius norm of an R8MAT.
%
%  Discussion:
%
%    The Frobenius norm is defined as
%
%      R8MAT_NORM_FRO = sqrt (
%        sum ( 1 <= I <= M ) sum ( 1 <= j <= N ) A(I,J)^2 )
%
%    The matrix Frobenius norm is not derived from a vector norm, but
%    is compatible with the vector L2 norm, so that:
%
%      r8vec_norm_l2 ( A * x ) <= r8mat_norm_fro ( A ) * r8vec_norm_l2 ( x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2006
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
%    Input, real A(M,N), the matrix whose Frobenius
%    norm is desired.
%
%    Output, real NORM, the Frobenius norm of A.
%
  norm = sqrt ( sum ( sum ( a(1:m,1:n).^2 ) ) );

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
%    Input, string TITLE, a title.
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
%    16 May 2008
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

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for j2lo = max ( jlo, 1 ): incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;
    
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

        if ( a(i,j) == floor ( a(i,j) ) )
          fprintf ( 1, '%8d      ', a(i,j) );
        else
          fprintf ( 1, '%12g  ', a(i,j) );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
function [ r, seed ] = r8mat_uniform_01 ( m, n, seed )

%*****************************************************************************80
%
%% R8MAT_UNIFORM_01 returns a unit pseudorandom R8MAT.
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
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer SEED, the integer "seed" used to generate
%    the output random number.
%
%    Output, real R(M,N), an array of random values between 0 and 1.
%
%    Output, integer SEED, the updated seed.  This would
%    normally be used as the input seed on the next call.
%
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8MAT_UNIFORM_01 - Fatal error!' );
  end

  for j = 1 : n
    for i = 1 : m

      seed = floor ( seed );

      seed = mod ( seed, i4_huge );

      if ( seed < 0 ) 
        seed = seed + i4_huge;
      end 

      k = floor ( seed / 127773 );

      seed = 16807 * ( seed - k * 127773 ) - k * 2836;

      if ( seed < 0 )
        seed = seed + i4_huge;
      end

      r(i,j) = seed * 4.656612875E-10;

    end
  end

  return
end
function value = r8vec_norm_l2 ( n, a )

%*****************************************************************************80
%
%% R8VEC_NORM_L2 returns the L2 norm of an R8VEC.
%
%  Discussion:
%
%    The vector L2 norm is defined as:
%
%      value = sqrt ( sum ( 1 <= I <= N ) A(I)^2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, real A(N), the vector whose L2 norm is desired.
%
%    Output, real VALUE, the L2 norm of A.
%
  value = sqrt ( sum ( a(1:n).^2 ) );

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
function rank_one_print_test ( m, n, a, u, s, v )

%*****************************************************************************80
%
%% RANK_ONE_PRINT_TEST prints the sums of rank one matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix A.
%
%    Input, real A(M,N), the matrix whose singular value
%    decomposition we are investigating.
%
%    Input, real U(M,M), S(M,N), V(N,N), the factors
%    that form the singular value decomposition of A.
%
  a_norm = r8mat_norm_fro ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANK_ONE_PRINT_TEST:\n' );
  fprintf ( 1, '  Print the sums of R rank one matrices.\n' );

  for r = 0 : min ( m, n )

    usv(1:m,1:n) = u(1:m,1:r) * s(1:r,1:r) * v(1:n,1:r)';

    title = sprintf ( '  Rank R = %d\n', r );
    r8mat_print ( m, n, usv, title );

  end

  r8mat_print ( m, n, a, '  Original matrix A:' );

  return
end
function rank_one_test ( m, n, a, u, s, v )

%*****************************************************************************80
%
%% RANK_ONE_TEST compares A to the sum of rank one matrices.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix A.
%
%    Input, real A(M,N), the matrix whose singular value
%    decomposition we are investigating.
%
%    Input, real U(M,M), S(M,N), V(N,N), the factors
%    that form the singular value decomposition of A.
%
  a_norm = r8mat_norm_fro ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANK_ONE_TEST:\n' );
  fprintf ( 1, '  Compare A to the sum of R rank one matrices.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         R    Absolute      Relative\n' );
  fprintf ( 1, '              Error         Error\n' );
  fprintf ( 1, '\n' );

  for r = 0 : min ( m, n )

    usv(1:m,1:n) = u(1:m,1:r) * s(1:r,1:r) * v(1:n,1:r)';

    dif_norm = r8mat_dif_fro ( m, n, a, usv );

    fprintf ( 1, '  %8d  %14f  %14f\n', r, dif_norm, dif_norm / a_norm );

  end

  return
end
function svd_product_test ( m, n, a, u, s, v )

%*****************************************************************************80
%
%% SVD_PRODUCT_TEST tests that A = U * S * V'.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix A.
%
%    Input, real A(M,N), the matrix whose singular value
%    decomposition we are investigating.
%
%    Input, real U(M,M), S(M,N), V(N,N), the factors
%    that form the singular value decomposition of A.
%
  a_norm = r8mat_norm_fro ( m, n, a );

  usv(1:m,1:n) = u(1:m,1:m) * s(1:m,1:n) * v(1:n,1:n)';

  r8mat_print ( m, n, usv, '  The product U * S * V''' );

  dif_norm = r8mat_dif_fro ( m, n, a, usv );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius Norm of A, A_NORM = %f\n', a_norm );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ABSOLUTE ERROR for A = U*S*V'':\n' );
  fprintf ( 1, '  Frobenius norm of difference A-U*S*V'' = %f\n', dif_norm );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  RELATIVE ERROR for A = U*S*V'':\n' );
  fprintf ( 1, '  Ratio of DIF_NORM / A_NORM = %f\n', dif_norm / a_norm );

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
