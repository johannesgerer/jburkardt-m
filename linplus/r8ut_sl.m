function x = r8ut_sl ( n, a, b, job )

%*****************************************************************************80
%
%% R8UT_SL solves a R8UT linear system.
%
%  Discussion:
%
%    The R8UT storage format is used for an M by N upper triangular 
%    matrix.  The format stores all M*N entries, even those which are zero.
%
%    No factorization of the upper triangular matrix is required.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the R8UT matrix.
%
%    Input, real B(N), the right hand side.
%
%    Input, integer JOB, is 0 to solve the untransposed system,
%    nonzero to solve the transposed system.
%
%    Output, real X(N), the solution vector.
%
  x(1:n) = b(1:n);

  if ( job == 0 )

    for j = n : -1 : 1
      x(j) = x(j) / a(j,j);
      for i = 1 : j-1
        x(i) = x(i) - a(i,j) * x(j);
      end
    end

  else

    for j = 1 : n
      x(j) = x(j) / a(j,j);
      for i = j+1 : n
        x(i) = x(i) - x(j) * a(j,i);
      end
    end

  end

  return
end
