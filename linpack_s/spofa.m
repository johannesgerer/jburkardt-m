function [ a, info ] = spofa ( a, lda, n )

%*****************************************************************************80
%
%% SPOFA factors a real symmetric positive definite matrix.
%
%  Discussion:
%
%    SPOFA is usually called by SPOCO, but it can be called
%    directly with a saving in time if RCOND is not needed.
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
%    Input, real A(LDA,N), the symmetric matrix to be  factored.  Only the 
%    diagonal and upper triangle are used.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(LDA,N), an upper triangular matrix R so that A = R'*R
%    where R' is the transpose.  The strict lower triangle is unaltered.
%    If INFO /= 0, the factorization is not complete.
%
%    Output, integer INFO, error flag.
%    0, for normal return.
%    K, signals an error condition.  The leading minor of order K is not 
%    positive definite.
%
  for j = 1 : n

    s = 0.0;

    for k = 1 : j-1
      t = a(k,j) - sdot ( k-1, a(1:k-1,k), 1, a(1:k-1,j), 1 );
      t = t / a(k,k);
      a(k,j) = t;
      s = s + t * t;
    end

    s = a(j,j) - s;

    if ( s <= 0.0 )
      info = j;
      return
    end

    a(j,j) = sqrt ( s );

  end

  info = 0;

  return
end

