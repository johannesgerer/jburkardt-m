function [ r, z, rho, c, s ] = cchud ( r, ldr, p, x, z, ldz, nz, y, rho )

%*****************************************************************************80
%
%% CCHUD updates an augmented Cholesky decomposition.
%
%  Discussion:
%
%    CCHUD updates an augmented Cholesky decomposition of the
%    triangular part of an augmented QR decomposition.  Specifically,
%    given an upper triangular matrix R of order P, a row vector
%    X, a column vector Z, and a scalar Y, CCHUD determines a
%    unitary matrix U and a scalar ZETA such that
%
%           ( R  Z )     ( RR   ZZ  )
%      U  * (      )  =  (          ),
%           ( X  Y )     (  0  ZETA )
%
%    where RR is upper triangular.  If R and Z have been
%    obtained from the factorization of a least squares
%    problem, then RR and ZZ are the factors corresponding to
%    the problem with the observation (X,Y) appended.  In this
%    case, if RHO is the norm of the residual vector, then the
%    norm of the residual vector of the updated problem is
%    sqrt ( RHO**2 + ZETA**2 ).  CCHUD will simultaneously update
%    several triplets (Z,Y,RHO).
%
%    For a less terse description of what CCHUD does and how
%    it may be applied see the LINPACK guide.
%
%    The matrix U is determined as the product U(P)*...*U(1),
%    where U(I) is a rotation in the (I,P+1) plane of the
%    form
%
%      (          C(I)    S(I) )
%      (                       ).
%      ( -conjg ( S(I) )  C(I) )
%
%    The rotations are chosen so that C(I) is real.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 May 2007
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
%    Input, complex R(LDR,P), the upper triangular matrix to be updated.  
%    The part of R below the diagonal is not referenced.
%
%    Input, integer LDR, the leading dimension of R.
%    P <= LDR.
%
%    Input, integer P, the order of the matrix.
%
%    Input, complex X(P), the row to be added to R.
%
%    Input, complex Z(LDZ,NZ), NZ P-vectors to be updated with R.
%
%    Input, integer LDZ, the leading dimension of Z.
%    P <= LDZ.
%
%    Integer, integer NZ, the number of vectors to be updated.
%    NZ may be zero, in which case Z, Y, and RHO are not referenced.
%
%    Input, complex Y(NZ), the scalars for updating the vectors Z.
%
%    Input, real RHO(NZ); the norms of the residual
%    vectors that are to be updated.  If RHO(J) is negative, it is
%    left unaltered.
%
%    Output, complex R(LDR,P), the updated upper triangular matrix.
%
%    Output, complex Z(LDZ,NZ), the updated vectors.
%
%    Output, real RHO(NZ); on output, the updated values.
%
%    Output, real C(P), the cosines of the transforming rotations.
%
%    Output, complex S(P), the sines of the transforming rotations.
%

%
%  Update R.
%
  for j = 1 : p

    xj = x(j);
%
%  Apply the previous rotations.
%
    for i = 1 : j - 1
      t =  c(i) * r(i,j) +        s(i)   * xj;
      xj = c(i) * xj     - conj ( s(i) ) * r(i,j);
      r(i,j) = t;
    end
%
%  Compute the next rotation.
%
    [ c(j), s(j), r(j,j) ] = crotg ( r(j,j), xj );

  end
%
%  If required, update Z and RHO.
%
  for j = 1 : nz

    zeta = y(j);

    for i = 1 : p
      t =    c(i) * z(i,j) +        s(i)   * zeta;
      zeta = c(i) * zeta   - conj ( s(i) ) * z(i,j);
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
