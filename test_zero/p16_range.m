function range = p16_range ( )

%*****************************************************************************80
%
%% P16_RANGE returns an interval bounding the root for problem 16.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real RANGE(2), the minimum and maximum values of
%    an interval containing the root.
%
  e = 0.8;
  m = 5.0;

  range(1) = m - 180.0;
  range(2) = m + 180.0;

  return
end
