function [ r, z, rho, c, s, info ] = schdd ( r, ldr, p, x, z, ldz, nz, y, rho )

%*****************************************************************************80
%
%% SCHDD downdates an augmented Cholesky decomposition.
%
%  Discussion:
%
%    SCHDD can also downdate the triangular factor of an augmented QR
%    decomposition.
%
%    Specifically, given an upper triangular matrix R of order P, a
%    row vector X, a column vector Z, and a scalar Y, SCHDD
%    determines an orthogonal matrix U and a scalar ZETA such that
%
%          (R   Z )     (RR  ZZ)
%      U * (      )  =  (      ),
%          (0 ZETA)     ( X   Y)
%
%    where RR is upper triangular.
%
%    If R and Z have been obtained from the factorization of a least squares
%    problem, then RR and ZZ are the factors corresponding to the problem
%    with the observation (X,Y) removed.  In this case, if RHO
%    is the norm of the residual vector, then the norm of
%    the residual vector of the downdated problem is
%    sqrt ( RHO * RHO - ZETA * ZETA ). SCHDD will simultaneously downdate
%    several triplets (Z, Y, RHO) along with R.
%
%    For a less terse description of what SCHDD does and how
%    it may be applied, see the LINPACK guide.
%
%    The matrix U is determined as the product U(1)*...*U(P)
%    where U(I) is a rotation in the (P+1,I)-plane of the form
%
%      ( C(I)      -S(I)    )
%      (                    ).
%      ( S(I)       C(I)    )
%
%    The rotations are chosen so that C(I) is real.
%
%    The user is warned that a given downdating problem may be impossible
%    to accomplish or may produce inaccurate results.  For example, this
%    can happen if X is near a vector whose removal will reduce the
%    rank of R.  Beware.
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
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real R(LDR,P), the upper triangular matrix that
%    is to be downdated.  The part of R below the diagonal is not referenced.
%
%    Input, integer LDR, the leading dimension of the array R.
%    LDR must be at least P.
%
%    Input, integer P, the order of the matrix R.
%
%    Input, real X(P), the row vector that is to be removed from R.
%
%    Input, real Z(LDZ,NZ), an array of NZ P-vectors
%    which are to be downdated along with R.
%
%    Input, integer LDZ, the leading dimension of the array Z.
%    LDZ must be at least P.
%
%    Input, integer NZ, the number of vectors to be downdated.
%    NZ may be zero, in which case Z, Y, and RHO are not referenced.
%
%    Input, real Y(NZ), the scalars for the downdating of
%    the vectors Z.
%
%    Input, real RHO(NZ), the norms of the residual vectors.
%
%    Output, real R(LDR,P), the downdated upper triangular matrix.
%
%    Output, real Z(LDZ,NZ), the downdated vectors.
%
%    Output, real RHO(NZ), the norms of the residual vectors,
%    which have been changed along with R and Z.
%
%    Output, real C(P), S(P), the cosines and sines of the
%    transforming rotations.
%
%    Output, integer INFO, return flag.
%     0, the entire downdating was successful.
%    -1, if R could not be downdated.  In this case, all quantities
%        are left unaltered.
%     1, if some RHO could not be downdated.  The offending RHO's are
%        set to -1.
%

%
%  Solve R' * A = X, placing the result in the array S.
%
  info = 0;
  s(1) = x(1) / r(1,1);

  for j = 2 : p
    s(j) = x(j) - sdot ( j-1, r(1:j-1,j), 1, s(1:j-1), 1 );
    s(j) = s(j) / r(j,j);
  end

  norm = snrm2 ( p, s(1:p), 1 );

  if ( 1.0 <= norm )
    info = -1;
    return
  end

  alpha = sqrt ( 1.0 - norm * norm );
%
%  Determine the transformations.
%
  for ii = 1 : p
    i = p - ii + 1;
    scale = alpha + abs ( s(i) );
    a = alpha / scale;
    b = s(i) / scale;
    norm = sqrt ( a * a + b * b );
    c(i) = a / norm;
    s(i) = b / norm;
    alpha = scale * norm;
  end
%
%  Apply the transformations to R.
%
  for j = 1 : p
    xx = 0.0;
    for ii = 1 : j
      i = j - ii + 1;
      t = c(i) * xx + s(i) * r(i,j);
      r(i,j) = c(i) * r(i,j) - s(i) * xx;
      xx = t;
    end
  end
%
%  If required, downdate Z and RHO.
%
  for j = 1 : nz

    zeta = y(j);
    for i = 1 : p
      z(i,j) = ( z(i,j) - s(i) * zeta ) / c(i);
      zeta = c(i) * zeta - s(i) * z(i,j);
    end

    azeta = abs ( zeta );

    if ( rho(j) < azeta )
      info = 1;
      rho(j) = -1.0;
    else
      rho(j) = rho(j) * sqrt ( 1.0 - ( azeta / rho(j) )^2 );
    end

  end

  return
end
