function b = r8ge_np_ml ( n, a_lu, x, job )

%*****************************************************************************80
%
%% R8GE_NP_ML computes A * x or x * A, for a matrix factored by R8GE_NP_FA.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    The matrix A is assumed to have been factored by R8GE_NP_FA.
%
%    R8GE_NP_ML allows the user to check that the solution of a linear
%    system is correct, without having to save an unfactored copy
%    of the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A_LU(N,N), the matrix factors computed by R8GE_NP_FA.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Input, integer JOB, determines the multiplication to
%    be carried out:
%    JOB = 0, compute A * x.
%    JOB nonzero, compute A' * X.
%
%    Output, real B(N), the result of the multiplication.
%
  b(1:n) = x(1:n);

  if ( job == 0 )
%
%  Compute U * X = Y:
%
    for i = 1 : n
      b(i) = a_lu(i,i:n) * b(i:n)';
    end
%
%  Compute L * Y = B:
%
    for j = n-1 : -1 : 1
      b(j+1:n) = b(j+1:n) - a_lu(j+1:n,j)' * b(j);
    end

  else
%
%  Compute L' * X = Y:
%
    for j = 1 : n-1
      b(j) = b(j) - b(j+1:n) * a_lu(j+1:n,j);
    end
%
%  Compute U' * Y = B:
%
    for j = n : -1 : 1
      b(j) = b(1:j) * a_lu(1:j,j);
    end

  end

  return
end
