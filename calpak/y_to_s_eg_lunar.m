function s = y_to_s_eg_lunar ( y )

%*****************************************************************************80
%
%% Y_TO_S_EG_LUNAR writes an Egyptian Lunar year into a string.
%
%  Format:
%
%    EL YearNumber
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, string S, a representation of the year.
%
  s = sprintf ( 'EL %d', y );

  return
end