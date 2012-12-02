function [ s, e, u, v, info ] = csvdc ( x, ldx, n, p, ldu, ldv, job )

%*****************************************************************************80
%
%% CSVDC applies the singular value decompostion to an N by P matrix.
%
%  Discussion:
%
%    The routine reduces a complex N by P matrix X, by unitary transformations 
%    U and V, to diagonal form.  
%
%    The diagonal elements, S(I), are the singular values of Z.  The
%    columns of U are the corresponding left singular vectors,
%    and the columns of V the right singular vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2007
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
%    Input, complex X(LDX,P); the matrix whose singular value
%    decomposition is to be computed.
%
%    Input, integer LDX, the leading dimension of X.  N <= LDX.
%
%    Input, integer N, the number of rows of the matrix.
%
%    Input, integer P, the number of columns of the matrix X.
%
%    Input, integer LDU, the leading dimension of U.  N <= LDU.
%
%    Input, integer LDV, the leading dimension of V.  P <= LDV.
%
%    Input, integer JOB, controls the computation of the singular vectors.  
%    It has the decimal expansion AB meaning:
%    A =  0, do not compute the left singular vectors.
%    A =  1, return the N left singular vectors in U.
%    A >= 2, returns the first min ( N, P ) left singular vectors in U.
%    B =  0, do not compute the right singular vectors.
%    B =  1, return the right singular vectors in V.
%
%    Output, complex S(MM), where MM = max ( N + 1, P ), the first min ( N, P ) 
%    entries of S contain the singular values of X arranged in descending
%    order of magnitude.
%
%    Output, complex E(MM), where MM = max ( N + 1, P ), ordinarily 
%    contains zeros on output.  However, see the discussion of INFO 
%    for exceptions.
%
%    Output, complex U(LDU,K).  If JOBA == 1 then K == n; if JOBA >= 2,
%    then K == min ( N, P ).  U contains the matrix of left singular vectors.
%    U is not referenced if JOBA == 0.  
%
%    Output, complex V(LDV,P), if requested, the matrix of right singular 
%    vectors.  
%
%    Output, integer INFO.  The singular values and their corresponding
%    singular vectors, S(INFO+1), S(INFO+2),..., S(M) are correct.  Here 
%    M = min ( N, P ).  Thus if INFO == 0, all the singular values and 
%    their vectors are correct.  In any event, the matrix
%      B = hermitian(U)*X*V 
%    is the bidiagonal matrix with the elements of S on its diagonal 
%    and the elements of E on its super-diagonal.  Hermitian(U)
%    is the conjugate-transpose of U.  Thus the singular values of X 
%    and B are the same.
%
  maxit = 30;
  u = [];
  v = [];
%
%  Determine what is to be computed.
%
  wantu = 0;
  wantv = 0;
  jobu = floor ( mod ( job, 100 ) / 10 );

  if ( 1 < jobu )
    ncu = min ( n, p );
  else
    ncu = n;
  end

  if ( jobu ~= 0 )
    wantu = 1;
  end

  if ( mod ( job, 10 ) ~= 0 )
    wantv = 1;
  end
%
%  Reduce X to bidiagonal form, storing the diagonal elements
%  in S and the super-diagonal elements in E.
%
  info = 0;
  nct = min ( n - 1, p );
  nrt = max ( 0, min ( p - 2, n ) );
  lu = max ( nct, nrt );

  for l = 1 : lu
%
%  Compute the transformation for the L-th column and
%  place the L-th diagonal in S(L).
%
    if ( l <= nct )

      s(l) = scnrm2 ( n-l+1, x(l:n,l), 1 );

      if ( cabs1 ( s(l) ) ~= 0.0 )

        if ( cabs1 ( x(l,l) ) ~= 0.0 )
          s(l) = csign2 ( s(l), x(l,l) );
        end

        x(l:n,l) = x(l:n,l) / s(l);
        x(l,l) = 1.0 + x(l,l);

      end

      s(l) = -s(l);

    end

    for j = l + 1 : p

      if ( l <= nct )
        if ( cabs1 ( s(l) ) ~= 0.0 )
          t = - ( conj ( transpose ( x(l:n,l) ) ) * x(l:n,j) ) / x(l,l);
          x(l:n,j) = x(l:n,j) + t * x(l:n,l);
        end
      end
%
%  Place the L-th row of X into E for the
%  subsequent calculation of the row transformation.
%
      e(j) = conj ( x(l,j) );

    end
%
%  Place the transformation in U for subsequent back multiplication.
%
    if ( wantu & l <= nct )
      u(l:n,l) = x(l:n,l);
    end

    if ( l <= nrt )
