function [ c, s, r ] = zrotg ( a, b )

%*****************************************************************************80
%
%% ZROTG determines a complex Givens rotation.
%
%  Discussion:
%
%    Given values A and B, this routine computes:
%
%    If A = 0:
%
%      R = B
%      C = 0
%      S = (1,0).
%
%    If A /= 0:
%
%      ALPHA = A / abs ( A )
%      NORM  = sqrt ( ( abs ( A ) )**2 + ( abs ( B ) )**2 )
%      R     = ALPHA * NORM
%      C     = abs ( A ) / NORM
%      S     = ALPHA * conj ( B ) / NORM
%
%    In either case, the computed numbers satisfy the equation:
%
%    (         C    S ) * ( A ) = ( R )
%    ( -conj ( S )  C )   ( B ) = ( 0 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%    Charles Lawson, Richard Hanson, David Kincaid, Fred Krogh,
%    Basic Linear Algebra Subprograms for FORTRAN usage,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, pages 308-323, 1979.
%
%  Parameters:
%
%    Input, complex A, the value A.
%
%    Input, complex B, the value B.
%
%    Output, real C, the cosine of the Givens rotation.
%
%    Output, complex S, the sine of the Givens rotation.
%
%    Output, complex R, the value R.
%
  if ( abs ( a ) == 0.0 )

    c = 0.0;
    s = 1.0;
    r = b;

  else

    scale = abs ( a ) + abs ( b );
    norm = scale * sqrt ( ( abs ( a / scale ) ).^2 ...
                        + ( abs ( b / scale ) ).^2 );
    alpha = a / abs ( a );
    c = abs ( a ) / norm;
    s = alpha * b' / norm;
    r = alpha * norm;

  end

  return
end
