function x = r8ge_np_sl ( n, a_lu, b, job )

%*****************************************************************************80
%
%% R8GE_NP_SL solves a system factored by R8GE_NP_FA.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
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
%    Input, real A_LU(N,N), the matrix as factored by R8GE_NP_FA.
%
%    Input, real B(N), the right hand side vector B.
%
%    Input, integer JOB.
%    If JOB is zero, the routine will solve A * x = b.
%    If JOB is nonzero, the routine will solve A' * x = b.
%
%    Output, real X(N), the solution.
%
  x(1:n) = b(1:n);
%
%  Solve A * x = b.
%
  if ( job == 0 )

    for k = 1 : n-1
      x(k+1:n) = x(k+1:n) + a_lu(k+1:n,k)' * x(k);
    end

    for k = n : -1 : 1
      x(k) = x(k) / a_lu(k,k);
      x(1:k-1) = x(1:k-1) - a_lu(1:k-1,k)' * x(k);
    end
%
%  Solve A' * X = B.
%
  else

    for k = 1 : n
      x(k) = ( x(k) - x(1:k-1) * a_lu(1:k-1,k) ) / a_lu(k,k);
    end

    for k = n-1 : -1 : 1
      x(k) = x(k) + x(k+1:n) * a_lu(k+1:n,k);
    end

  end

  return
end
