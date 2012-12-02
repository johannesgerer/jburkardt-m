function jed = rd_to_jed ( rd )

%*****************************************************************************80
%
%% RD_TO_JED converts an RD to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real RD, the RD Date.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  rd_epoch = epoch_to_jed_rd ( );
  jed = rd_epoch + rd;

  return
end
