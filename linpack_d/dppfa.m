function [ ap, info ] = dppfa ( ap, n )

%*****************************************************************************80
%
%% DPPFA factors a real symmetric positive definite matrix in packed form.
%
%  Discussion:
%
%    DPPFA is usually called by DPPCO, but it can be called
%    directly with a saving in time if RCOND is not needed.
%
%  Packed storage:
%
%    The following program segment will pack the upper
%    triangle of a symmetric matrix.
%
%      k = 0
%      do j = 1, n
%        do i = 1, j
%          k = k + 1
%          ap(k) = a(i,j)
%        end
%      end
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2005
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
%    Input, real AP(N*(N+1)/2), the packed form of a symmetric matrix A.  
%    The columns of the upper triangle are stored sequentially in a 
%    one-dimensional array.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real AP(N*(N+1)/2), an upper triangular matrix R, stored
%    in packed form, so that A = R'*R.
%
%    Output, integer INFO, error flag.
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
      t = ap(kj) - ddot ( k-1, ap(kk+1:kk+k-1), 1, ap(jj+1:jj+k-1), 1 );
      kk = kk + k;
      t = t / ap(kk);
      ap(kj) = t;
      s = s + t * t;

    end

    jj = jj + j;
    s = ap(jj) - s;

    if ( s <= 0.0 )
      info = j;
      return
    end

    ap(jj) = sqrt ( s );

  end

  return
end
