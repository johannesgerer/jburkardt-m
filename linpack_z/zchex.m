function [ r, z, c, s ] = zchex ( r, ldr, p, k, l, z, ldz, nz, job )

%*****************************************************************************80
%
%% ZCHEX updates a Cholesky factorization.
%
%  Discussion:
%
%    ZCHEX updates a Cholesky factorization
%
%      A = hermitian(R) * R
%
%    of a positive definite matrix A of order P under diagonal
%    permutations of the form
%
%      E' * A * E
%
%    where E is a permutation matrix.  Specifically, given
%    an upper triangular matrix R and a permutation matrix
%    E (which is specified by K, L, and JOB), ZCHEX determines
%    a unitary matrix U such that
%
%      U * R * E = RR,
%
%    where RR is upper triangular.  At the user's option, the
%    transformation U will be multiplied into the array Z.
%
%    If A = hermitian(X)*X, so that R is the triangular part of the
%    QR factorization of X, then RR is the triangular part of the
%    QR factorization of X * E, that is, X with its columns permuted.
%
%    For a less terse description of what ZCHEX does and how
%    it may be applied, see the LINPACK guide.
%
%    The matrix Q is determined as the product U(L-K)*...*U(1)
%    of plane rotations of the form
%
%      (    C(I)       S(I) )
%      (                    ) ,
%      ( -conj(S(i))  C(I) )
%
%    where C(I) is real, the rows these rotations operate on
%    are described below.
%
%    There are two types of permutations, which are determined
%    by the value of job.
%
%    JOB = 1, right circular shift:
%    The columns are rearranged in the following order.
%
%      1, ..., K-1, L, K, K+1, ..., L-1, L+1, ..., P.
%
%    U is the product of L-K rotations U(I), where U(I)
%    acts in the (L-I,L-I+1)-plane.
%
%    JOB = 2, left circular shift:
%    The columns are rearranged in the following order
%
%      1, ..., K-1, K+1, K+2, ..., L, L, L+1, ..., P.
%
%    U is the product of L-K rotations U(I), where U(I)
%    acts in the (K+I-1,K+I)-plane.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2007
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
%    Input, complex R(LDR,P); the upper triangular factor that is to be updated.
%    Elements below the diagonal are not referenced.
%
%    Input, integer LDR, the leading dimension of R, which is at least P.
%
%    Input, integer P, the order of the matrix.
%
%    Input, integer K, the first column to be permuted.
%
%    Input, integer L, the last column to be permuted.
%    L must be strictly greater than K.
%
%    Input, complex Z(LDZ,NZ), an array of NZ P-vectors into
%    which the transformation U is multiplied.
%
%    Input, integer LDZ, the leading dimension of Z, which must
%    be at least P.
%
%    Input, integer NZ, the number of columns of the matrix Z.
%
%    Input, integer JOB, determines the type of permutation.
%    1, right circular shift.
%    2, left circular shift.
%
%    Output, complex R(LDR,P), the updated factor.
%
%    Output, complex Z(LDZ,NZ), the updated matrix.  Z is not referenced
%    if NZ = 0.
%
%    Output, real C(P), the cosines of the transforming rotations.
%
%    Output, complex S(P), the sines of the transforming rotations.
%
  if ( job == 1 )
%
%  Right circular shift.
%
%  Reorder the columns.
%
    for i = 1 : l
      ii = l - i + 1;
      s(i) = r(ii,l);
    end

    for jj = k : l - 1
      j = l - 1 - jj + k;
      r(1:j,j+1) = r(1:j,j);
      r(j+1,j+1) = 0.0;
    end

    for i = 1 : k - 1
      ii = l - i + 1;
      r(i,k) = s(ii);
    end
%
%  Calculate the rotations.
%
    t = s(1);
    for i = 1 : l - k
      [ c(i), s(i), s(i+1) ] = zrotg ( s(i+1), t );
      t = s(i+1);
    end

    r(k,k) = t;
    for j = k+1 : p
      il = max ( 1, l - j + 1 );
      for ii = il : l - k
        i = l - ii;
        t = c(ii) * r(i,j) + s(ii) * r(i+1,j);
        r(i+1,j) = c(ii) * r(i+1,j) - conj ( s(ii) ) * r(i,j);
        r(i,j) = t;
      end
    end
%
%  If required, apply the transformations to Z.
%
    for j = 1 : nz
      for ii = 1 : l - k
        i = l - ii;
        t = c(ii) * z(i,j) + s(ii) * z(i+1,j);
        z(i+1,j) = c(ii) * z(i+1,j) - conj ( s(ii) ) * z(i,j);
        z(i,j) = t;
      end
    end

  else
%
%  Left circular shift.
%
%  Reorder the columns.
%
    for i = 1 : k
      ii = l - k + i;
      s(ii) = r(i,k);
    end

    for j = k : l - 1
      r(1:j,j) = r(1:j,j+1);
      jj = j - k + 1;
      s(jj) = r(j+1,j+1);
    end

    for i = 1 : k
      ii = l - k + i;
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
        iu = min ( j - 1, l - 1 );
        for i = k : iu
          ii = i - k + 1;
          t = c(ii) * r(i,j) + s(ii) * r(i+1,j);
          r(i+1,j) = c(ii) * r(i+1,j) - conj ( s(ii) ) * r(i,j);
          r(i,j) = t;
        end
      end

      if ( j < l )
        jj = j - k + 1;
        t = s(jj);
        [ c(jj), s(jj), r(j,j) ] = zrotg ( r(j,j), t );
      end

    end
%
%  Apply the rotations to Z.
%
    for j = 1 : nz
      for i = k : l - 1
        ii = i - k + 1;
        t = c(ii) * z(i,j) + s(ii) * z(i+1,j);
        z(i+1,j) = c(ii) * z(i+1,j) - conj ( s(ii) ) * z(i,j);
        z(i,j) = t;
      end
    end

  end

  return
end
