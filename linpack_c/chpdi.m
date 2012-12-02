function [ ap, det, inert ] = chpdi ( ap, n, ipvt, job )

%*****************************************************************************80
%
%% CHPDI: determinant, inertia and inverse of a complex hermitian matrix.
%
%  Discussion:
%
%    The routine uses the factors from CHPFA.
%
%    The matrix is stored in packed form.
%
%    A division by zero will occur if the inverse is requested and CHPCO has
%    set RCOND == 0.0 or CHPFA has set INFO ~= 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 May 2007
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
%    Input, complex AP(N*(N+1)/2); the factored matrix
%    from CHPFA.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer IPVT(N), the pivot vector from CHPFA.
%
%    Input, integer JOB, has the decimal expansion ABC where:
%    if C ~= 0, the inverse is computed,
%    if B ~= 0, the determinant is computed,
%    if A ~= 0, the inertia is computed.
%    For example, JOB = 111 gives all three.
%
%    Output, complex AP(N*(N+1)/2); if the inverse was requested, then 
%    the upper triangle of the inverse of the original matrix, stored in packed
%    form.  The columns of the upper triangle are stored sequentially in a
%    one-dimensional array.
%
%    Output, real DET(2), if requested, the determinant of the original matrix.
%    Determinant = DET(1) * 10.0**DET(2) with 1.0 <= abs ( DET(1) ) < 10.0
%    or DET(1) = 0.0.
%
%    Output, integer INERT(3), if requested, the inertia of the original matrix.
%    INERT(1) = number of positive eigenvalues.
%    INERT(2) = number of negative eigenvalues.
%    INERT(3) = number of zero eigenvalues.
%
  det = [];
  inert = [];

  noinv = mod ( job, 10 ) == 0;
  nodet = floor ( mod ( job, 100 ) / 10 ) == 0;
  noert = floor ( mod ( job, 1000 ) / 100 ) == 0;

  if ( ~nodet | ~noert )

    if ( ~noert )
      inert(1:3) = 0;
    end

    if ( ~nodet )
      det(1) = 1.0;
      det(2) = 0.0;
    end

    t = 0.0;
    ik = 0;

    for k = 1 : n

      kk = ik + k;
      d = real ( ap(kk) );
%
%  Check if 1 by 1
%
      if ( ipvt(k) <= 0 )
%
%  2 by 2 block
%  Use DET (D  S; S  C)  =  ( D / T * C - T ) * T, T = abs ( S )
%  to avoid underflow/overflow troubles.
%  Take two passes through scaling.  Use T for flag.
%
        if ( t == 0.0 )
          ikp1 = ik + k;
          kkp1 = ikp1 + k;
          t = abs ( ap(kkp1) );
          d = ( d / t ) * real ( ap(kkp1+1) ) - t;
        else
          d = t;
          t = 0.0;
        end

      end

      if ( ~noert )

        if ( 0.0 < d )
          inert(1) = inert(1) + 1;
        elseif ( d < 0.0 )
          inert(2) = inert(2) + 1;
        elseif ( d == 0.0 )
          inert(3) = inert(3) + 1;
        end

      end

      if ( ~nodet )

        det(1) = det(1) * d;

        if ( det(1) ~= 0.0 )

          while ( abs ( det(1) ) < 1.0 )
            det(1) = det(1) * 10.0;
            det(2) = det(2) - 1.0;
          end

          while ( 10.0 <= abs ( det(1) ) )
            det(1) = det(1) / 10.0;
            det(2) = det(2) + 1.0;
          end

        end

      end

      ik = ik + k;

    end

  end
%
%  Compute inverse(A).
%
  if ( ~noinv )

    k = 1;
    ik = 0;

    while ( k <= n )

      km1 = k - 1;
      kk = ik + k;
      ikp1 = ik + k;
      kkp1 = ikp1 + k;
%
%  1 by 1
%
      if ( 0 <= ipvt(k) )

        ap(kk) = 1.0 / real ( ap(kk) );

        if ( 1 <= km1 )

          work(1:km1) = ap(ik+1:ik+km1);

          ij = 0;
          for j = 1 : km1
            jk = ik + j;
            ap(jk) = conj ( ap(ij+1:ij+j) ) * tranpose ( work(1:j) );
            ap(ik+1:ik+j-1) = ap(ik+1:ik+j-1) + work(j) * ap(ij+1:ij+j-1);
            ij = ij + j;
          end

          ap(kk) = ap(kk) + real ( conj ( work(1:km1) ) * transpose ( ap(ik+1:ik+km1) ) );

        end

        kstep = 1;
%
%  2 by 2
%
      else

        t = abs ( ap(kkp1) );
        ak = real ( ap(kk) ) / t;
        akp1 = real ( ap(kkp1+1) ) / t;
        akkp1 = ap(kkp1) / t;
        d = t * ( ak * akp1 - 1.0 );
        ap(kk) = akp1 / d;
        ap(kkp1+1) = ak / d;
        ap(kkp1) = -akkp1 / d;

        if ( 1 <= km1 )

          work(1:km1) = ap(ikp1+1:ikp1+km1);

          ij = 0;
          for j = 1 : km1
            jkp1 = ikp1 + j;
            ap(jkp1) = conj ( ap(ij+1:ij+j) ) * transpose ( work(1:j) );
            ap(ikp1+1:ikp1+j-1) = ap(ikp1+1:ikp1+j-1) ...
              + work(j) * ap(ij+1:ij+j-1);
            ij = ij + j;
          end

          ap(kkp1+1) = ap(kkp1+1) ...
            + real ( conj ( work(1:km1) ) * transpose ( ap(ikp1+1) ) );

          ap(kkp1) = ap(kkp1) ...
            + conj ( ap(ik+1:ik+km1) ) * transpose ( ap(ikp1+1:ikp1+km1) );

          work(1:km1) = ap(ik+1:ik+km1);

          ij = 0;

          for j = 1 : km1
            jk = ik + j;
            ap(jk) = conj ( ap(ij+1:ij+j) ) * transpose ( work(1:j) );
            ap(ik+1:ik+j-1) = ap(ik+1:ik+j-1) + work(j) * ap(ij+1:ij+j-1);
            ij = ij + j;
          end

          ap(kk) = ap(kk) ...
            + real ( conj ( work(1:km1) ) * transpose ( ap(ik+1:ik+km1) ) );

        end

        kstep = 2;

      end
%
%  Swap
%
      ks = abs ( ipvt(k) );

      if ( ks ~= k )

        iks = ( ks * ( ks - 1 ) ) / 2;

        temp             = ap(iks+1:iks+ks);
        ap(iks+1:iks+ks) = ap(ik+1:ik+ks);
        ap(ik+1:ik+ks)   = temp;

        ksj = ik + ks;

        for jb = ks : k
            
          j = k + ks - jb;
          jk = ik + j;
          
          temp    = conj ( ap(jk) );
          ap(jk)  = conj ( ap(ksj) );
          ap(ksj) = temp;
          
          ksj = ksj - ( j - 1 );
          
        end

        if ( kstep ~= 1 )
            
          kskp1 = ikp1 + ks;
          
          temp      = ap(kskp1);
          ap(kskp1) = ap(kkp1);
          ap(kkp1)  = temp;
          
        end

      end

      ik = ik + k;

      if ( kstep == 2 )
        ik = ik + k + 1;
      end

      k = k + kstep;

    end

  end

  return
end
