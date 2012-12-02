function value = r8_gami ( a, x )

%*****************************************************************************80
%
%% R8_GAMI evaluates the incomplete gamma function for an R8 argument.
%
%  Discussion:
%
%    GAMI = Integral ( 0 <= T <= X ) exp ( - t ) * t^( a - 1 )  dt
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2011
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
%    Input, real A, the parameter.
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the value of the incomplete
%    gamma function.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GAMI - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    error ( 'R8_GAMI - Fatal error!' )
  end

  if ( x < 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GAMI - Fatal error!\n' );
    fprintf ( 1, '  X < 0.\n' );
    error ( 'R8_GAMI - Fatal error!' )

  elseif ( x == 0.0 )

    value = 0.0;

  else

    factor = exp ( r8_lngam ( a ) + a * log ( x ) );

    value = factor * r8_gamit ( a, x );

  end

  return
end
