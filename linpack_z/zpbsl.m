function b = zpbsl ( abd, lda, n, m, b )

%*****************************************************************************80
%
%% ZPBSL solves a complex hermitian positive definite band system.
%
%  Discussion:
%
%    The system matrix must have been factored by ZPBCO or ZPBFA.
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal.  Technically this indicates
%    singularity but it is usually caused by improper subroutine
%    arguments.  It will not occur if the subroutines are called
%    correctly and INFO == 0.
%
%    To compute inverse(A) * C where C is a matrix with P columns:
%
%      call zpbco(abd,lda,n,rcond,z,info)
%
%      if (rcond is too small .or. info /= 0) then
%        error
%      end if
%
%      do j = 1, p
%        call zpbsl(abd,lda,n,c(1,j))
%      end do
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2007
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
%    Input, complex ABD(LDA,N), the output from ZPBCO or ZPBFA.
%
%    Input, integer LDA, the leading dimension of ABD.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%
%    Input, complex B(N), the right hand side.
%
%    Output, complex B(N), the solution.
%

%
%  Solve hermitian(R) * Y = B.
%
  for k = 1 : n
    lm = min ( k - 1, m );
    la = m + 1 - lm;
    lb = k - lm;
    t = abd(la:la+lm-1,k)' * transpose ( b(lb:lb+lm-1) );
    b(k) = ( b(k) - t ) / abd(m+1,k);
  end
%
%  Solve R * X = Y.
%
  for k = n : -1 : 1
    lm = min ( k - 1, m );
    la = m + 1 - lm;
    lb = k - lm;
    b(k) = b(k) / abd(m+1,k);
    t = -b(k);
    b(lb:lb+lm-1) = b(lb:lb+lm-1) + t * transpose ( abd(la:la+lm-1,k) );
  end

  return
end

