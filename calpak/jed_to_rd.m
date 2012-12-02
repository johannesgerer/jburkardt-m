function rd = jed_to_rd ( jed )

%*****************************************************************************80
%
%% JED_TO_RD converts a JED to an RD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Reingold, Nachum Dershowitz,
%    Calendrical Calculations, the Millennium Edition,
%    Cambridge, 2002.
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, real RD, the RD date.
%
  rd_epoch = epoch_to_jed_rd ( );

  rd = jed - rd_epoch;

  return
end
