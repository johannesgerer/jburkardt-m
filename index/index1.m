function value = index1 ( i_min, i, i_max )

%*****************************************************************************80
%
%% INDEX1 indexes a 1D vector using a unit base.
%
%  Discussion:
%
%    Index       Element
%    ---------   --------
%    1           I_MIN
%    INDEX1      I
%   (INDEX_MAX)  I_MAX
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I_MIN, I, I_MAX, for the first index,
%    the minimum, the index, and the maximum.
%
%    Output, integer VALUE, the index of element I.
%
  index_min = 1;
  value = index_min + ( i - i_min );

  return
end
