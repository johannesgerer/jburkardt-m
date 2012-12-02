function value = r8_int ( x )

%*****************************************************************************80
%
%% R8_INT returns the integer part of an R8 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2011
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
%    Output, real VALUE, the integer part of X.
%
  persistent npart
  persistent scale
  persistent xbig
  persistent xmax

  if ( isempty ( npart ) )
    ibase = i4_mach ( 10 );
    xmax = 1.0 / r8_mach ( 4 );
    xbig = min ( i4_mach ( 9 ), xmax );
    expo = floor ( log ( xbig ) / log ( ibase ) - 0.5 );
    scale = ibase ^ expo;
    npart = floor ( log ( xmax ) / log ( scale ) + 1.0 );
  end

  if ( x < - xmax )

    value = x;

  elseif ( x < - xbig )

    xscl = - x;

    for i = 1 : npart
      xscl = xscl / scale;
    end

    value = 0.0;
    for i = 1 : npart
      xscl = xscl * scale;
      ipart = ceil ( xscl );
      part = ipart;
      xscl = xscl - part;
      value = value * scale + part;
    end

    value = - value;

  else if ( x < 0 )

    value = ceil ( x );

  elseif ( x < + xbig )

    value = floor ( x );

  elseif ( x < + xmax )

    xscl = x;

    for i = 1 : npart
      xscl = xscl / scale;
    end

    value = 0.0;
    for i = 1 : npart
      xscl = xscl * scale;
      ipart = floor ( xscl );
      part = ipart;
      xscl = xscl - part;
      value = value * scale + part;
    end

  else

    value = x;

  end

  return
end
