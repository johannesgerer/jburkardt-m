function d = month_to_nones_roman ( m )

%*****************************************************************************80
%
%% MONTH_TO_NONES_ROMAN returns the day of the nones of a Roman month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the month index.
%
%    Output, integer D, the day of the nones of the month.
%
  nones = [ ...
    5, 5, 7, 5, 7, 5, 7, 5, 5, 7, 5, 5 ];

  if ( m < 1 || 12 < m )
    d = -1;
  else
    d = nones(m);
  end

  return
end
