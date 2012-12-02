function value = r8_lbeta ( a, b )

%*****************************************************************************80
%
%% R8_LBETA evaluates the logarithm of the beta function of R8 arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real A, B, the arguments.
%
%    Output, real VALUE, the logarithm of the beta function of A
%    and B.
%
  sq2pil = 0.91893853320467274178032973640562;

  p = min ( a, b );
  q = max ( a, b );

  if ( p <= 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_LBETA - Fatal error!\n' );
    fprintf ( 1, '  Both arguments must be greater than 0.\n' );
    error ( 'R8_LBETA - Fatal error!' )

  elseif ( p < 10.0 && q <= 10.0 )

    value = log ( r8_gamma ( p ) ...
      * ( r8_gamma ( q ) / r8_gamma ( p + q ) ) );

  elseif ( p < 10.0 )

    corr = r8_lgmc ( q ) - r8_lgmc ( p + q );

    value = r8_lngam ( p ) + corr + p - p * log ( p + q ) + ...
      ( q - 0.5 ) * r8_lnrel ( - p / ( p + q ) );

  else

    corr = r8_lgmc ( p ) + r8_lgmc ( q ) - r8_lgmc ( p + q );

    value = - 0.5 * log ( q ) + sq2pil + corr ...
      + ( p - 0.5 ) * log ( p / ( p + q ) ) ...
      + q * r8_lnrel ( - p / ( p + q ) );

  end

  return
end
