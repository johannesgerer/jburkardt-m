function [ ap, info ] = zppfa ( ap, n )

%*****************************************************************************80
%
%% ZPPFA factors a complex hermitian positive definite packed matrix.
%
%  Discussion:
%
%    The following program segment will pack the upper triangle of a
%    hermitian matrix.
%
%      k = 0
%      do j = 1, n
%        do i = 1, j
%          k = k + 1
%          ap(k) = a(i,j)
%        end do
%      end do
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2007
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
%    Input, complex AP(N*(N+1)/2); the packed form
%    of a hermitian matrix A.  The columns of the upper triangle are
%    stored sequentially in a one-dimensional array.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex AP(N*(N+1)/2);  an
%    upper triangular matrix R, stored in packed form, so that
%      A = hermitian(R) * R.
%
%    Output, integer INFO.
%    0, for normal return.
%    K, if the leading minor of order K is not positive definite.
%
  info = 0;
  jj = 0;

  for j = 1 : n

    s = 0.0;
    kj = jj;
    kk = 0;

    for k = 1 : j-1
      kj = kj + 1;
      t = ap(kj) - conj ( ap(kk+1:kk+k-1) ) * transpose ( ap(jj+1:jj+k-1) );
      kk = kk + k ;
      t = t / ap(kk);
      ap(kj) = t;
      s = s + real ( t * conj ( t ) );
    end

    jj = jj + j;
    s = real ( ap(jj) ) - s;

    if ( s <= 0.0 | imag ( ap(jj) ) ~= 0.0 )
      info = j;
      break
    end

    ap(jj) = sqrt ( s );

  end

  return
end
