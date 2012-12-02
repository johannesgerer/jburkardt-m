function [ a, det ] = zgedi ( a, lda, n, ipvt, job )

%*****************************************************************************80
%
%% ZGEDI computes the determinant and inverse of a matrix.
%
%  Discussion:
%
%    The matrix must have been factored by ZGECO or ZGEFA.
%
%    A division by zero will occur if the input factor contains
%    a zero on the diagonal and the inverse is requested.
%    It will not occur if the subroutines are called correctly
%    and if ZGECO has set 0.0 < RCOND or ZGEFA has set
%    INFO == 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%
%  Parameters:
%
%    Input, complex A(LDA,N); the factor information from ZGECO or ZGEFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer IPVT(N), the pivot vector from ZGECO or ZGEFA.
%
%    Input, integer JOB.
%    11, both determinant and inverse.
%    01, inverse only.
%    10, determinant only.
%
%    Output, complex A(LDA,N); the inverse matrix, if it was requested,
%
%    Output, complex DET(2), the determinant of the original matrix,
%    if requested.  Otherwise not referenced.
%    Determinant = DET(1) * 10.0**DET(2) with
%    1.0 <= zabs1 ( DET(1) ) < 10.0 or DET(1) == 0.0.
%    Also, DET(2) is strictly real.
%
  work = zeros ( n, 1 );
  det = zeros ( 1, 2 );
%
%  Compute the determinant.
%
  if ( floor ( job / 10 ) ~= 0 )

    det(1) = 1.0;
    det(2) = 0.0;

    for i = 1 : n

      if ( ipvt(i) ~= i )
        det(1) = -det(1);
      end

      det(1) = det(1) * a(i,i);

      if ( zabs1 ( det(1) ) == 0.0 )
        break
      end

      while ( zabs1 ( det(1) ) < 1.0 )
        det(1) = det(1) * 10.0;
        det(2) = det(2) - 1.0;
      end

      while ( 10.0 <= zabs1 ( det(1) ) )
        det(1) = det(1) / 10.0;
        det(2) = det(2) + 1.0
      end

    end

  end
%
%  Compute inverse(U).
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
%  Form inverse(U) * inverse(L).
%
    for k = n-1 : -1 : 1

      work(k+1:n) = a(k+1:n,k);
      a(k+1:n,k) = 0.0;

      for j = k+1 : n
        t = work(j);
        a(1:n,k) = a(1:n,k) + t * a(1:n,j);
      end

      l = ipvt(k);

      if ( l ~= k )
        work(1:n) = a(1:n,k);
        a(1:n,k) = a(1:n,l);
        a(1:n,l) = work(1:n);
      end

    end

  end

  return
end
