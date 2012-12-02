function [ a, det ] = dgedi ( a, lda, n, ipvt, job )

%*****************************************************************************80
%
%% DGEDI computes the determinant and inverse of a matrix factored by DGECO or DGEFA.
%
%  Discussion:
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal and the inverse is requested.
%    It will not occur if the subroutines are called correctly
%    and if DGECO has set 0.0 < RCOND or DGEFA has set INFO == 0.
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
%    Input, real A(LDA,N), the N by N factored matrix, as output by DGECO or DGEFA.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix A.
%
%    Input, integer IPVT(N), the pivot vector from DGECO or DGEFA.
%
%    Input, integer JOB, specifies what is to be computed.
%    11, both determinant and inverse.
%    01, inverse only.
%    10, determinant only.
%
%    Output, real A(LDA,N), the inverse matrix if requested.
%
%    Output, real DET(2), the determinant of original matrix if
%    requested.  The determinant = DET(1) * 10.0**DET(2)
%    with  1.0D+00 <= abs ( DET(1) ) < 10.0D+00
%    or DET(1) == 0.0D+00.
%
  ten = 10.0;
%
%  Compute the determinant.
%
  if ( job / 10 ~= 0 )

    det(1) = 1.0;
    det(2) = 0.0;

    for i = 1 : n

      if ( ipvt(i) ~= i )
        det(1) = -det(1);
      end

      det(1) = a(i,i) * det(1);

      if ( det(1) == 0.0 )
        break
      end

      while ( abs ( det(1) ) < 1.0 )
        det(1) = ten * det(1);
        det(2) = det(2) - 1.0;
      end

      while ( ten <= abs ( det(1) ) )
        det(1) = det(1) / ten;
        det(2) = det(2) + 1.0;
      end

    end

  else

    det(1:2) = 0.0;

  end
%
%  Compute inverse(U).
%
  if ( mod ( job, 10 ) ~= 0 )

    for k = 1 : n

      a(k,k) = 1.0 / a(k,k);
      t = -a(k,k);
      a(1:k-1,k) = dscal ( k-1, t, a(1:k-1,k), 1 );

      for j = k+1 : n
        t = a(k,j);
        a(k,j) = 0.0;
        a(1:k,j) = daxpy ( k, t, a(1:k,k), 1, a(1:k,j), 1 );
      end

    end
%
%  Form inverse(U) * inverse(L).
%
    for k = n-1 : -1 : 1

      work(k+1:n) = a(k+1:n,k);

      a(k+1:n,k) = 0.0;

      for j = k+1 : n
        t = work(j);
        a(1:n,k) = daxpy ( n, t, a(1:n,j), 1, a(1:n,k), 1 );
      end

      l = ipvt(k);
      if ( l ~= k )
        [ a(1:n,k), a(1:n,l) ] = dswap ( n, a(1:n,k), 1, a(1:n,l), 1 );
      end

    end

  end

  return
end
