function b = dpbsl ( abd, lda, n, m, b )

%*****************************************************************************80
%
%% DPBSL solves a real SPD band system factored by DPBCO or DPBFA.
%
%  Discussion:
%
%    The matrix is assumed to be a symmetric positive definite (SPD)
%    band matrix.
%
%    To compute inverse(A) * C  where C is a matrix with P columns:
%
%      call dpbco ( abd, lda, n, rcond, z, info )
%
%      if ( rcond is too small .or. info /= 0) go to ...
%
%      do j = 1, p
%        call dpbsl ( abd, lda, n, c(1,j) )
%      end do
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
%    15 June 2005
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
%    Input, real ABD(LDA,N), the output from DPBCO or DPBFA.
%
%    Input, integer LDA, the leading dimension of the array ABD.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%
%    Input, real B(N), the right hand side.
%
%    Output, real B(N), the solution.
%

%
%  Solve R' * Y = B.
%
  for k = 1 : n
    lm = min ( k-1, m );
    la = m + 1 - lm;
    lb = k - lm;
    t = ddot ( lm, abd(la:la+lm-1,k), 1, b(lb:lb+lm-1), 1 );
    b(k) = ( b(k) - t ) / abd(m+1,k);
  end
%
%  Solve R * X = Y.
%
  for k = n : -1 : 1
    lm = min ( k-1, m );
    la = m + 1 - lm;
    lb = k - lm;
    b(k) = b(k) / abd(m+1,k);
    t = -b(k);
    b(lb:lb+lm-1) = b(lb:lb+lm-1) + t * abd(la:la+lm-1,k)';
  end

  return
end
