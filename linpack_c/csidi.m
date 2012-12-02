function [ a, det ] = csidi ( a, lda, n, ipvt, job )

%*****************************************************************************80
%
%% CSIDI computes the determinant and inverse of a matrix factored by CSIFA.
%
%  Discussion:
%
%    It is assumed the complex symmetric matrix has already been factored 
%    by CSIFA.
%
%    A division by zero may occur if the inverse is requested
%    and CSICO set RCOND == 0.0 or CSIFA set INFO nonzero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 May 2006
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
%    Input, complex A(LDA,N), the output from CSIFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer IPVT(N), the pivot vector from CSIFA.
%
%    Input, integer JOB, has the decimal expansion AB where
%    if B ~= 0, the inverse is computed,
%    if A ~= 0, the determinant is computed,
%    For example, JOB = 11 gives both.
%
%    Output, complex A(LDA,N); if the inverse was requested, then on output, 
%    A contains the upper triangle of the inverse of the original matrix.  
%    The strict lower triangle is never referenced.
%
%    Output, complex DET(2), if requested, the determinant of the matrix.
%    Determinant = DET(1) * 10.0**DET(2) with 1.0 <= abs ( DET(1) ) < 10.0
%    or DET(1) = 0.0.  Also, DET(2) is strictly real.
%
  noinv = ( mod ( job, 10 ) == 0 );
  nodet = ( floor ( mod ( job, 100 ) / 10 ) == 0 );

  det = [];

  if ( ~nodet )

    det(1) = 1.0;
    det(2) = 0.0;
    t = 0.0;

    for k = 1 : n

      d = a(k,k);
%
%   2 by 2 block.
%   Use det ( D  T ) = ( D / T * C - T ) * T
%           ( T  C )
%   to avoid underflow/overflow troubles.
%   Take two passes through scaling.  Use T for flag.
%
      if ( ipvt(k) <= 0 )

        if ( cabs1 ( t ) == 0.0 )
          t = a(k,k+1);
          d = ( d / t ) * a(k+1,k+1) - t;
        else
          d = t;
          t = 0.0;
        end

      end

      det(1) = det(1) * d;

      if ( cabs1 ( det(1) ) ~= 0.0 )

        while ( cabs1 ( det(1) ) < 1.0 )
          det(1) = det(1) * 10.0;
          det(2) = det(2) - 1.0;
        end

        while ( 10.0 <= cabs1 ( det(1) ) )
          det(1) = det(1) / 10.0;
          det(2) = det(2) + 1.0;
        end

      end

    end

  end
%
%  Compute inverse ( A ).
%
  if ( ~noinv )

    k = 1;

    while ( k <= n )

      km1 = k - 1;
%
%  1 by 1
%
      if ( 0 <= ipvt(k) )

        a(k,k) = 1.0 / a(k,k);

        if ( 1 <= km1 )

          work(1:km1) = a(1:km1,k);

          for j = 1 : km1
            a(j,k) = work(1:j) * a(1:j,j);
            a(1:j-1,k) = a(1:j-1,k) + work(j) * a(1:j-1,j);
          end

          a(k,k) = a(k,k) + work(1:km1) * a(1:km1,k);

        end

        kstep = 1;
%
%  2 by 2
%
      else
 
        t = a(k,k+1);
        ak = a(k,k) / t;
        akp1 = a(k+1,k+1) / t;
        akkp1 = a(k,k+1) / t;
        d = t * ( ak * akp1 - 1.0 );
        a(k,k) = akp1 / d;
        a(k+1,k+1) = ak / d;
        a(k,k+1) = -akkp1 / d;

        if ( 1 <= km1 )

          work(1:km1) = transpose ( a(1:km1,k+1) );

          for j = 1 : km1
            a(j,k+1) = work(1:j) * a(1:j,j);
            a(1:j-1,k+1) = a(1:j-1,k+1) + work(j) * a(1:j-1,j);
          end

          a(k+1,k+1) = a(k+1,k+1) + work(1:km1) * a(1:km1,k+1);
          a(k,k+1) = a(k,k+1) + transpose ( a(1:km1,k) ) * a(1:km1,k+1);

          work(1:km1) = transpose ( a(1:km1,k) );

          for j = 1 : km1
            a(j,k) = work(1:j) * a(1:j,j);
            a(1:j-1,k) = a(1:j-1,k) + work(j) * a(1:j-1,j);
          end

          a(k,k) = a(k,k) + work(1:km1) * a(1:km1,k);

        end

        kstep = 2;

      end
%
%  Swap.
%
      ks = abs ( ipvt(k) );

      if ( ks ~= k )

        temp       = a(1:ks,ks);
        a(1:ks,ks) = a(1:ks,k);
        a(1:ks,k)  = temp;

        for jb = ks : k
          j = k + ks - jb;
          t       = a(j,k);
          a(j,k)  = a(ks,j);
          a(ks,j) = t;
        end

        if ( kstep ~= 1 )
          t         = a(ks,k+1);
          a(ks,k+1) = a(k,k+1);
          a(k,k+1)  = t;
        end

      end

      k = k + kstep;

    end

  end

  return
end
