function d = month_to_ides_roman ( m )

%*****************************************************************************80
%
%% MONTH_TO_IDES_ROMAN returns the day of the ides of a Roman month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the month index.
%
%    Output, integer D, the day of the ides of the month.
%
  ides = [ 13, 13, 15, 13, 15, 13, 15, 13, 13, 15, 13, 13 ];

  if ( m < 1 || 12 < m )
    d = -1;
  else
    d = ides(m);
  end

  return
end
