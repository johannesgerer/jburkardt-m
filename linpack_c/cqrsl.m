function [ qy, qty, b, rsd, xb, info ] = cqrsl ( x, ldx, n, k, qraux, y, job )

%*****************************************************************************80
%
%% CQRSL solves, transforms or projects systems factored by CQRDC.
%
%  Discussion:
%
%    The routine applies the output of CQRDC to compute coordinate
%    transformations, projections, and least squares solutions.
%
%    For K <= min ( N, P ), let XK be the matrix
%
%      XK = ( X(IPVT(1)), X(IPVT(2)), ... ,X(IPVT(k)) )
%
%    formed from columnns IPVT(1), ... ,IPVT(K) of the original
%    N by P matrix X that was input to CQRDC (if no pivoting was
%    done, XK consists of the first K columns of X in their
%    original order).  CQRDC produces a factored unitary matrix Q
%    and an upper triangular matrix R such that
%
%      XK = Q * ( R )
%               ( 0 )
%
%    This information is contained in coded form in the arrays
%    X and QRAUX.
%
%    The parameters QY, QTY, B, RSD, and XB are not referenced
%    if their computation is not requested and in this case
%    can be replaced by dummy variables in the calling program.
%
%    To save storage, the user may in some cases use the same
%    array for different parameters in the calling sequence.  A
%    frequently occuring example is when one wishes to compute
%    any of B, RSD, or XB and does not need Y or QTY.  In this
%    case one may identify Y, QTY, and one of B, RSD, or XB, while
%    providing separate arrays for anything else that is to be
%    computed.  Thus the calling sequence
%
%      call cqrsl ( x, ldx, n, k, qraux, y, dum, y, b, y, dum, 110, info )
%
%    will result in the computation of B and RSD, with RSD
%    overwriting Y.  More generally, each item in the following
%    list contains groups of permissible identifications for
%    a single callinng sequence.
%
%    1. ( Y, QTY, B )   ( RSD )      ( XB )  ( QY )
%    2. ( Y, QTY, RSD ) ( B )        ( XB )  ( QY )
%    3. ( Y, QTY, XB )  ( B )        ( RSD ) ( QY )
%    4. ( Y, QY )       ( QTY, B )   ( RSD ) ( XB )
%    5. ( Y, QY )       ( QTY, RSD ) ( B )   ( XB )
%    6. ( Y, QY )       ( QTY, XB )  ( B )   ( RSD )
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
%    Input, complex X(LDX,P), the output of CQRDC.
%
%    Input, integer LDX, the leading dimension of X.
%
%    Input, integer N, the number of rows of the matrix XK, which
%    must have the same value as N in CQRDC.
%
%    Input, integer K, the number of columns of the matrix XK.  K must not
%    be greater than min ( N, P), where P is the same as in the calling 
%    sequence to CQRDC.
%
%    Input, complex QRAUX(P), the auxiliary output from CQRDC.
%
%    Input, complex Y(N), a vector that is to be manipulated by CQRSL.
%
%    Input, integer JOB, specifies what is to be computed.  JOB has
%    the decimal expansion ABCDE, meaning:
%    if A /= 0, compute QY.
%    if B, D, D, or E /= 0, compute QTY.
%    if C /= 0, compute B.
%    if D /= 0, compute RSD.
%    if E /= 0, compute XB.
%    A request to compute B, RSD, or XB automatically triggers the 
%    computation of QTY, for which an array must be provided in the 
%    calling sequence.
%
%    Output, complex QY(N), contains Q*Y, if it has been requested.
%
%    Output, complex QTY(N), contains hermitian(Q)*Y, if it has
%    been requested.  Here hermitian(Q) is the conjugate transpose 
%    of the matrix Q.
%
%    Output, complex B(K), the solution of the least squares problem
%      minimize norm2 ( Y - XK * B ),
%    if it has been requested.  If pivoting was requested in CQRDC, 
%    the J-th component of B will be associated with column IPVT(J)
%    of the original matrix X that was input into CQRDC.
%
%    Output, complex RSD(N), the least squares residual Y - XK*B,
%    if it has been requested.  RSD is also the orthogonal projection
%    of Y onto the orthogonal complement of the column space of XK.
%
%    Output, complex XB(N), the least squares approximation XK*N,
%    if its computation has been requested.  XB is also the orthogonal 
%    projection of Y onto the column space of X.
%
%    Output, integer INFO, is zero unless the computation of B has
%    been requested and R is exactly singular.  In this case, INFO is the 
%    index of the first zero diagonal element of R and B is left unaltered.
%
  qy = [];
  qty = [];
  b = [];
  rsd = [];
  xb = [];
  info = 0;