%
%  Compute the L-th row transformation and place the
%  L-th super-diagonal in E(L).
%
      e(l) = scnrm2 ( p-l, e(l+1:p), 1 );

      if ( cabs1 ( e(l) ) ~= 0.0 )

        if ( cabs1 ( e(l+1) ) ~= 0.0 )
          e(l) = csign2 ( e(l), e(l+1) );
        end

        e(l+1:p) = e(l+1:p) / e(l);
        e(l+1) = 1.0 + e(l+1);

      end

      e(l) = -conj ( e(l) );
%
%  Apply the transformation.
%
      if ( l+1 <= n & cabs1 ( e(l) ) ~= 0.0 );

        work(l+1:n) = 0.0;

        for j = l+1 : p
          work(l+1:n) = work(l+1:n) + e(j) * transpose ( x(l+1:n,j) );
        end

        for j = l+1 : p
          x(l+1:n,j) = x(l+1:n,j) ...
            + conj ( -e(j) / e(l+1) ) * transpose ( work(l+1:n) );
        end

      end
%
%  Place the transformation in V for subsequent back multiplication.
%
      if ( wantv )
        v(l+1:p,l) = transpose ( e(l+1:p) );
      end

    end

  end
%
%  Set up the final bidiagonal matrix of order M.
%
  m = min ( p, n + 1 );
  nctp1 = nct + 1;
  nrtp1 = nrt + 1;

  if ( nct < p )
    s(nctp1) = x(nctp1,nctp1);
  end

  if ( n < m )
    s(m) = 0.0;
  end

  if ( nrtp1 < m )
    e(nrtp1) = x(nrtp1,m);
  end

  e(m) = 0.0;
%
%  If required, generate U.
%
  if ( wantu )

    for j = nctp1 : ncu
      u(1:n,j) = 0.0;
      u(j,j) = 1.0;
    end

    for ll = 1 : nct

      l = nct - ll + 1;

      if ( cabs1 ( s(l) ) ~= 0.0 )

        for j = l+1 : ncu
          t = - ( conj ( transpose ( u(l:n,l) ) ) * u(l:n,j) ) / u(l,l);
          u(l:n,j) = u(l:n,j) + t * u(l:n,l);
        end

        u(l:n,l) = - u(l:n,l);
        u(l,l) = 1.0 + u(l,l);
        u(1:l-1,l) = 0.0;

      else

        u(1:n,l) = 0.0;
        u(l,l) = 1.0;

      end

    end

  end
%
%  If it is required, generate V.
%
  if ( wantv )

    for ll = 1 : p

      l = p - ll + 1;

      if ( l <= nrt )

        if ( cabs1 ( e(l) ) ~= 0.0 )
          for j = l+1 : p
            t = - ( conj ( transpose ( v(l+1:p,l) ) ) * v(l+1:p,j) ) / v(l+1,l);
            v(l+1:p,j) = v(l+1:p,j) + t * v(l+1:p,l);
          end
        end

      end

      v(1:p,l) = 0.0;
      v(l,l) = 1.0;

    end

  end
%
%  Transform S and E so that they are real.
%
  for i = 1 : m

    if ( cabs1 ( s(i) ) ~= 0.0 )

      t = abs ( s(i) );
      r = s(i) / t;
      s(i) = t;

      if ( i < m )
        e(i) = e(i) / r;
      end

      if ( wantu )
        u(1:n,i) = u(1:n,i) * r;
      end

    end

    if ( i == m )
      break
    end

    if ( cabs1 ( e(i) ) ~= 0.0 )

      t = abs ( e(i) );
      r = t / e(i);
      e(i) = t;
      s(i+1) = s(i+1) * r;

      if ( wantv )
        v(1:p,i+1) = v(1:p,i+1) * r;
      end

    end

  end
%
%  Main iteration loop for the singular values.
%
  mm = m;
  iter = 0;

  while ( 1 )
%
%  Quit if all the singular values have been found.
%
    if ( m == 0 )
      break
    end
%
%  If too many iterations have been performed, set flag and return.
%
    if ( maxit <= iter )
      info = m;
      break
    end
%
%  This section of the program inspects for negligible elements in S and E.
%
%  On completion, the variables KASE and L are set as follows.
%
%  KASE = 1     if S(M) and E(L-1) are negligible and L < M
%  KASE = 2     if S(L) is negligible and L < M
%  KASE = 3     if E(L-1) is negligible, L < M, and
%               S(L), ..., S(M) are not negligible (QR step).
%  KASE = 4     if E(M-1) is negligible (convergence).
%
    for ll = 1 : m

      l = m - ll;

      if ( l == 0 )
        break
      end

      test = abs ( s(l) ) + abs ( s(l+1) );
      ztest = test + abs ( e(l) );

      if ( ztest == test )
        e(l) = 0.0;
        break
      end

    end

    if ( l == m - 1 )

      kase = 4;

    else

      mp1 = m + 1;

      for lls = l+1 : mp1

        ls = m - lls + l + 1;

        if ( ls == l )
          break
        end

        test = 0.0;

        if ( ls ~= m )
          test = test + abs ( e(ls) );
        end

        if ( ls ~= l + 1 )
          test = test + abs ( e(ls-1) );
        end

        ztest = test + abs ( s(ls) );

        if ( ztest == test )
          s(ls) = 0.0;
          break
        end

      end

      if ( ls == l )
        kase = 3;
      elseif ( ls == m )
        kase = 1;
      else
        kase = 2;
        l = ls;
      end

    end

    l = l + 1;
