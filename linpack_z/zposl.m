function b = zposl ( a, lda, n, b )

%*****************************************************************************80
%
%% ZPOSL solves a complex hermitian positive definite system.
%
%  Discussion:
%
%    ZPOSL uses the factors computed by ZPOCO or ZPOFA.
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal.  Technically this indicates
%    singularity but it is usually caused by improper subroutine
%    arguments.  It will not occur if the subroutines are called
%    correctly and INFO == 0.
%
%    To compute inverse(A) * C where C is a matrix with  p  columns
%
%      call zpoco(a,lda,n,rcond,z,info)
%
%      if (rcond is too small .or. info /= 0) then
%        error
%      end if
%
%      do j = 1, p
%        call zposl(a,lda,n,c(1,j))
%      end do
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2006
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
%    Input, complex A(LDA,N), the output from ZPOCO or ZPOFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, complex B(N), the right hand side.
%
%    Output, complex B(N), the solution.
%

%
%  Solve hermitian(R) * Y = B.
%
  for k = 1 : n
    b(k) = ( b(k) - b(1:k-1) * conj ( a(1:k-1,k) ) ) / a(k,k);
  end
%
%  Solve R * X = Y.
%
  for k = n : -1 : 1
    b(k) = b(k) / a(k,k);
    b(1:k-1) = b(1:k-1) - transpose ( a(1:k-1,k) * b(k) );
  end

  return
end
