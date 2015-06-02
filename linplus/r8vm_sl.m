function [ x, info ] = r8vm_sl ( n, a, b, job )

%*****************************************************************************80
%
%% R8VM_SL solves a R8VM linear system.
%
%  Discussion:
%
%    The R8VM storage format is used for an M by N Vandermonde matrix.
%    An M by N Vandermonde matrix is defined by the values in its second
%    row, which will be written here as X(1:N).  The matrix has a first 
%    row of 1's, a second row equal to X(1:N), a third row whose entries
%    are the squares of the X values, up to the M-th row whose entries
%    are the (M-1)th powers of the X values.  The matrix can be stored
%    compactly by listing just the values X(1:N).
%
%    Vandermonde systems are very close to singularity.  The singularity
%    gets worse as N increases, and as any pair of values defining
%    the matrix get close.  Even a system as small as N = 10 will
%    involve the 9th power of the defining values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Matrix Computations,
%    Third Edition,
%    Johns Hopkins, 1996.
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of the matrix.
%
%    Input, real A(N,1), the R8VM matrix.
%
%    Input, real B(N,1), the right hand side.
%
%    Input, integer JOB, specifies the system to solve.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Output, real X(N,1), the solution of the linear system.
%
%    Output, integer INFO.
%    0, no error.
%    nonzero, at least two of the values in A are equal.
%
  a = a(:);
  b = b(:);
%
%  Check for explicit singularity.
%
  info = 0;

  for j = 1 : n - 1
    for i = j + 1 : n
      if ( a(i,1) == a(j,1) )
        x = [];
        info = 1;
        return;
      end
    end
  end

  x(1:n,1) = b(1:n,1);

  if ( job == 0 )

    for j = 1 : n - 1
      for i = n : -1 : j + 1
        x(i,1) = x(i,1) - a(j,1) * x(i-1,1);
      end
    end

    for j = n - 1 : -1 : 1

      for i = j + 1 : n
        x(i,1) = x(i,1) / ( a(i,1) - a(i-j,1) );
      end

      for i = j : n - 1
        x(i,1) = x(i,1) - x(i+1,1);
      end

    end

  else

    for j = 1 : n - 1
      for i = n : -1 : j + 1
        x(i,1) = ( x(i,1) - x(i-1,1) ) / ( a(i,1) - a(i-j,1) );
      end
    end

    for j = n - 1 : -1 : 1
      for i = j : n - 1
        x(i,1) = x(i,1) - x(i+1,1) * a(j,1);
      end
    end

  end

  return
end