%
%  Determine what is to be computed.
%
  cqy =  ( floor (       job / 10000        ) ~= 0 );
  cqty = (         mod ( job,  10000 )        ~= 0 );
  cb =   ( floor ( mod ( job,   1000 ) /100 ) ~= 0 );
  cr =   ( floor ( mod ( job,    100 ) / 10 ) ~= 0 );
  cxb =  (         mod ( job,     10 )        ~= 0 );

  ju = min ( k, n - 1 );
%
%  Special action when N=1.
%
  if ( ju == 0 )

    if ( cqy )
      qy(1) = y(1);
    end

    if ( cqty )
      qty(1) = y(1);
    end

    if ( cxb )
      xb(1) = y(1);
    end

    if ( cb )
      if ( cabs1 ( x(1,1) ) == 0.0 )
        info = 1;
      else
        b(1) = y(1) / x(1,1);
      end
    end

    if ( cr )
      rsd(1) = 0.0;
    end

    return

  end
%
%  Set up to compute QY or QTY.
%
  if ( cqy )
    qy(1:n) = y(1:n);
  end

  if ( cqty )
    qty(1:n) = y(1:n);
  end
%
%  Compute QY.
%
  if ( cqy )

    for jj = 1 : ju

      j = ju - jj + 1;

      if ( cabs1 ( qraux(j) ) ~= 0.0 )
        temp = x(j,j);
        x(j,j) = qraux(j);
        t = - ( qy(j:n) * conj ( x(j:n,j) ) ) / x(j,j);
        qy(j:n) = qy(j:n) + t * transpose ( x(j:n,j) );
        x(j,j) = temp;
      end

    end

  end
%
%  Compute hermitian ( A ) * Y.
%
  if ( cqty )
    for j = 1 : ju
      if ( cabs1 ( qraux(j) ) ~= 0.0 )
        temp = x(j,j);
        x(j,j) = qraux(j);
        t = - ( qty(j:n) * conj ( x(j:n,j) ) ) / x(j,j);
        qty(j:n) = qty(j:n) + t * x(j:n,j);
        x(j,j) = temp;
      end
    end
  end
%
%  Set up to compute B, RSD, or XB.
%
  if ( cb )
    b(1:k) = qty(1:k);
  end

  kp1 = k + 1;

  if ( cxb )
    xb(1:k) = qty(1:k);
  end

  if ( cr & k < n )
    rsd(k+1:n) = qty(k+1:n);
  end

  if ( cxb )
    xb(k+1:n) = 0.0;
  end

  if ( cr )
    rsd(1:k) = 0.0;
  end
%
%  Compute B.
%
  if ( cb )

    for jj = 1 : k

      j = k - jj + 1;

      if ( cabs1 ( x(j,j) ) == 0.0 )
        info = j;
        break
      end

      b(j) = b(j) / x(j,j);

      if ( j ~= 1 )
        t = -b(j);
        b(1:j-1) = b(1:j-1) + t * x(1:j-1,j);
      end

    end

  end

  if ( cr | cxb )
%
%  Compute RSD or XB as required.
%
    for jj = 1 : ju

      j = ju - jj + 1;

      if ( cabs1 ( qraux(j) ) ~= 0.0 )

        temp = x(j,j);
        x(j,j) = qraux(j);

        if ( cr )
          t = - ( rsd(j:n) * conj ( x(j:n,j) ) ) / x(j,j);
          rsd(j:n) = rsd(j:n) + t * x(j:n,j);
        end

        if ( cxb )
          t = - ( xb(j:n) * conj ( x(j:n,j) ) ) / x(j,j);
          xb(j:n) = xb(j:n) + t * x(j:n,j);
        end

        x(j,j) = temp;

      end

    end

  end

  return
end
