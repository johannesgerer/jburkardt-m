function value = r8_sqrt ( x )

%*****************************************************************************80
%
%% R8_SQRT computes the square root of an R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2011
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
%    Input, real X, the number whose square root is desired.
%
%    Output, real VALUE, the square root of X.
%
  persistent niter
  persistent sqrt2

  sqrt2 = [ ...
    0.70710678118654752440084436210485, ...
    1.0, ...
    1.41421356237309504880168872420970 ]';

  if ( isempty ( niter ) )
    niter = 1.443 * r8_log ( - 0.104 * r8_log ( 0.1 * r8_mach ( 3 ) ) ) + 1.0;
  end

  if ( x < 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_SQRT - Fatal error!\n' );
    fprintf ( 1, '  X < 0.0\n' );
    error ( 'R8_SQRT - Fatal error!' )

  elseif ( x == 0.0 )

    value = 0.0;

  else

    [ y, n ] = r8_upak ( x );
    ixpnt = floor ( n / 2 );
    irem = floor ( n - 2 * ixpnt + 2 );
    value = 0.261599 + y * ( 1.114292 ...
      + y * ( -0.516888 + y * 0.141067 ) );

    for iter = 1 : niter
      value = value + 0.5 * ( y - value * value ) / value;
    end

    value = r8_pak ( sqrt2(irem) * value, ixpnt );

  end

  return
end
