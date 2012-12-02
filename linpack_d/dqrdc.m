function [ a, qraux, jpvt ] = dqrdc ( a, lda, n, p, jpvt, job )

%*****************************************************************************80
%
%% DQRDC computes the QR factorization of a real rectangular matrix.
%
%  Discussion:
%
%    DQRDC uses Householder transformations.
%
%    Column pivoting based on the 2-norms of the reduced columns may be
%    performed at the user's option.
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
%    Input, real A(LDA,P), the N by P matrix whose decomposition is to be computed.
%
%    Input, integer LDA, the leading dimension of the array A.  LDA must
%    be at least N.
%
%    Input, integer N, the number of rows of the matrix A.
%
%    Input, integer P, the number of columns of the matrix A.
%
%    Input, integer JPVT(P), integers that control the selection of the pivot 
%    columns.  The K-th column A(*,K) of A is placed in one of three classes 
%    according to the value of JPVT(K).
%      > 0, then A(K) is an initial column.
%      = 0, then A(K) is a free column.
%      < 0, then A(K) is a final column.
%    Before the decomposition is computed, initial columns are moved to
%    the beginning of the array A and final columns to the end.  Both
%    initial and final columns are frozen in place during the computation
%    and only free columns are moved.  At the K-th stage of the
%    reduction, if A(*,K) is occupied by a free column it is interchanged
%    with the free column of largest reduced norm.  JPVT is not referenced
%    if JOB == 0.  
%
%    Input, integer JOB, initiates column pivoting.
%    0, no pivoting is done.
%    nonzero, pivoting is done.
%
%    Output, real A(LDA,P), contains in its upper triangle the upper 
%    triangular matrix R of the QR factorization.  Below its diagonal 
%    A contains information from which the orthogonal part of the 
%    decomposition can be recovered.  Note that if pivoting has been 
%    requested, the decomposition is not that of the original matrix A 
%    but that of A with its columns permuted as described by JPVT.
%
%    Output, real QRAUX(P), contains further information required
%    to recover the orthogonal part of the decomposition.
%
%    Output, integer JPVT(P), JPVT(K) contains the index of the column of the
%    original matrix that has been interchanged into the K-th column, if
%    pivoting was requested.
%
  pl = 1;
  pu = 0;
  qraux = [];
%
%  If pivoting is requested, rearrange the columns.
%
  if ( job ~= 0 )

    for j = 1 : p

      swapj = ( 0 < jpvt(j) );

      if ( jpvt(j) < 0 )
        jpvt(j) = -j;
      else
        jpvt(j) = j;
      end

      if ( swapj )

        if ( j ~= pl )
          temp(1:n) = a(1:n,pl);
          a(1:n,pl) = a(1:n,j);
          a(1:n,j) = temp(1:n);
        end

        jpvt(j) = jpvt(pl);
        jpvt(pl) = j;
        pl = pl + 1;

      end

    end

    pu = p;

    for j = p : -1 : 1

      if ( jpvt(j) < 0 )

        jpvt(j) = -jpvt(j);

        if ( j ~= pu )
          temp(1:n) = a(1:n,pu);
          a(1:n,pu) = a(1:n,j);
          a(1:n,j) = temp(1:n);
          jp = jpvt(pu);
          jpvt(pu) = jpvt(j);
          jpvt(j) = jp;
        end

        pu = pu - 1;

      end

    end

  end
%
%  Compute the norms of the free columns.
%
  for j = pl : pu
    qraux(j) = dnrm2 ( n, a(1:n,j), 1 );
  end

  work(pl:pu) = qraux(pl:pu);
%
%  Perform the Householder reduction of A.
%
  lup = min ( n, p );

  for l = 1 : lup
%
%  Bring the column of largest norm into the pivot position.
%
    if ( pl <= l & l < pu )

      maxnrm = 0.0;
      maxj = l;
      for j = l : pu
        if ( maxnrm < qraux(j) )
          maxnrm = qraux(j);
          maxj = j;
        end
      end

      if ( maxj ~= l )
        temp(1:n) = a(1:n,l);
        a(1:n,l) = a(1:n,maxj);
        a(1:n,maxj) = temp(1:n);
        qraux(maxj) = qraux(l);
        work(maxj) = work(l);
        jp = jpvt(maxj);
        jpvt(maxj) = jpvt(l);
        jpvt(l) = jp;
      end

    end
%
%  Compute the Householder transformation for column L.
%
    qraux(l) = 0.0;

    if ( l ~= n )

      nrmxl = dnrm2 ( n-l+1, a(l:n,l), 1 );

      if ( nrmxl ~= 0.0 )

        if ( a(l,l) ~= 0.0 )
          nrmxl = abs ( nrmxl ) * r8_sign ( a(l,l) );
        end

        a(l:n,l) = a(l:n,l) / nrmxl;
        a(l,l) = 1.0 + a(l,l);
%
%  Apply the transformation to the remaining columns, updating the norms.
%
        for j = l + 1 : p

          t = -ddot ( n-l+1, a(l:n,l), 1, a(l:n,j), 1 ) / a(l,l);
          a(l:n,j) = daxpy ( n-l+1, t, a(l:n,l), 1, a(l:n,j), 1 );

          if ( pl <= j & j <= pu )

            if ( qraux(j) ~= 0.0 )

              tt = 1.0 - ( abs ( a(l,j) ) / qraux(j) )^2;
              tt = max ( tt, 0.0 );
              t = tt;
              tt = 1.0 + 0.05 * tt * ( qraux(j) / work(j) )^2;

              if ( tt ~= 1.0 )
                qraux(j) = qraux(j) * sqrt ( t );
              else
                qraux(j) = dnrm2 ( n-l, a(l+1:n,j), 1 );
                work(j) = qraux(j);
              end

            end

          end

        end
%
%  Save the transformation.
%
        qraux(l) = a(l,l);
        a(l,l) = -nrmxl;

      end

    end

  end

  return
end