%
%  Deflate negligible S(M).
%
    if ( kase == 1 )

      mm1 = m - 1;
      f = real ( e(m-1) );
      e(m-1) = 0.0;

      for kk = l : mm1

        k = mm1 - kk + l;
        t1 = real ( s(k) );
        [ cs, sn, t1, f ] = srotg ( t1, f );
        s(k) = t1;

        if ( k ~= l )
          f = -sn * real ( e(k-1) );
          e(k-1) = cs * e(k-1);
        end

        if ( wantv )
          [ v(1:p,k), v(1:p,m) ] = csrot ( p, v(1:p,k), 1, v(1:p,m), 1, cs, sn );
        end

      end
%
%  Split at negligible S(L).
%
    elseif ( kase == 2 )

      f = real ( e(l-1) );
      e(l-1) = 0.0;

      for k = l : m

        t1 = real ( s(k) );
        [ cs, sn, t1, f ] = srotg ( t1, f );
        s(k) = t1;
        f = -sn * real ( e(k) );
        e(k) = cs * e(k);

        if ( wantu )
          [ u(1:n,k), u(1:n,l-1) ] = csrot ( n, u(1:n,k), 1, u(1:n,l-1), 1, cs, sn );
        end

      end
%
%  Perform one QR step.
%
    elseif ( kase == 3 )
%
%  Calculate the shift.
%
      scale = max ( abs ( s(m) ), ...
              max ( abs ( s(m-1) ), ...
              max ( abs ( e(m-1) ), ...
              max ( abs ( s(l) ), abs ( e(l) ) ) ) ) );

      sm = real ( s(m) ) / scale;
      smm1 = real ( s(m-1) ) / scale;
      emm1 = real ( e(m-1) ) / scale;
      sl = real ( s(l) ) / scale;
      el = real ( e(l) ) / scale;
      b = ( ( smm1 + sm ) * ( smm1 - sm ) + emm1^2 ) / 2.0;
      c = ( sm * emm1 )^2;
      shift = 0.0;

      if ( b ~= 0.0 | c ~= 0.0 )
        shift = sqrt ( b^2 + c );
        if ( b < 0.0 )
          shift = -shift;
        end
        shift = c / ( b + shift );
      end

      f = ( sl + sm ) * ( sl - sm ) + shift;
      g = sl * el;
%
%  Chase zeros.
%
      mm1 = m - 1;

      for k = l : mm1

        [ cs, sn, f, g ] = srotg ( f, g );

        if ( k ~= l )
          e(k-1) = f;
        end

        f = cs * real ( s(k) ) + sn * real ( e(k) );
        e(k) = cs * e(k) - sn * s(k);
        g = sn * real ( s(k+1) );
        s(k+1) = cs * s(k+1);

        if ( wantv )
          [ v(1:p,k), v(1:p,k+1) ] = csrot ( p, v(1:p,k), 1, v(1:p,k+1), 1, cs, sn );
        end

        [ cs, sn, f, g ] = srotg ( f, g );
        s(k) = f;
        f = cs * real ( e(k) ) + sn * real ( s(k+1) );
        s(k+1) = -sn * e(k) + cs * s(k+1);
        g = sn * real ( e(k+1) );
        e(k+1) = cs * e(k+1);

        if ( wantu & k < n )
          [ u(1:n,k), u(1:n,k+1) ] = csrot ( n, u(1:n,k), 1, u(1:n,k+1), 1, cs, sn );
        end

      end

      e(m-1) = f;
      iter = iter + 1;
%
%  Convergence.
%
    elseif ( kase == 4 )
%
%  Make the singular value positive.
%
      if ( real ( s(l) ) < 0.0 )
        s(l) = -s(l);
        if ( wantv )
          v(1:p,l) = - v(1:p,l);
        end
      end
%
%  Order the singular values.
%
      while ( l ~= mm )

        if ( real ( s(l+1) ) <= real ( s(l) ) )
          break
        end

        t      = s(l);
        s(l)   = s(l+1);
        s(l+1) = t;

        if ( wantv & l < p )
          temp       = v(1:p,l);
          v(1:p,l)   = v(1:p,l+1);
          v(1:p,l+1) = temp;
        end

        if ( wantu & l < n )
          temp       = u(1:n,l);
          u(1:n,l)   = u(1:n,l+1);
          u(1:n,l+1) = temp;
        end

        l = l + 1;

      end

      iter = 0;
      m = m - 1;

    end

  end

  return
end
