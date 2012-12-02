function b = r8ge_np_trm ( m, n, a_lu, x, job )

%*****************************************************************************80
%
%% R8GE_NP_TRM computes A * x or A' * x, for a matrix factored by R8GE_NP_TRF.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    The matrix A is assumed to have been factored by R8GE_NP_TRF.
%
%    R8GE_NP_TRM allows the user to check that the solution of a linear
%    system is correct, without having to save an unfactored copy
%    of the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anderson, Bai, Bischof, Demmel, Dongarra, Du Croz, Greenbaum,
%    Hammarling, McKenney, Ostrouchov, Sorensen,
%    LAPACK User's Guide,
%    Second Edition,
%    SIAM, 1995.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%    M and N must be positive.
%
%    Input, real A_LU(M,N), the M by N matrix factors computed by R8GE_NP_TRF.
%
%    Input, real X(*), the vector to be multiplied.
%    If JOB is 0, X must have dimension N.
%    If JOB is nonzero, X must have dimension M.
%
%    Output, real B(*), the result of the multiplication.
%    If JOB is 0, B must have dimension M.
%    If JOB is nonzero, B must have dimension N.
%
%    Input, integer JOB, determines the multiplication to
%    be carried out:
%    JOB = 0, compute A * x.
%    JOB nonzero, compute A' * X.
%
  if ( job == 0 )

    b(1:m) = 0.0E+00;
%
%  Compute U * X = Y:
%
    for i = 1 : m
      b(i) = a_lu(i,i:n) * x(i:n)';
    end
%
%  Compute L * Y = B:
%
    for i = min ( m, n+1 ) : -1 : 2
      b(i) = b(i) + a_lu(i,1:i-1) * b(1:i-1)';
    end

  else

    b(1:n) = 0.0E+00;
%
%  Compute L' * X = Y:
%
    for i = 1 : min ( m, n )
      b(i) = x(i) + a_lu(i+1:m,i)' * x(i+1:m)';
    end
%
%  Compute U' * Y = B:
%
    for i = min ( m, n ): -1 : 1
      b(i) = a_lu(1:i,i)' * b(1:i)';
    end

  end

  return
end
