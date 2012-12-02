function [ abd, info ] = zpbfa ( abd, lda, n, m )

%*****************************************************************************80
%
%% ZPBFA factors a complex hermitian positive definite band matrix.
%
%  Discussion:
%
%    ZPBFA is usually called by ZPBCO, but it can be called
%    directly with a saving in time if RCOND is not needed.
%
%  Band storage:
%
%    If A is a hermitian positive definite band matrix,
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
%    Input, complex ABD(LDA,N); the matrix to be factored.
%    The columns of the upper triangle are stored in the columns of ABD
%    and the diagonals of the upper triangle are stored in the rows of ABD.
%
%    Input, integer LDA, the leading dimension of ABD.
%    LDA must be at least M+1.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%    0 <= M < N.
%
%    Output, integer INFO.
%    0, for normal return.
%    K, if the leading minor of order K is not positive definite.
%
%    Output, complex ABD(LDA,N); an upper triangular matrix R, stored in
%    band form, so that A = hermitian(R)*R.
%
  info = 0;

  for j = 1 : n

    s = 0.0;
    ik = m + 1;
    jk = max ( j - m, 1 );
    mu = max ( m + 2 - j, 1 );

    for k = mu : m
      t = abd(k,j) - abd(ik:ik+k-mu-1,jk)' * abd(mu:mu+k-mu-1,j);
      t = t / abd(m+1,jk);
      abd(k,j) = t;
      s = s + real ( t * conj ( t ) );
      ik = ik - 1;
      jk = jk + 1;
    end

    s = real ( abd(m+1,j) ) - s;

    if ( s <= 0.0 | imag ( abd(m+1,j) ) ~= 0.0 )
      info = j;
      break
    end

    abd(m+1,j) = sqrt ( s );

  end

  return
end
