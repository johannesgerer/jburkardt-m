function [ a, det ] = cpodi ( a, lda, n, job )

%*****************************************************************************80
%
%% CPODI: determinant, inverse of a complex hermitian positive definite matrix.
%
%  Discussion:
%
%    The matrix is assumed to have been factored by CPOCO, CPOFA or CQRDC.
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal and the inverse is requested.
%    It will not occur if the subroutines are called correctly
%    and if CPOCO or CPOFA has set INFO == 0.
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
%    Input, complex A(LDA,N); the output A from CPOCO or CPOFA, or the output 
%    X from CQRDC.  
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer JOB.
%    11, both determinant and inverse.
%    01, inverse only.
%    10, determinant only.
%
%    Output, real DET(2), if requested, the determinant of A or of 
%    hermitian(X)*X.  Determinant = DET(1) * 10.0**DET(2) with 
%    1.0 <= abs ( DET(1) ) < 10.0 or DET(1) = 0.0.
%
%    Output, complex A(LDA,N); if CPOCO or CPOFA was 
%    used to factor A, then CPODI produces the upper half of inverse(A).
%    If CQRDC was used to decompose X, then CPODI produces the upper half 
%    of inverse(hermitian(X)*X) where hermitian(X) is the conjugate transpose.
%    Elements of A below the diagonal are unchanged.
%    If the units digit of JOB is zero, A is unchanged.
%

%
%  Compute determinant
%
  if ( floor ( job / 10 ) ~= 0 )

    det(1) = 1.0;
    det(2) = 0.0;

    for i = 1 : n

      det(1) = det(1) * real ( a(i,i) )^2;

      if ( det(1) == 0.0 )
        break
      end

      while ( det(1) < 1.0 )
        det(1) = det(1) * 10.0;
        det(2) = det(2) - 1.0;
      end

      while ( 10.0 <= det(1) )
        det(1) = det(1) / 10.0;
        det(2) = det(2) + 1.0;
      end

    end

  end
%
%  Compute inverse(R).
%
  if ( mod ( job, 10 ) ~= 0 )

    for k = 1 : n

      a(k,k) = 1.0 / a(k,k);
      t = -a(k,k);
      a(1:k-1,k) = a(1:k-1,k) * t;

      for j = k+1 : n
        t = a(k,j);
        a(k,j) = 0.0;
        a(1:k,j) = a(1:k,j) + t * a(1:k,k);
      end

    end
%
%  Form inverse(R) * hermitian(inverse(R)).
%
    for j = 1 : n

      for k = 1 : j-1
        t = conj ( a(k,j) );
        a(1:k,k) = a(1:k,k) + t * a(1:k,j);
      end

      t = conj ( a(j,j) );
      a(1:j,j) = a(1:j,j) * t;

    end

  end

  return
end
