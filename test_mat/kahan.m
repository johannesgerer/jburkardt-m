function a = kahan ( alpha, m, n )

%*****************************************************************************80
%
%% KAHAN returns the Kahan matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,I) =  sin(ALPHA)**(I)
%    elseif ( I < J )
%      A(I,J) = - sin(ALPHA)**(I) * cos(ALPHA)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 0.25, N = 4
%
%    S  -C*S    -C*S      -C*S
%    0     S**2 -C*S**2   -C*S**2
%    0     0       S**3   -C*S**3
%    0     0       0         S**4
%
%    where
%
%      S = sin(ALPHA), C=COS(ALPHA)
%
%  Properties:
%
%    A is upper triangular.
%
%    A = B * C, where B is a diagonal matrix and C is unit upper triangular.
%    For instance, for the case M = 3, N = 4:
%
%    A = | S 0    0    |  * | 1 -C -C  -C |
%        | 0 S**2 0    |    | 0  1 -C  -C |
%        | 0 0    S**3 |    | 0  0  1  -C |
%
%    A is generally not symmetric: A' /= A.
%
%    A has some interesting properties regarding estimation of
%    condition and rank.
%
%    det ( A ) = sin(ALPHA)**(N*(N+1)/2).
%
%    LAMBDA(I) = sin ( ALPHA )**I
%
%    A is nonsingular if and only if sin ( ALPHA ) =/= 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nicholas Higham,
%    A survey of condition number estimation for triangular matrices,
%    SIAM Review,
%    Volume 9, 1987, pages 575-596.
%
%    W Kahan,
%    Numerical Linear Algebra,
%    Canadian Mathematical Bulletin,
%    Volume 9, 1966, pages 757-801.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.  A typical
%    value is 1.2.  The "interesting" range of ALPHA is 0 < ALPHA < PI.
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m

    si = sin ( alpha )^i;
    csi = - cos ( alpha ) * si;

    for j = 1 : n

      if ( j < i )
        a(i,j) = 0.0;
      elseif ( j == i )
        a(i,j) = si;
      else
        a(i,j) = csi;
      end

    end
  end

  return
end
