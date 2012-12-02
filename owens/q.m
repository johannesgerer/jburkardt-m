function value = q ( h, ah )

%*****************************************************************************80
%
%% Q computes (1/2) * p(H<Z) - T(H,AH).
%
%  Discussion:
%
%    The routine computes Q = (1/2) * P( H < Z ) - T ( H, AH ).
%
%    The result for Q is non-negative.
%
%    Warning : Q is computed as the difference between two terms;
%    When the two terms are of similar value this may produce
%    error in Q.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by Mike Patefield, David Tandy.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Mike Patefield, David Tandy,
%    Fast and Accurate Calculation of Owen's T Function,
%    Journal of Statistical Software,
%    Volume 5, Number 5, 2000, pages 1-25.
%
%  Parameters:
%
%    Input, real H, the lower limit for Z.
%    0 < H.
%
%    Input, real AH, one of the arguments for the T function.
%
%    Output, real Q, the desired quantity.
%
  rroot2 = 0.70710678118654752440;

  if ( 1.0 < ah )
    ahh = ah * h;
    value = tfun ( ahh, 1.0 / ah, h) - znorm2 ( ahh ) * znorm1 ( h );
  else
    value = 0.5 * znorm2 ( h ) - t ( h, ah );
  end

  return
end
