function [ a, det ] = dpodi ( a, lda, n, job )

%*****************************************************************************80
%
%% DPODI computes the determinant and inverse of a certain matrix.
%
%  Discussion:
%
%    The matrix is real symmetric positive definite.
%    DPODI uses the factors computed by DPOCO, DPOFA or DQRDC.
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
%    16 June 2005
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
%    Input, real A(LDA,N), the output A from DPOCO or DPOFA, or the output 
%    X from DQRDC.  
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix A.
%
%    Input, integer JOB, specifies the task.
%    11, both determinant and inverse.
%    01, inverse only.
%    10, determinant only.
%
%    Output, real A(LDA,N), if DPOCO or DPOFA was used to factor A then 
%    DPODI produces the upper half of inverse(A).  If DQRDC was used to 
%    decompose X then DPODI produces the upper half of inverse(X'*X) 
%    where X' is the transpose.  Elements of A below the diagonal are 
%    unchanged.  If the units digit of JOB is zero, A is unchanged.
%
%    Output, real DET(2), the determinant of A or of X'*X
%    if requested.
%      determinant = DET(1) * 10.0**DET(2)
%    with 1.0 <= DET(1) < 10.0 or DET(1) == 0.0.
%

%
%  Compute the determinant.
%
  if ( job / 10 ~= 0 )

    det(1) = 1.0;
    det(2) = 0.0;
    s = 10.0;

    for i = 1 : n

      det(1) = a(i,i) * a(i,i) * det(1);

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
%  Form inverse(R) * (inverse(R))'.
%
    for j = 1 : n
      for k = 1 : j-1
        t = a(k,j);
        a(1:k,k) = daxpy ( k, t, a(1:k,j), 1, a(1:k,k), 1 );
      end
      t = a(j,j);
      a(1:j,j) = dscal ( j, t, a(1:j,j), 1 );
    end

  end

  return
end
