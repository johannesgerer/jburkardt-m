function [ qy, qty, b, rsd, ab, info ] = dqrsl ( a, lda, n, k, qraux, y, job )

%*****************************************************************************80
%
%% DQRSL computes transformations, projections, and least squares solutions.
%
%  Discussion:
%
%    DQRSL requires the output of DQRDC.
%
%    For K <= min(N,P), let AK be the matrix
%
%      AK = ( A(JPVT(1)), A(JPVT(2)), ..., A(JPVT(K)) )
%
%    formed from columns JPVT(1), ..., JPVT(K) of the original
%    N by P matrix A that was input to DQRDC.  If no pivoting was
%    done, AK consists of the first K columns of A in their
%    original order.  DQRDC produces a factored orthogonal matrix Q
%    and an upper triangular matrix R such that
%
%      AK = Q * (R)
%               (0)
%
%    This information is contained in coded form in the arrays
%    A and QRAUX.
%
%    The parameters QY, QTY, B, RSD, and AB are not referenced
%    if their computation is not requested and in this case
%    can be replaced by dummy variables in the calling program.
%    To save storage, the user may in some cases use the same
%    array for different parameters in the calling sequence.  A
%    frequently occuring example is when one wishes to compute
%    any of B, RSD, or AB and does not need Y or QTY.  In this
%    case one may identify Y, QTY, and one of B, RSD, or AB, while
%    providing separate arrays for anything else that is to be
%    computed.
%
%    Thus the calling sequence
%
%      call dqrsl ( a, lda, n, k, qraux, y, dum, y, b, y, dum, 110, info )
%
%    will result in the computation of B and RSD, with RSD
%    overwriting Y.  More generally, each item in the following
%    list contains groups of permissible identifications for
%    a single calling sequence.
%
%      1. (Y,QTY,B) (RSD) (AB) (QY)
%
%      2. (Y,QTY,RSD) (B) (AB) (QY)
%
%      3. (Y,QTY,AB) (B) (RSD) (QY)
%
%      4. (Y,QY) (QTY,B) (RSD) (AB)
%
%      5. (Y,QY) (QTY,RSD) (B) (AB)
%
%      6. (Y,QY) (QTY,AB) (B) (RSD)
%
%    In any group the value returned in the array allocated to
%    the group corresponds to the last member of the group.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2005
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
%    Input, real A(LDA,P), contains the output of DQRDC.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the number of rows of the matrix AK.  It must
%    have the same value as N in DQRDC.
%
%    Input, integer K, the number of columns of the matrix AK.  K
%    must not be greater than min(N,P), where P is the same as in the
%    calling sequence to DQRDC.
%
%    Input, real QRAUX(P), the auxiliary output from DQRDC.
%
%    Input, real Y(N), a vector to be manipulated by DQRSL.
%
%    Input, integer JOB, specifies what is to be computed.  JOB has
%    the decimal expansion ABCDE, with the following meaning:
%      if A /= 0, compute QY.
%      if B /= 0, compute QTY.
%      if C /= 0, compute QTY and B.
%      if D /= 0, compute QTY and RSD.
%      if E /= 0, compute QTY and AB.
%    Note that a request to compute B, RSD, or AB automatically triggers
%    the computation of QTY, for which an array must be provided in the
%    calling sequence.
%
%    Output, real QY(N), contains Q * Y, if requested.
%
%    Output, real QTY(N), contains Q' * Y, if requested.
%
%    Output, real B(K), the solution of the least squares problem
%      minimize norm2 ( Y - AK * B),
%    if its computation has been requested.  Note that if pivoting was
%    requested in DQRDC, the J-th component of B will be associated with
%    column JPVT(J) of the original matrix A that was input into DQRDC.
%
%    Output, real RSD(N), the least squares residual Y - AK * B,
%    if its computation has been requested.  RSD is also the orthogonal
%    projection of Y onto the orthogonal complement of the column space
%    of AK.
%
%    Output, real AB(N), the least squares approximation Ak * B,
%    if its computation has been requested.  AB is also the orthogonal
%    projection of Y onto the column space of A.
%
%    Output, integer INFO, is zero unless the computation of B has
%    been requested and R is exactly singular.  In this case, INFO is the
%    index of the first zero diagonal element of R, and B is left unaltered.
%

