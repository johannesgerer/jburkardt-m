function [ b, info ] = strsl ( t, ldt, n, b, job )

%*****************************************************************************80
%
%% STRSL solves triangular linear systems.
%
%  Discussion:
%
%    This routine can solve T * X = B or T' * X = B where T is a triangular 
%    matrix of order N. 
%
%    Here T' denotes the transpose of the matrix T.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real T(LDT,N), the matrix of the system.  The zero
%    elements of the matrix are not referenced, and the corresponding 
%    elements of the array can be used to store other information.
%
%    Input, integer LDT, the leading dimension of the array T.
%
%    Input, integer N, the order of the matrix.
%
%    Input, real B(N,1), the right hand side vector.
%
%    Input, integer JOB, specifies what kind of system is to be solved:
%    00, solve T * X = B, T lower triangular,
%    01, solve T * X = B, T upper triangular,
%    10, solve T'* X = B, T lower triangular,
%    11, solve T'* X = B, T upper triangular.
%
%    Output, real B(N,1), the solution vector.
%
%    Output, integer INFO, singularity indicator.
%    0, the system is nonsingular.
%    nonzero, the index of the first zero diagonal element of T.
%

%
%  Check for zero diagonal elements.
%
  for j = 1 : n
    if ( t(j,j) == 0.0 )
      info = j;
      return
    end
  end

  info = 0;
%
%  Determine the task and go to it.
%
  if ( mod ( job, 10 ) == 0 )
    kase = 1;
  else
    kase = 2;
  end

  if ( floor ( mod ( job, 100 ) / 10 ) ~= 0 )
    kase = kase + 2;
  end
%
%  Solve T * X = B for T lower triangular.
%
  if ( kase == 1 )

    b(1,1) = b(1,1) / t(1,1);

    for j = 2 : n
      temp = -b(j-1,1);
      b(j:n,1) = saxpy ( n-j+1, temp, t(j:n,j-1), 1, b(j:n,1), 1 );
      b(j,1) = b(j,1) / t(j,j);
    end
%
%  Solve T * X = B for T upper triangular.
%
  elseif ( kase == 2 )

    b(n,1) = b(n,1) / t(n,n);

    for jj = 2 : n
      j = n - jj + 1;
      temp = -b(j+1,1);
      b(1:j,1) = saxpy ( j, temp, t(1:j,j+1), 1, b(1:j,1), 1 );
      b(j,1) = b(j,1) / t(j,j);
    end
%
%  Solve T' * X = B for T lower triangular.
%
  elseif ( kase == 3 )

    b(n,1) = b(n,1) / t(n,n);

    for j = n-1 : -1 : 1
      b(j,1) = b(j,1) - t(j+1:n,j)' * b(j+1:n,1);
      b(j,1) = b(j,1) / t(j,j);
    end
%
%  Solve T' * X = B for T upper triangular.
%
  elseif ( kase == 4 )

    b(1,1) = b(1,1) / t(1,1);

    for j = 2 : n
      b(j,1) = b(j,1) -  t(1:j-1,j)' * b(1:j-1,1);
      b(j,1) = b(j,1) / t(j,j);
    end

  end

  return
end
