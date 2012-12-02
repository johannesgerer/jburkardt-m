function [ algam, sgngam ] = r8_lgams ( x )

%*****************************************************************************80
%
%% R8_LGAMS evaluates the log of |gamma(x)| and sign, for an R8 argument.
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
%    Output, real ALGAM, the logarithm of the absolute value of
%    gamma ( X ).
%
%    Output, real SGNGAM, the sign (+1 or -1 ) of gamma ( X ).
%
  algam = r8_lngam ( x );
  sgngam = 1.0;

  if ( x <= 0.0 )

    k = floor ( mod ( - r8_aint ( x ), 2.0 ) + 0.1 );

    if ( k == 0 )
      sgngam = - 1.0;
    end

  end

  return
end
