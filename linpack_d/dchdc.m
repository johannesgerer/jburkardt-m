function [ a, ipvt, info ] = dchdc ( a, lda, p, ipvt, job )

%*****************************************************************************80
%
%% DCHDC computes the Cholesky decomposition of a positive definite matrix.
%
%  Discussion:
%
%    A pivoting option allows the user to estimate the condition of a
%    positive definite matrix or determine the rank of a positive
%    semidefinite matrix.
%
%    For positive definite matrices, INFO = P is the normal return.
%
%    For pivoting with positive semidefinite matrices, INFO will
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
%    Input, real A(LDA,P), the matrix whose decomposition is to
%    be computed.  Only the upper half of A need be stored.
%    The lower part of the array a is not referenced.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer P, the order of the matrix.
%
%    Input, integer IPVT(P), integers that control the selection
%    of the pivot elements, if pivoting has been requested.
%    Each diagonal element A(K,K) is placed in one of three classes
%    according to the value of IPVT(K).
%
%      > 0, then X(K) is an initial element.
%      = 0, then X(K) is a free element.
%      < 0, then X(K) is a final element.
%
%    Before the decomposition is computed, initial elements are moved by
%    symmetric row and column interchanges to the beginning of the array A
%    and final elements to the end.  Both initial and final elements are
%    frozen in place during the computation and only free elements are moved.
%    At the K-th stage of the reduction, if A(K,K) is occupied by a free
%    element, it is interchanged with the largest free element A(L,L) with
%    K <= L.  IPVT is not referenced if JOB is 0.
%
%    Input, integer JOB, initiates column pivoting.
%    0, no pivoting is done.
%    nonzero, pivoting is done.
%
%    Output, real A(LDA,P), contains in its upper half the Cholesky factor
%    of the input matrix, as it has been permuted by pivoting.
%
%    Output, integer IPVT(N); IPVT(J) contains the index of the diagonal element
%    of A that was moved into the J-th position, if pivoting was requested.
%
%    Output, integer INFO, contains the index of the last positive diagonal
%    element of the Cholesky factor.
%
  pl = 1;
  pu = 0;
  info = p;

  if ( job ~= 0 )
%
%  Pivoting has been requested.
%  Rearrange the the elements according to IPVT.
%
    for k = 1 : p

      swapk = 0 < ipvt(k);

      negk = ipvt(k) < 0;

      if ( negk )
        ipvt(k) = -k;
      else
        ipvt(k) = k;
      end

      if ( swapk )

        if ( k ~= pl )

          temp(1:pl-1) = a(1:pl-1,k);
          a(1:pl-1,k) = a(1:pl-1,pl);
          a(1:pl-1,pl) = temp(1:pl-1);

          temp = a(k,k);
          a(k,k) = a(pl,pl);
          a(pl,pl) = temp;

          for j = pl+1 : p

            if ( j < k )
              temp = a(pl,j);
              a(pl,j) = a(j,k);
              a(j,k) = temp;
            elseif ( k < j )
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

    for k = p : -1 : pl

      if ( ipvt(k) < 0 )

        ipvt(k) = -ipvt(k);

        if ( pu ~= k )

          temp(1:k-1) = a(1:k-1,k);
          a(1:k-1,k) = a(1:k-1,pu);
          a(1:k-1,pu) = temp(1:k-1);

          temp = a(k,k);
          a(k,k) = a(pu,pu);
          a(pu,pu) = temp;

          for j = k+1 : p

            if ( j < pu )
              temp = a(k,j);
              a(k,j) = a(j,pu);
              a(j,pu) = temp;
            elseif ( pu < j )
              temp = a(k,j);
              a(k,j) = a(pu,j);
              a(pu,j) = temp;
            end

          end

          jt = ipvt(k);
          ipvt(k) = ipvt(pu);
          ipvt(pu) = jt;

        end

        pu = pu - 1;

      end

    end

  end

  for k = 1 : p
%
%  Reduction loop.
%
    maxdia = a(k,k);
    maxl = k;
%
%  Determine the pivot element.
%
    if ( pl <= k & k < pu )

      for l = k+1 : pu
        if ( maxdia < a(l,l) )
          maxdia = a(l,l);
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

      temp(1:k-1) = a(1:k-1,k);
      a(1:k-1,k) = a(1:k-1,maxl);
      a(1:k-1,maxl) = temp(1:k-1);

      a(maxl,maxl) = a(k,k);
      a(k,k) = maxdia;
      jp = ipvt(maxl);
      ipvt(maxl) = ipvt(k);
      ipvt(k) = jp;

    end
%
%  Reduction step.
%  Pivoting is contained across the rows.
%
    work(k) = sqrt ( a(k,k) );
    a(k,k) = work(k);

    for j = k+1 : p

      if ( k ~= maxl )

        if ( j < maxl )
          temp = a(k,j);
          a(k,j) = a(j,maxl);
          a(j,maxl) = temp;
        elseif ( maxl < j )
          temp = a(k,j);
          a(k,j) = a(maxl,j);
          a(maxl,j) = temp;
        end

      end

      a(k,j) = a(k,j) / work(k);
      work(j) = a(k,j);
      temp = -a(k,j);
      a(k+1:k+j-k,j) = a(k+1:k+j-k,j) + temp * work(k+1:k+j-k)';

    end

  end

  return
end
