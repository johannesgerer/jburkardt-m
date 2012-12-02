function [ g, gp ] = p10_gx ( option, s )

%*****************************************************************************80
%
%% P10_GX is used by problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, real S, the value of the argument of G.
%    S = (d U/d X)**2 + (d U/d Y)**2.
%
%    Output, real G, GP, the value of G(S) and d G(S)/d S.
%
  if ( option == 1 )

    g = exp ( 5.0 * s );
    gp = 5.0 * exp ( 5.0 * s );

  elseif ( option == 2 )

    if ( s <= 0.15 )

      g = 1.0;
      gp = 0.0;

    elseif ( 0.15 < s & s < 0.5 )

      sbar = ( 40.0 * s - 13.0 ) / 7.0;

      g = 5.5 + 2.25 * sbar * ( 3.0 - sbar * sbar );

      gp = 270.0 * ( 1.0 - sbar * sbar ) / 7.0;

    else

      g = 10.0;
      gp = 0.0;

    end

  end

  return
end
