function b = sppsl ( ap, n, b )

%*****************************************************************************80
%
%% SPPSL solves a real symmetric positive definite system factored by SPPCO or SPPFA.
%
%  Discussion:
%
%    To compute inverse(A) * C where C is a matrix with P columns
%
%      call sppco ( ap, n, rcond, z, info )
%
%      if ( rcond is too small .or. info /= 0 ) then
%        exit
%      end if
%
%      do j = 1, p
%        call sppsl ( ap, n, c(1,j) )
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
%    Input, real AP(N*(N+1)/2), the output from SPPCO or SPPFA.
%
%    Input, integer N, the order of the matrix.
%
%    Input, real B(N), the right hand side.
%
%    Output, real B(N), the solution.
%
  kk = 0;

  for k = 1 : n
    t = sdot ( k-1, ap(kk+1:kk+k-1), 1, b(1:k-1), 1 );
    kk = kk + k;
    b(k) = ( b(k) - t ) / ap(kk);
  end

  for k = n : -1 : 1
    b(k) = b(k) / ap(kk);
    kk = kk - k;
    t = -b(k);
    b(1:k-1) = saxpy ( k-1, t, ap(kk+1:kk+k-1), 1, b(1:k-1), 1 );
  end

  return
end
