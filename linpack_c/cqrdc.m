function [ x, qraux, ipvt ] = cqrdc ( x, ldx, n, p, ipvt, job )

%*****************************************************************************80
%
%% CQRDC computes the QR factorization of an N by P complex matrix.
%
%  Discussion:
%
%    CQRDC uses Householder transformations to compute the QR factorization 
%    of an N by P matrix X.  Column pivoting based on the 2-norms of the 
%    reduced columns may be performed at the user's option.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2007
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
%    Input, complex X(LDX,P), the matrix whose decomposition 
%    is to be computed. 
%
%    Input, integer LDX, the leading dimension of X.  N <= LDX.
%
%    Input, integer N, the number of rows of the matrix.
%
%    Input, integer P, the number of columns in the matrix X.
%
%    Input, integer IPVT(P), integers that control the 
%    selection of the pivot columns.  The K-th column X(K) of X is placed 
%    in one of three classes according to the value of IPVT(K):
%      IPVT(K) > 0, then X(K) is an initial column.
%      IPVT(K) == 0, then X(K) is a free column.
%      IPVT(K) < 0, then X(K) is a final column.
%    Before the decomposition is computed, initial columns are moved to the 
%    beginning of the array X and final columns to the end.  Both initial 
%    and final columns are frozen in place during the computation and only
%    free columns are moved.  At the K-th stage of the reduction, if X(K) 
%    is occupied by a free column it is interchanged with the free column 
%    of largest reduced norm.  
%
%    Input, integer JOB, initiates column pivoting.
%    0, no pivoting is done.
%    nonzero, pivoting is done.
%
%    Output, complex X(LDX,P); the upper triangle contains the upper
%    triangular matrix R of the QR factorization.  Below its diagonal, X 
%    contains information from which the unitary part of the decomposition
%    can be recovered.  If pivoting has been requested, the decomposition is 
%    not that of the original matrix X, but that of X with its columns 
%    permuted as described by IPVT.
%
%    Output, complex QRAUX(P), further information required to recover
%    the unitary part of the decomposition.
%
%    Output, integer IPVT(P); the index of the column of the
%    original matrix that has been interchanged into
%    the K-th column, if pivoting was requested.
%    IPVT is not referenced if JOB == 0.
%
  pl = 1;
  pu = 0;

  if ( job ~= 0 )
%
%  Pivoting has been requested.  Rearrange the columns according to IPVT.
%
    for j = 1 : p

      swapj = ( 0 < ipvt(j) );
      negj = ( ipvt(j) < 0 );

      if ( negj )
        ipvt(j) = -j;
      else
        ipvt(j) = j;
      end

      if ( swapj )

        if ( j ~= pl )
          temp      = x(1:n,pl);
          x(1:n,pl) = x(1:n,j);
          x(1:n,j)  = temp;
        end

        ipvt(j) = ipvt(pl);
        ipvt(pl) = j;
        pl = pl + 1;

      end

    end

    pu = p;

    for jj = 1 : p

      j = p - jj + 1;

      if ( ipvt(j) < 0 )

        ipvt(j) = -ipvt(j);

        if ( j ~= pu )

          temp      = x(1:n,pu);
          x(1:n,pu) = x(1:n,j);
          x(1:n,j)  = temp;

          i        = ipvt(pu);
          ipvt(pu) = ipvt(j);
          ipvt(j)  = i;

        end

        pu = pu - 1;

      end

    end

  end
%
%  Compute the norms of the free columns.
%
  for j = pl : pu
    qraux(j) = scnrm2 ( n, x(1:n,j), 1 );
    work(j) = qraux(j);
  end
%
%  Perform the Householder reduction of X.
%
  lup = min ( n, p );

  for l = 1 : lup
%
%  Locate the column of largest norm and bring it
%  into the pivot position.
%
    if ( pl <= l & l < pu )

      maxnrm = 0.0;
      maxj = l;

      for j = l : pu
        if ( maxnrm < real ( qraux(j) ) )
          maxnrm = real ( qraux(j) );
          maxj = j;
        end
      end

      if ( maxj ~= l )

        temp        = x(1:n,l);
        x(1:n,l)    = x(1:n,maxj);
        x(1:n,maxj) = temp;

        qraux(maxj) = qraux(l);
        work(maxj)  = work(l);

        i          = ipvt(maxj);
        ipvt(maxj) = ipvt(l);
        ipvt(l)    = i;

      end

    end

    qraux(l) = 0.0;

    if ( l ~= n )
%
%  Compute the Householder transformation for column L.
%
      nrmxl = scnrm2 ( n-l+1, x(l:n,l), 1 );

      if ( cabs1 ( nrmxl ) ~= 0.0 )

        if ( cabs1 ( x(l,l) ) ~= 0.0 )
          nrmxl = csign2 ( nrmxl, x(l,l) );
        end

        x(l:n,l) = x(l:n,l) / nrmxl;
        x(l,l) = 1.0 + x(l,l);
%
%  Apply the transformation to the remaining columns,
%  updating the norms.
%
        for j = l+1 : p

          t = - ( conj ( transpose ( x(l:n,l) ) ) * x(l:n,j) ) / x(l,l);
          x(l:n,j) = x(l:n,j) + t * x(l:n,l);

          if ( j < pl | pu < j )
            continue
          end

          if ( cabs1 ( qraux(j) ) == 0.0 )
            continue
          end

          tt = 1.0 - ( abs ( x(l,j) ) / real ( qraux(j) ) )^2;
          tt = max ( tt, 0.0 );
          t = tt;
          tt = 1.0 + 0.05 * tt * ( real ( qraux(j) ) / real ( work(j) ) )^2;

          if ( tt ~= 1.0 )
            qraux(j) = qraux(j) * sqrt ( t );
          else
            qraux(j) = scnrm2 ( n-l, x(l+1:n,j), 1 );
            work(j) = qraux(j);
          end

        end
%
%  Save the transformation.
%
        qraux(l) = x(l,l);
        x(l,l) = -nrmxl;

      end

    end

  end

  return
end
