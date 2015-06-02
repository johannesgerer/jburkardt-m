function [ y1, j1, f1, y2, j2, f2 ] yjf_swap ( y1, j1, f1, y2, j2, f2 )

%*****************************************************************************80
%
%% YJF_SWAP swaps the data defining two YJF dates.
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
%    Input/output, integer Y1, J1, real F1,
%    the first date.
%
%    Input/output, integer Y2, J2, real F2,
%    the second date.
%
  t  = y1;
  y1 = y2;
  y2 = t;

  t  = j1;
  j1 = j2;
  j2 = t;

  t  = f1;
  f1 = f2;
  f2 = t;

  return
end