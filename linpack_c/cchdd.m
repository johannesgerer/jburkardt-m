function [ r, z, rho, c, s, info ] = cchdd ( r, ldr, p, x, z, ldz, nz, y, rho )

%*****************************************************************************80
%
%% CCHDD downdates an augmented Cholesky decomposition.
%
%  Discussion:
%
%    CCHDD downdates an augmented Cholesky decomposition or the
%    triangular factor of an augmented QR decomposition.
%    Specifically, given an upper triangular matrix R of order P,  a
%    row vector X, a column vector Z, and a scalar Y, CCHDD
%    determines a unitary matrix U and a scalar ZETA such that
%
%          ( R   Z  )     ( RR  ZZ )
%      U * (        )  =  (        ),
%          ( 0 ZETA )     (  X   Y )
%
%    where RR is upper triangular.  If R and Z have been obtained
%    from the factorization of a least squares problem, then
%    RR and ZZ are the factors corresponding to the problem
%    with the observation (X,Y) removed.  In this case, if RHO
%    is the norm of the residual vector, then the norm of
%    the residual vector of the downdated problem is
%      sqrt ( RHO**2 - ZETA**2 ).  
%    CCHDD will simultaneously downdate several triplets (Z,Y,RHO) 
%    along with R.
%
%    For a less terse description of what CCHDD does and how
%    it may be applied, see the LINPACK guide.
%
%    The matrix U is determined as the product U(1)*...*U(P)
%    where U(I) is a rotation in the (P+1,I)-plane of the
%    form
%
%      ( C(I)  -conj ( S(I) ) )
%      (                       ).
%      ( S(I)           C(I)   )
%
%    The rotations are chosen so that C(I) is real.
%
%    The user is warned that a given downdating problem may
%    be impossible to accomplish or may produce
%    inaccurate results.  For example, this can happen
%    if X is near a vector whose removal will reduce the
%    rank of R.  Beware.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2007
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
%    Input, complex R(LDR,P), the upper triangular matrix to be downdated.  
%
%    Input, integer LDR, the leading dimension of R.  P <= LDR.
%
%    Input, integer P, the order of the matrix.
%
%    Input, complex X(P), the row vector that is to
%    be removed from R.
%
%    Input, complex Z(LDZ,NZ); an array of NZ P-vectors to be downdated 
%    along with R.
%
%    Input, integer LDZ, the leading dimension of Z.  P <= LDZ.
%
%    Input, integer NZ, the number of vectors to be downdated.
%    NZ may be zero, in which case Z, Y, and R are not referenced.
%
%    Input, complex Y(NZ), the scalars for the downdating
%    of the vectors Z.
%
%    Input, real RHO(NZ), the norms of the residual vectors to be downdated.  
%
%    Output, complex R(LDR,P); the downdated matrix.  The 
%    part of R below the diagonal is not referenced.
%
%    Output, complex Z(LDZ,NZ), the downdated vectors.
%
%    Output, real RHO(NZ), the downdated norms.
%
%    Output, real C(P), the cosines of the transforming rotations.
%
%    Output, complex S(P), the sines of the transforming rotations.
%
%    Output, integer INFO:
%     0, if the entire downdating was successful.
%    -1, if R could not be downdated.  In this case, all quantities
%        are left unaltered.
%     1, if some RHO could not be downdated.  The offending RHO's are
%        set to -1.
%

%
%  Solve the system hermitian(R) * A = X, placing the result in S.
%
  info = 0;
  s(1) = conj ( x(1) ) / conj ( r(1,1) );
  
  for j = 2 : p
    s(j) = conj ( x(j) ) - cdotc ( j-1, r(1:j-1,j), 1, s, 1 );
    s(j) = s(j) / conj ( r(j,j) );
  end

  norm = scnrm2 ( p, s, 1 );

  if ( 1.0 <= norm )
    info = -1;
    c(1:p) = 1.0;
    return
  end

  alpha = sqrt ( 1.0 - norm^2 );
%
%  Determine the transformations.
%
  for ii = 1 : p
    i = p - ii + 1;
    scale = alpha + abs ( s(i) );
    a = alpha / scale;
    b = s(i) / scale;
    norm = sqrt ( a^2 + ( real ( b ) )^2 + ( imag ( b ) )^2 );
    c(i) = a / norm;
    s(i) = conj ( b ) / norm;
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
      r(i,j) = c(i) * r(i,j) - conj ( s(i) ) * xx;
      xx = t;
    end
  end
%
%  If required, downdate Z and RHO.
%
  for j = 1 : nz

    zeta = y(j);

    for i = 1 : p
      z(i,j) = ( z(i,j) - conj ( s(i) ) * zeta ) / c(i);
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
