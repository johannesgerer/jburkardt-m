function [ phi, phip ] = p11_phi ( dudx, dudy, option )

%*****************************************************************************80
%
%% P11_PHI is used by problem 11.
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
%    Input, real DUDX, DUDY, the values of dU/dX and dU/dY.
%
%    Input, integer OPTION, the option index.
%
%    Output, real PHI, PHIP, the values of PHI(S) and d PHI(S)/d S, where
%    S = dU/dX**2 + dU/dY**2.
%
  s = dudx * dudx + dudy * dudy;

  if ( option == 1 )

    phi = exp ( 5.0 * s );
    phip = 5.0 * exp ( 5.0 * s );

  elseif ( option == 2 )

    sbar = ( 40.0 * s - 13.0 ) / 7.0;

    if ( s <= 0.15 )
      phi = 1.0;
      phip = 0.0;
    elseif ( 0.15 <= s & s <= 0.5 )
      phi = 5.5 + 2.25 * sbar * ( 3.0 - sbar * sbar );
      phip = 2.25 * ( 3.0 - 3.0 * sbar * sbar ) * 40.0 / 7.0;
    else
      phi = 10.0;
      phip = 0.0;
    end

  end

  return
end
