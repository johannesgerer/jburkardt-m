function [ ap, det ] = dppdi ( ap, n, job )

%*****************************************************************************80
%
%% DPPDI computes the determinant and inverse of a matrix factored by DPPCO or DPPFA.
%
%  Discussion:
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal and the inverse is requested.
%    It will not occur if the subroutines are called correctly
%    and if DPOCO or DPOFA has set INFO == 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 June 2005
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
%    Input, real AP(N*(N+1)/2), the output from DPPCO or DPPFA.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer JOB, job request.
%    11, both determinant and inverse.
%    01, inverse only.
%    10, determinant only.
%
%    Output, real AP(N*(N+1)/2), the upper triangular half of the
%    inverse, if requested.
%
%    Output, real DET(2), the determinant of the original matrix
%    if requested.
%      determinant = DET(1) * 10.0**DET(2)
%    with  1.0 <= DET(1) < 10.0D+00 or DET(1) == 0.0D+00.
%

%
%  Compute the determinant.
%
  if ( floor ( job / 10 ) ~= 0 )

    det(1) = 1.0;
    det(2) = 0.0;
    s = 10.0;
    ii = 0;

    for i = 1 : n

      ii = ii + i;

      det(1) = ap(ii) * ap(ii) * det(1);

      if ( det(1) == 0.0 )
        break
      end

      while ( det(1) < 1.0 )
        det(1) = s * det(1);
        det(2) = det(2) - 1.0;
      end

      while ( s <= det(1) )
        det(1) = det(1) / s;
        det(2) = det(2) + 1.0;
      end

    end

  end
%
%  Compute inverse(R).
%
  if ( mod ( job, 10 ) ~= 0 )

    kk = 0;

    for k = 1 : n

      k1 = kk + 1;
      kk = kk + k;
      ap(kk) = 1.0 / ap(kk);
      t = -ap(kk);
      ap(k1:k1+k-2) = dscal ( k-1, t, ap(k1:k1+k-2), 1 );
      j1 = kk + 1;
      kj = kk + k;

      for j = k + 1 : n
        t = ap(kj);
        ap(kj) = 0.0;
        ap(j1:j1+k-1) = daxpy ( k, t, ap(k1:k1+k-1), 1, ap(j1:j1+k-1), 1 );
        j1 = j1 + j;
        kj = kj + j;
      end

    end
%
%  Form inverse(R) * (inverse(R))'.
%
    jj = 0;

    for j = 1 : n

      j1 = jj + 1;
      jj = jj + j;
      k1 = 1;
      kj = j1;

      for k = 1 : j-1
        t = ap(kj);
        ap(k1:k1+k-1) = daxpy ( k, t, ap(j1:j1+k-1), 1, ap(k1:k1+k-1), 1 );
        k1 = k1 + k;
        kj = kj + 1;
      end

      t = ap(jj);
      ap(j1:j1+j-1) = dscal ( j, t, ap(j1:j1+j-1), 1 );

    end

  end

  return
end
