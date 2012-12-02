function [ r, z, rho, c, s ] = schud ( r, ldr, p, x, z, ldz, nz, y, rho )

%*****************************************************************************80
%
%% SCHUD updates an augmented Cholesky decomposition.
%
%  Discussion:
%
%    This routine can also update the triangular part of an augmented QR
%    decomposition.
%
%    Specifically, given an upper triangular matrix R of order P, a row vector
%    X, a column vector Z, and a scalar Y, SCHUD determines a unitary matrix
%    U and a scalar ZETA such that
%
%           (R  Z)     (RR   ZZ )
%      U  * (    )  =  (        ),
%           (X  Y)     ( 0  ZETA)
%
%    where RR is upper triangular.
%
%    If R and Z have been obtained from the factorization of a least squares
%    problem, then RR and ZZ are the factors corresponding to the problem
%    with the observation (X,Y) appended.  In this case, if RHO is the
%    norm of the residual vector, then the norm of the residual vector of
%    the updated problem is sqrt ( RHO * RHO + ZETA * ZETA ).  SCHUD will
%    simultaneously update several triplets (Z, Y, RHO).
%
%    For a less terse description of what SCHUD does and how
%    it may be applied, see the LINPACK guide.
%
%    The matrix U is determined as the product U(P)*...*U(1),
%    where U(I) is a rotation in the (I,P+1) plane of the form
%
%      (     C(I)      S(I) )
%      (                    ).
%      (    -S(I)      C(I) )
%
%    The rotations are chosen so that C(I) is real.
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
%    Input, real R(LDR,P), the upper triangular matrix to be
%    updated.  The part of R below the diagonal is not referenced.
%
%    Input, integer LDR, the leading dimension of the array R.
%    LDR must be at least equal to P.
%
%    Input, integer P, the order of the matrix R.
%
%    Input, real X(P), the row to be added to R.
%
%    Input, real Z(LDZ,NZ), contains NZ P-vectors to be updated with R.
%
%    Input, integer LDZ, the leading dimension of the array Z.
%    LDZ must be at least P.
%
%    Input, integer NZ, the number of vectors to be updated.  NZ may be
%    zero, in which case Z, Y, and RHO are not referenced.
%
%    Input, real Y(NZ), the scalars for updating the vectors Z.
%
%    Input, real RHO(NZ), the norms of the residual vectors to be updated.  
%    If RHO(J) is negative, it is left unaltered.
%
%    Output, real R(LDR,P), the updated matrix.
%
%    Output, real Z(LDZ,NZ), the updated vectors.
%
%    Output, real RHO(NZ), the updated norms of the residual vectors.
%
%    Output, real C(P), S(P), the cosines and sines of the
%    transforming rotations.
%

%
%  Update R.
%
  for j = 1: p

    xj = x(j);
%
%  Apply the previous rotations.
%
    for i = 1 : j-1
      t = c(i) * r(i,j) + s(i) * xj;
      xj = c(i) * xj - s(i) * r(i,j);
      r(i,j) = t;
    end
%
%  Compute the next rotation.
%
    [ c(j), s(j), r(j,j), xj ] = srotg ( r(j,j), xj );

  end
%
%  If required, update Z and RHO.
%
  for j = 1 : nz

    zeta = y(j);

    for i = 1 : p
      t =    c(i) * z(i,j) + s(i) * zeta;
      zeta = c(i) * zeta   - s(i) * z(i,j);
      z(i,j) = t;
    end

    azeta = abs ( zeta );

    if ( azeta ~= 0.0 & 0.0 <= rho(j) )
      scale = azeta + rho(j);
      rho(j) = scale * sqrt ( ( azeta / scale )^2 + ( rho(j) / scale )^2 );
    end

  end

  return
end
