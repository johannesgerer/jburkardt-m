function [ b, info ] = ctrsl ( t, ldt, n, b, job )

%*****************************************************************************80
%
%% CTRSL solves triangular systems T*X=B or Hermitian(T)*X=B.
%
%  Discussion:
%
%    Hermitian ( T ) denotes the conjugate transpose of the matrix T.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 May 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%
%  Parameters:
%
%    Input, complex T(LDT,N), the matrix of the system.  The zero
%    elements of the matrix are not referenced, and the corresponding
%    elements of the array can be used to store other information.
%
%    Input, integer LDT, the leading dimension of T.
%
%    Input, integer N, the order of the matrix.
%
%    Input, complex B(N), the right hand side.
%
%    Input, integer JOB, specifies what kind of system is to be solved.
%    00, solve T*X=B, T lower triangular,
%    01, solve T*X=B, T upper triangular,
%    10, solve hermitian(T)*X=B, T lower triangular,
%    11, solve hermitian(T)*X=B, T upper triangular.
%
%    Output, complex B(N), the solution.
%
%    Output, integer INFO.
%    0, the system is nonsingular.
%    K, the index of the first zero diagonal element of T.
%

%
%  Check for zero diagonal elements.
%
  for info = 1 : n
    if ( cabs1 ( t(info,info) ) == 0.0 )
      return
    end
  end

  info = 0;
%
%  Determine the task and go to it.
%
  kase = 1;

  if ( mod ( job, 10 ) ~= 0 )
    kase = 2;
  end

  if ( floor ( mod ( job, 100 ) / 10 ) ~= 0 )
    kase = kase + 2;
  end
%
%  Solve T * X = B for T lower triangular.
%
  if ( kase == 1 )

    b(1) = b(1) / t(1,1);

    for j = 2 : n
      temp = -b(j-1);
      b(j:n) = b(j:n) + temp * transpose ( t(j:n,j-1) );
      b(j) = b(j) / t(j,j);
    end
%
%  Solve T * X = B for T upper triangular.
%
  elseif ( kase == 2 )

    b(n) = b(n) / t(n,n);

    for jj = 2 : n
      j = n - jj + 1;
      temp = -b(j+1);
      b(1:j) = b(1:j) + temp * transpose ( t(1:j,j+1) );
      b(j) = b(j) / t(j,j);
    end
%
%  Solve hermitian(T) * X = B for T lower triangular.
%
  elseif ( kase == 3 )

    b(n) = b(n) / conj ( t(n,n) );

    for jj = 2 : n
      j = n - jj + 1;
      b(j) = b(j) - b(j+1:j+jj-1) * conj ( t(j+1:j+jj-1,j) );
      b(j) = b(j) / conj ( t(j,j) );
    end
%
%  Solve hermitian(T) * X = B for T upper triangular.
%
  elseif ( kase == 4 )

    b(1) = b(1) / conj ( t(1,1) );

    for j = 2 : n
      b(j) = b(j) - b(1:j-1) * conj ( t(1:j-1,j) );
      b(j) = b(j) / conj ( t(j,j) );
    end

  end

  return
end
