function [ a, ipvt, info ] = zchdc ( a, lda, p, ipvt, job )

%*****************************************************************************80
%
%% ZCHDC: Cholesky decomposition of a Hermitian positive definite matrix.
%
%  Discussion:
%
%    A pivoting option allows the user to estimate the condition of a
%    Hermitian positive definite matrix or determine the rank of a
%    Hermitian positive semidefinite matrix.
%
%    For Hermitian positive definite matrices, INFO = P is the normal return.
%
%    For pivoting with Hermitian positive semidefinite matrices, INFO will
%    in general be less than P.  However, INFO may be greater than
%    the rank of A, since rounding error can cause an otherwise zero
%    element to be positive.  Indefinite systems will always cause
%    INFO to be less than P.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2006
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
%    Input, complex A(LDA,P), the matrix
%    whose decomposition is to be computed.  Only the upper half of A
%    need be stored.  The lower part of the array A is not referenced.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer P, the order of the matrix.
%
%    Input, integer IPVT(P).  IPVT is not referenced if JOB == 0.
%    On input, IPVT contains integers that control the selection of the
%    pivot elements, if pivoting has been requested.  Each diagonal element
%    A(K,K) is placed in one of three classes according to the input
%    value of IPVT(K):
%      IPVT(K) >  0, X(K) is an initial element.
%      IPVT(K) == 0, X(K) is a free element.
%      IPVT(K) <  0, X(K) is a final element.
%    Before the decomposition is computed, initial elements are moved by
%    symmetric row and column interchanges to the beginning of the array A
%    and final elements to the end.  Both initial and final elements
%    are frozen in place during the computation and only free elements
%    are moved.  At the K-th stage of the reduction, if A(K,K) is occupied
%    by a free element, it is interchanged with the largest free element
%    A(L,L) with K <= L.
%
%    Input, integer JOB, specifies whether column pivoting is to be done.
%    0, no pivoting is done.
%    nonzero, pivoting is done.
%
%    Output, complex A(LDA,P).  A contains in its upper half the Cholesky factor
%    of the matrix A as it has been permuted by pivoting.
%
%    Output, integer IPVT(P).  IPVT(K) contains the index of the diagonal element
%    of A that was moved into the J-th position, if pivoting was requested.
%
%    Output, integer INFO, contains the index of the last positive
%    diagonal element of the Cholesky factor.
%
  pl = 1;
  pu = 0;
  info = p;

  if ( job ~= 0 )
%
%  Pivoting has been requested.  Rearrange the elements according to IPVT.
%
    for k = 1: p

      swapk = ( 0 < ipvt(k) );
      negk = ( ipvt(k) < 0 );

      if ( negk )
        ipvt(k) = -k;
      else
        ipvt(k) = k;
      end

      if ( swapk )

        if ( k ~= pl )

          temp(1:pl-1) = a(1:pl-1,k);
          a(1:pl-1,k) = a(1:pl-1,pl);
          a(1:pl-1,pl) = temp;

          temp = a(k,k);
          a(k,k) = a(pl,pl);
          a(pl,pl) = temp;

          a(pl,k) = a(pl,k)';
          plp1 = pl + 1;

          for j = plp1 : p

            if ( j < k )
              temp = a(pl,j)';
              a(pl,j) = a(j,k)';
              a(j,k) = temp;
            elseif ( j ~= k )
              temp = a(k,j);
              a(k,j) = a(pl,j);
              a(pl,j) = temp;
            end

          end

          ipvt(k) = ipvt(pl);
          ipvt(pl) = k;

        end

        pl = pl + 1;

      end

    end

    pu = p;

    for kb = pl : p

      k = p - kb + pl;

      if ( ipvt(k) < 0 )

        ipvt(k) = -ipvt(k);

        if ( pu ~= k )

          temp(1:k-1) = a(1:k-1,k);
          a(1:k-1,k) = a(1:k-1,pu);
          a(1:k-1,pu) = temp;

          temp = a(k,k);
          a(k,k) = a(pu,pu);
          a(pu,pu) = temp;

          a(k,pu) = a(k,pu)';

          for j = k + 1 : p

            if ( j < pu )
              temp = a(k,j)';
              a(k,j) = a(j,pu)';
              a(j,pu) = temp;
            elseif ( j ~= pu )
              temp = a(k,j);
              a(k,j) = a(pu,j);
              a(pu,j) = temp;
            end

          end

          temp = ipvt(k);
          ipvt(k) = ipvt(pu);
          ipvt(pu) = temp;

        end

        pu = pu - 1;

      end

    end

  end

  for k = 1 : p
%
%  Reduction loop.
%
    maxdia = real ( a(k,k) );
    maxl = k;
%
%  Determine the pivot element.
%
    if ( pl <= k & k < pu )
      for l = k+1 : pu
        if ( maxdia < real ( a(l,l) ) )
          maxdia = real ( a(l,l) );
          maxl = l;
        end
      end
    end
%
%  Quit if the pivot element is not positive.
%
    if ( maxdia <= 0.0 )
      info = k - 1;
      return
    end
%
%  Start the pivoting and update IPVT.
%
    if ( k ~= maxl )

      km1 = k - 1;

      temp(1:k-1) = a(1:k-1,k);
      a(1:k-1,k) = a(1:k-1,maxl);
      a(1:k-1,maxl) = temp;

      temp = ipvt(maxl);
      ipvt(maxl) = ipvt(k);
      ipvt(k) = temp;

      a(k,maxl) = a(k,maxl)';

    end
%
%  Reduction step.  Pivoting is contained across the rows.
%
    work(k,1) = complex ( sqrt ( real ( a(k,k) ) ), 0.0 );
    a(k,k) = work(k,1);

    for j = k+1 : p

      if ( k ~= maxl )

        if ( j < maxl )
          temp = a(k,j)';
          a(k,j) = a(j,maxl)';
          a(j,maxl) = temp;
        elseif ( j ~= maxl )
          temp = a(k,j);
          a(k,j) = a(maxl,j);
          a(maxl,j) = temp;
        end

      end

      a(k,j) = a(k,j) / work(k,1);
      work(j,1) = a(k,j)';
      temp = -a(k,j);

      a(k+1:j,j) = a(k+1:j,j) + temp * work(k+1:j,1);

    end

  end

  return
end
