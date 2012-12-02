function b = zppsl ( ap, n, b )

%*****************************************************************************80
%
%% ZPPSL solves a complex hermitian positive definite linear system.
%
%  Discussion:
%
%    The matrix is assumed to have been factored by ZPPCO or ZPPFA.
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal.  Technically this indicates
%    singularity but it is usually caused by improper subroutine
%    arguments.  It will not occur if the subroutines are called
%    correctly and INFO == 0.
%
%    To compute inverse(A) * C where C is a matrix with P columns:
%
%      call zppco(ap,n,rcond,z,info)
%
%      if (rcond is too small .or. info /= 0) then
%        error
%      end if
%
%      do j = 1, p
%        call zppsl(ap,n,c(1,j))
%      end do
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
%    Input, complex AP(N*(N+1)/2), the output from ZPPCO or ZPPFA.
%
%    Input, integer N, the order of the matrix.
%
%    Input, complex B(N), the right hand side.
%
%    Output, complex B(N), the solution.
%
  kk = 0;
  for k = 1 : n
    t = conj ( ap(kk+1:kk+k-1) ) * transpose ( b(1:k-1) );
    kk = kk + k;
    b(k) = ( b(k) - t ) / ap(kk);
  end

  for k = n : -1 : 1
    b(k) = b(k) / ap(kk);
    kk = kk - k;
    t = -b(k);
    b(1:k-1) = b(1:k-1) + t * ap(kk+1:kk+k-1);
  end

  return
end
