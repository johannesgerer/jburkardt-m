function fvals = ortho3eva ( degree, xyz )

%*****************************************************************************80
%
%% ORTHO3EVA evaluates polynomials orthogonal in the reference triangle.
%
%  Discussion:
%
%    This procedure evaluates the Koornwinder's orthogonal polynomial
%    up to order DEGREE on the reference tetrahedron with vertices
%      (-1, -1/Sqrt(3), -1/Sqrt(6)),
%      ( 0,  2/Sqrt(3), -1/Sqrt(6)),
%      ( 1, -1/Sqrt(3), -1/Sqrt(6)),
%      ( 0,  0,      3/Sqrt(6))
%
%    The polynomials are ordered by their order, and in each order,
%    they are ordered lexicographically in terms of their indices
%    (m,n,k).
%
%    The total number of polynomials should be
%      NVALS = ( ( DEGREE + 1 ) * ( DEGREE + 2 ) * ( DEGREE + 3 ) ) / 6.
%
%    The calculations are based on Koornwinder's representation
%    of the orthogonal polynomials on the right triangle
%      (-1,-1,-1), (-1,1,-1), (1,-1,-1),(-1,-1,1)
%    given by:
%      K_mnk(x,y,z) =
%        P_m ((2x+2+y+z)/(-y-z)) * ((-y-z)/2)^m *
%        P_n^{2m+1,0}((2y+1+z)/(1-z)) * ((1-z)/2)^{n}
%        P_k^{2m+2n+2,0} (z)
%    with the input (x,y,z) transformed as
%      x = -1/2 + xold -yold/s3 - zold/s6
%      y = -1/2 + 2/s3 * yold - zold/s6
%      z = -1/2 + s6/2 * zold
%    where
%      s3=sqrt(3)
%      s6=sqrt(6)
%    and
%      P_m is the Legendre polynomial of degree m,
%      P_n^{2m+1,0} the Jacobi polynomial of degree n, parameters 2*m+1 and 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer DEGREE, the maximum degree.
%
%    Input, real XYZ(3), the evaluation point.
%
%    Output, real FVALS(NVALS), the polynomial values.
%

%
%  Convert coordinates from reference to Koornwinder tetrahedron.
%
  uvw = ref_to_koorn ( xyz );
%
%  Compute F1.
%
  p1 = 0.5 * ( 2.0 * uvw(1) + 2.0 + uvw(2) + uvw(3) );
  p2 = - 0.5 * ( uvw(2) + uvw(3) );

  f1 = klegeypols ( p1, p2, degree );
%
%  Compute F2S.
%
  f2s = zeros(degree+1,degree+1);

  for m = 0 : degree

    x1 = 0.5 * ( 2.0 * uvw(2) + 1.0 + uvw(3) );
    y1 = 0.5 * ( 1.0 - uvw(3) );
    p1 = 2 * m + 1;
    p2 = 0.0;

    f2s(1:degree+1-m,m+1) = kjacoypols3 ( x1, y1, p1, p2, degree - m );

  end
%
%  Compute F3S.
%
  f3s = zeros(degree+1,degree+1);

  x1 = uvw(3);
  y1 = 1.0;
  p2 = 0.0;

  for j = 1 : degree + 1

    p1 = 2 * j;

    f3s(1:degree+2-j,j) = kjacoypols3 ( x1, y1, p1, p2, degree + 1 - j );

  end
%
%  Construct FVALS.
%
  ncount = 0;

  for mmax = 0 : degree

    for m = 0 : mmax

      for n = 0 : mmax - m

        k = mmax - m - n;
        ncount = ncount + 1;

        scale = sqrt ...
        ( ...
          4.0 ...
          / ( 2 * mmax + 3 ) ...
          / ( 2 * m + 1 ) ...
          / ( n + m + 1 ) ...
          / sqrt ( 2.0 ) ...
        );

        fvals(ncount) = ...
          f1(m+1) * ...
          f2s(n+1,m+1) * ...
          f3s(k+1,m+n+1) / scale;

      end
    end
  end

  return
end
