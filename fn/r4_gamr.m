function value = r4_gamr ( x )

%*****************************************************************************80
%
%% R4_GAMR evaluates the reciprocal gamma function of an R4 argument.
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
%    Input, real X, the argument.
%
%    Output, real VALUE, the value of the reciprocal gamma
%    function at X.
%
  if ( x <= 0.0 && r4_aint ( x ) == x )

    value = 0.0;

  elseif ( abs ( x ) <= 10.0 )

    value = 1.0 / r4_gamma ( x );

  else

    [ alngx, sgngx ] = r4_lgams ( x );
    value = sgngx * exp ( - alngx );

  end

  return
end
