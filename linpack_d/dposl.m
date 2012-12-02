function b = dposl ( a, lda, n, b )

%*****************************************************************************80
%
%% DPOSL solves a linear system factored by DPOCO or DPOFA.
%
%  Discussion:
%
%    To compute inverse(A) * C where C is a matrix with P columns:
%
%      call dpoco ( a, lda, n, rcond, z, info )
%
%      if ( rcond is not too small .and. info == 0 ) then
%        do j = 1, p
%          call dposl ( a, lda, n, c(1,j) )
%        end do
%      end if
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal.  Technically this indicates
%    singularity but it is usually caused by improper subroutine
%    arguments.  It will not occur if the subroutines are called
%    correctly and INFO == 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2005
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
%    Input, real A(LDA,N), the output from DPOCO or DPOFA.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, real B(N), the right hand side.
%
%    Output, real B(N), the solution.
%

%
%  Solve R' * Y = B.
%
  for k = 1 : n
    t = ddot ( k-1, a(1:k-1,k), 1, b(1:k-1), 1 );
    b(k) = ( b(k) - t ) / a(k,k);
  end
%
%  Solve R * X = Y.
%
  for k = n : -1 : 1
    b(k) = b(k) / a(k,k);
    t = -b(k);
    b(1:k-1) = daxpy ( k-1, t, a(1:k-1,k)', 1, b(1:k-1), 1 );
  end

  return
end
