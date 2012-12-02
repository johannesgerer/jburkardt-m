function [ abd, info ] = dpbfa ( abd, lda, n, m )

%*****************************************************************************80
%
%% DPBFA factors a real symmetric positive definite matrix stored in band form.
%
%  Discussion:
%
%    DPBFA is usually called by DPBCO, but it can be called
%    directly with a saving in time if RCOND is not needed.
%
%    If A is a symmetric positive definite band matrix,
%    the following program segment will set up the input.
%
%      m = (band width above diagonal)
%      do j = 1, n
%        i1 = max ( 1, j-m )
%        do i = i1, j
%          k = i-j+m+1
%          abd(k,j) = a(i,j)
%        end do
%      end do
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
%    Input, real ABD(LDA,N), the matrix to be
%    factored.  The columns of the upper triangle are stored in the columns
%    of ABD and the diagonals of the upper triangle are stored in the
%    rows of ABD.  
%
%    Input, integer LDA, the leading dimension of the array ABD.
%    M+1 <= LDA is required.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%
%    Output, real ABD(LDA,N), an upper triangular matrix R, stored in band
%    form, so that A = R' * R.
%
%    Output, integer INFO, error indicator.
%    0, for normal return.
%    K, if the leading minor of order K is not positive definite.
%
  for j = 1 : n

    s = 0.0;
    ik = m + 1;
    jk = max ( j - m, 1 );
    mu = max ( m + 2 - j, 1 );

    for k = mu : m
      t = abd(k,j) - abd(ik:ik+k-mu-1,jk)' * abd(mu:mu+k-mu-1,j);
      t = t / abd(m+1,jk);
      abd(k,j) = t;
      s = s + t * t;
      ik = ik - 1;
      jk = jk + 1;
    end

    s = abd(m+1,j) - s;

    if ( s <= 0.0 )
      info = j;
      return
    end

    abd(m+1,j) = sqrt ( s );

  end

  info = 0;

  return
end
