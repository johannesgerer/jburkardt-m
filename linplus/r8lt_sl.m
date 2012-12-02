function x = r8lt_sl ( n, a, b, job )

%*****************************************************************************80
%
%% R8LT_SL solves a R8LT system.
%
%  Discussion:
%
%    The R8LT storage format is used for an M by N lower triangular matrix,
%    and sets aside storage even for the entries that must be zero.
%
%    No factorization of the lower triangular matrix is required.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the R8LT matrix.
%
%    Input, real B(N), the right hand side.
%    On output, the solution vector.
%
%    Input, integer JOB, is 0 to solve the untransposed system,
%    nonzero to solve the transposed system.
%
%    Output, real X(N), the solution vector.
%
  x(1:n) = b(1:n);

  if ( job == 0 )

    for j = 1 : n
      x(j) = x(j) / a(j,j);
      x(j+1:n) = x(j+1:n) - a(j+1:n,j)' * x(j);
    end

  else

    for j = n : -1 : 1
      x(j) = x(j) / a(j,j);
      x(1:j-1) = x(1:j-1) - a(j,1:j-1) * x(j);
    end

  end

  return
end
