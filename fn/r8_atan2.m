function value = r8_atan2 ( sn, cs )

%*****************************************************************************80
%
%% R8_ATAN2 evaluates the arc-tangent of two R8 arguments.
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
%    Input, real SN, CS, the Y and X coordinates of a
%    point on the angle.
%
%    Output, real VALUE, the arc-tangent of the angle.
%
  persistent big
  persistent sml

  if ( isempty ( sml ) )
    sml = r8_mach ( 1 );
    big = r8_mach ( 2 );
  end
%
%  We now make sure SN can be divided by CS.  It is painful.
%
  abssn = abs ( sn );
  abscs = abs ( cs );

  if ( abscs <= abssn )

    if ( abscs < 1.0 && abscs * big <= abssn )

      if ( sn < 0.0 )
        value = - 0.5 * pi;
      elseif ( sn == 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8_ATAN2 - Fatal error!\n' );
        fprintf ( 1, '  Both arguments are 0.\n' );
        error ( 'R8_ATAN2 - Fatal error!' )
      else
        value = 0.5 * pi;
      end

      return

    end

  else

    if ( 1.0 < abscs && abssn <= abscs * sml )

      if ( 0.0 <= cs )
        value = 0.0;
      else
        value = pi;
      end

      return

    end

  end

  value = atan ( sn / cs );

  if ( cs < 0.0 )
    value = value + pi;
  end

  if ( pi < value )
    value = value - 2.0 * pi;
  end

  return
end
