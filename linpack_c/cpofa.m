function [ a, info ] = cpofa ( a, lda, n )

%*****************************************************************************80
%
%% CPOFA factors a complex hermitian positive definite matrix.
%
%  Discussion:
%
%    CPOFA is usually called by CPOCO, but it can be called
%    directly with a saving in time if RCOND is not needed.
%    (time for CPOCO) = (1 + 18/N) * (time for CPOFA).
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
%    Input, complex A(LDA,N), the hermitian matrix to be factored.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(LDA,N); an upper triangular matrix R so that  
%      A = hermitian(R)*R
%    where hermitian(R) is the conjugate transpose.  The strict lower 
%    triangle is unaltered.  If INFO /= 0, the factorization is not 
%    complete.  Only the diagonal and upper triangle are used.
%
%    Output, integer INFO.
%    0, for normal return.
%    K, signals an error condition.  The leading minor of order K is 
%    not positive definite.
%
  info = 0;

  for j = 1 : n

    s = 0.0;

    for k = 1 : j-1
      t = a(k,j) - a(1:k-1,k)' * a(1:k-1,j);
      t = t / a(k,k);
      a(k,j) = t;
      s = s + real ( t * conj ( t ) );
    end

    s = real ( a(j,j) ) - s;

    if ( s <= 0.0 | imag ( a(j,j) ) ~= 0.0 )
      info = j;
      break
    end

    a(j,j) = sqrt ( s );

  end

  return
end