%
%  Set info flag.
%
  info = 0;
%
%  Determine what is to be computed.
%
  cqy =  floor       ( job / 10000         ) ~= 0;
  cqty =         mod ( job,  10000 )         ~= 0;
  cb =   floor ( mod ( job,   1000 ) / 100 ) ~= 0;
  cr =   floor ( mod ( job,    100 ) /  10 ) ~= 0;
  cab =          mod ( job,     10 )       ~= 0;

  ju = min ( k, n - 1 );
%
%  Special action when N = 1.
%
  if ( ju == 0 )

    qy(1) = y(1);
    qty(1) = y(1);
    ab(1) = y(1);

    if ( a(1,1) == 0.0 )
      info = 1;
    else
      b(1) = y(1) / a(1,1);
    end

    rsd(1) = 0.0;

    return

  end
%
%  Set up to compute QY or QTY.
%
  qy(1:n) = y(1:n);
  qty(1:n) = y(1:n);
%
%  Compute QY.
%
  if ( cqy )

    for jj = 1 : ju

      j = ju - jj + 1;

      if ( qraux(j) ~= 0.0 )
        temp = a(j,j);
        a(j,j) = qraux(j);
        t = -ddot ( n-j+1, a(j:n,j), 1, qy(j:n), 1 ) / a(j,j);
        qy(j:n) = daxpy ( n-j+1, t, a(j:n,j)', 1, qy(j:n), 1 );
        a(j,j) = temp;
      end

    end

  end
%
%  Compute Q'*Y.
%
  if ( cqty )

    for j = 1 : ju
      if ( qraux(j) ~= 0.0 )
        temp = a(j,j);
        a(j,j) = qraux(j);
        t = -ddot ( n-j+1, a(j:n,j), 1, qty(j:n), 1 ) / a(j,j);
        qty(j:n) = daxpy ( n-j+1, t, a(j:n,j), 1, qty(j:n), 1 );
        a(j,j) = temp;
      end
    end

  end
%
%  Set up to compute B, RSD, or AB.
%
  b(1:k) = qty(1:k);
  ab(1:k) = qty(1:k);
  rsd(k+1:n) = qty(k+1:n);
  ab(k+1:n) = 0.0;
  rsd(1:k) = 0.0;
%
%  Compute B.
%
  if ( cb )

    for jj = 1 : k

      j = k - jj + 1;

      if ( a(j,j) == 0.0 )
        info = j;
        break
      end

      b(j) = b(j) / a(j,j);

      if ( j ~= 1 )
        t = -b(j);
        b(1:j-1) = daxpy ( j-1, t, a(1:j-1,j), 1, b(1:j-1), 1 );
      end

    end

  end
%
%  Compute RSD or AB as required.
%
  if ( cr | cab )

    for jj = 1 : ju

      j = ju - jj + 1;

      if ( qraux(j) ~= 0.0 )

        temp = a(j,j);
        a(j,j) = qraux(j);

        if ( cr )
          rsd(j:n) = -ddot ( n-j+1, a(j:n,j), 1, rsd(j:n), 1 ) / a(j,j);
          rsd(j:n) = daxpy ( n-j+1, t, a(j:n,j), 1, rsd(j:n), 1 );
        end

        if ( cab )
          t = -ddot ( n-j+1, a(j:n,j), 1, ab(j:n), 1 ) / a(j,j);
          ab(j:n) = daxpy ( n-j+1, t, a(j:n,j), 1, ab(j:n), 1 );
        end

        a(j,j) = temp;

      end
    end
  end

  return
end
