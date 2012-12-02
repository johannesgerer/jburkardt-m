function [ ap, det ] = cppdi ( ap, n, job )

%*****************************************************************************80
%
%% CPPDI: determinant, inverse of a complex hermitian positive definite matrix.
%
%  Discussion:
%
%    The matrix is assumed to have been factored by CPPCO or CPPFA.
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
%    03 May 2007
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
%    Input, complex A((N*(N+1))/2); on input, the output from CPPCO
%    or CPPFA.  
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer JOB.
%    11, both determinant and inverse.
%    01, inverse only.
%    10, determinant only.
%
%    Output, complex A((N*(N+1))/2); the upper triangular half of the inverse.
%    The strict lower triangle is unaltered.
%
%    Output, real DET(2), the determinant of original matrix if requested.
%    Otherwise not referenced.  Determinant = DET(1) * 10.0**DET(2)
%    with 1.0 <= DET(1) < 10.0 or DET(1) == 0.0.
%

%
%  Compute determinant.
%
  if ( floor ( ( job / 10 ) ) ~= 0 )

    det(1) = 1.0;
    det(2) = 0.0;
    ii = 0;

    for i = 1 : n

      ii = ii + i;
      det(1) = det(1) * real ( ap(ii) )^2;

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
%  Compute inverse ( R ).
%
  if ( mod ( job, 10 ) ~= 0 )

    kk = 0;

    for k = 1 : n

      k1 = kk + 1;
      kk = kk + k;
      ap(kk) = 1.0 / ap(kk);
      t = -ap(kk);
      ap(k1:k1+k-2) = ap(k1:k1+k-2) * t;
      kp1 = k + 1;
      j1 = kk + 1;
      kj = kk + k;

      for j = kp1 : n
        t = ap(kj);
        ap(kj) = 0.0;
        ap(j1:j1+k-1) = ap(j1:j1+k-1) + t * ap(k1:k1+k-1);
        j1 = j1 + j;
        kj = kj + j;
      end

    end
%
%  Form inverse ( R ) * hermitian ( inverse ( R ) ).
%
    jj = 0;
    for j = 1 : n

      j1 = jj + 1;
      jj = jj + j;
      k1 = 1;
      kj = j1;
 
      for k = 1 : j-1
        t = conj ( ap(kj) );
        ap(k1:k1+k-1) = ap(k1:k1+k-1) + t * ap(j1:j1+k-1);
        k1 = k1 + k;
        kj = kj + 1;
      end

      t = conj ( ap(jj) );
      ap(j1:j1+j-1) = ap(j1:j1+j-1) * t;

    end

  end

  return
end
