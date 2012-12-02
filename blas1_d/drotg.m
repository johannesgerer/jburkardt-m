function [ c, s, r, z ] = drotg ( a, b )

%*****************************************************************************80
%
%% DROTG constructs a Givens plane rotation.
%
%  Discussion:
%
%    Given values A and B, this routine computes
%
%    SIGMA = sign ( A ) if abs ( A ) >  abs ( B )
%          = sign ( B ) if abs ( A ) <= abs ( B );
%
%    R     = SIGMA * ( A * A + B * B );
%
%    C = A / R if R is not 0
%      = 1     if R is 0;
%
%    S = B / R if R is not 0,
%        0     if R is 0.
%
%    The computed numbers then satisfy the equation
%
%    (  C  S ) ( A ) = ( R )
%    ( -S  C ) ( B ) = ( 0 )
%
%    The routine also computes
%
%    Z = S     if abs ( A ) > abs ( B ),
%      = 1 / C if abs ( A ) <= abs ( B ) and C is not 0,
%      = 1     if C is 0.
%
%    The single value Z encodes C and S, and hence the rotation:
%
%    If Z = 1, set C = 0 and S = 1;
%    If abs ( Z ) < 1, set C = sqrt ( 1 - Z * Z ) and S = Z;
%    if abs ( Z ) > 1, set C = 1/ Z and S = sqrt ( 1 - C * C );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2006
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%    Charles Lawson, Richard Hanson, David Kincaid, Fred Krogh,
%    Basic Linear Algebra Subprograms for Fortran Usage,
%    Algorithm 539,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, September 1979, pages 308-323.
%
%  Parameters:
%
%    Input, real A, B, the values A and B.
%
%    Output, real C, S, the cosine and sine of the Givens rotation.
%
%    Output, real R, Z, the values R and Z.
%

  if ( abs ( b ) < abs ( a ) )
    roe = a;
  else
    roe = b;
  end

  scale = abs ( a ) + abs ( b );

  if ( scale == 0.0 )
    c = 1.0;
    s = 0.0;
    r = 0.0;
  else
    r = scale * sqrt ( ( a / scale ).^2 + ( b / scale ).^2 );
    r = r * r8_sign ( roe );
    c = a / r;
    s = b / r;
  end

  if ( 0.0 < abs ( c ) & abs ( c ) <= s )
    z = 1.0 / c;
  else
    z = s;
  end

  return
end
