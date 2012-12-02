function [ r, z, c, s ] = dchex ( r, ldr, p, k, l, z, ldz, nz, job )

%*****************************************************************************80
%
%% DCHEX updates the Cholesky factorization of a positive definite matrix.
%
%  Discussion:
%
%    The factorization has the form
%
%      A = R' * R
%
%    where A is a positive definite matrix of order P.
%
%    The updating involves diagonal permutations of the form
%
%      E' * A * E
%
%    where E is a permutation matrix.  Specifically, given
%    an upper triangular matrix R and a permutation matrix
%    E (which is specified by K, L, and JOB), DCHEX determines
%    an orthogonal matrix U such that
%
%      U * R * E = RR,
%
%    where RR is upper triangular.  At the user's option, the
%    transformation U will be multiplied into the array Z.
%    If A = X'*X, so that R is the triangular part of the
%    QR factorization of X, then RR is the triangular part of the
%    QR factorization of X*E, that is, X with its columns permuted.
%
%    For a less terse description of what DCHEX does and how
%    it may be applied, see the LINPACK guide.
%
%    The matrix Q is determined as the product U(L-K)*...*U(1)
%    of plane rotations of the form
%
%      (    C(I)       S(I) )
%      (                    ),
%      (   -S(I)       C(I) )
%
%    where C(I) is real, the rows these rotations operate on
%    are described below.
%
%    There are two types of permutations, which are determined
%    by the value of JOB.
%
%    1, right circular shift.  The columns are rearranged in the order:
%
%         1,...,K-1,L,K,K+1,...,L-1,L+1,...,P.
%
%       U is the product of L-K rotations U(I), where U(I)
%       acts in the (L-I,L-I+1)-plane.
%
%    2, left circular shift: the columns are rearranged in the order
%
%         1,...,K-1,K+1,K+2,...,L,K,L+1,...,P.
%
%       U is the product of L-K rotations U(I), where U(I)
%       acts in the (K+I-1,K+I)-plane.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Moler, Bunch, Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real R(LDR,P), the upper triangular factor that is to be updated.  
%    Elements of R below the diagonal are not referenced.
%
%    Input, integer LDR, the leading dimension of the array R.
%    LDR must be at least P.
%
%    Input, integer P, the order of the matrix R.
%
%    Input, integer K, the first column to be permuted.
%
%    Input, integer L, the last column to be permuted.
%    L must be strictly greater than K.
%
%    Input, real Z(LDZ,NZ), an array of NZ P-vectors into
%    which the transformation U is multiplied.  Z is not referenced if NZ = 0.
%
%    Input, integer LDZ, the leading dimension of the array Z.
%    LDZ must be at least P.
%
%    Input, integer NZ, the number of columns of the matrix Z.
%
%    Input, integer JOB, determines the type of permutation.
%    1, right circular shift.
%    2, left circular shift.
%
%    Output, real R(LDR,P), the updated upper triangular factor.
%
%    Output real Z(LDZ,NZ), the updated array of vectors.
%
%    Output, real C(P), S(P), the cosines and sines of the
%    transforming rotations.
%

%
%  Initialize
%
  lmk = l - k;
  lm1 = l - 1;
%
%  Right circular shift.
%
  if ( job == 1 )
%
%  Reorder the columns.
%
    for i = 1 : l
      ii = l - i + 1;
      s(i) = r(ii,l);
    end

    for jj = k : lm1
      j = lm1 - jj + k;
      for i = 1 : j
        r(i,j+1) = r(i,j);
      end
      r(j+1,j+1) = 0.0;
    end

    for i = 1 : k-1
      ii = l - i + 1;
      r(i,k) = s(ii);
    end
%
%  Calculate the rotations.
%
    t = s(1);
    for i = 1 : lmk
      [ c(i), s(i), s(i+1), t ] = drotg ( s(i+1), t );
      t = s(i+1);
    end

    r(k,k) = t;

    for j = k+1 : p
      il = max ( 1, l-j+1 );
      for ii = il : lmk
        i = l - ii;
        t = c(ii) * r(i,j) + s(ii) * r(i+1,j);
        r(i+1,j) = c(ii) * r(i+1,j) - s(ii) * r(i,j);
        r(i,j) = t;
      end
    end
%
%  If required, apply the transformations to Z.
%
    for j = 1 : nz
      for ii = 1 : lmk
        i = l - ii;
        t = c(ii) * z(i,j) + s(ii) * z(i+1,j);
        z(i+1,j) = c(ii) * z(i+1,j) - s(ii) * z(i,j);
        z(i,j) = t;
      end
    end
%
%  Left circular shift.
%
  else
%
%  Reorder the columns.
%
    for i = 1 : k
      ii = lmk + i;
      s(ii) = r(i,k);
    end

    for j = k : lm1
      for i = 1 : j;
        r(i,j) = r(i,j+1);
      end
      jj = j - k + 1;
      s(jj) = r(j+1,j+1);
    end

    for i = 1 : k
      ii = lmk + i;
      r(i,l) = s(ii);
    end

    r(k+1:l,l) = 0.0;
%
%  Reduction loop.
%
    for j = k : p
%
%  Apply the rotations.
%
      if ( j ~= k )

        iu = min ( j-1, l-1 );

        for i = k : iu
          ii = i - k + 1;
          t = c(ii) * r(i,j) + s(ii) * r(i+1,j);
          r(i+1,j) = c(ii) * r(i+1,j) - s(ii) * r(i,j);
          r(i,j) = t;
        end

      end

      if ( j < l )
        jj = j - k + 1;
        t = s(jj);
        [ c(jj), s(jj), r(j,j), t ] = drotg ( r(j,j), t );
      end

    end
%
%  Apply the rotations to Z.
%
    for j = 1 : nz
      for i = k : lm1
        ii = i - k + 1;
        t = c(ii) * z(i,j) + s(ii) * z(i+1,j);
        z(i+1,j) = c(ii) * z(i+1,j) - s(ii) * z(i,j);
        z(i,j) = t;
      end
    end

  end

  return
end
