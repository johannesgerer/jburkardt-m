function h = tanh_m_to_h ( m )

%*****************************************************************************80
%
%% TANH_M_TO_H computes H as a function of M.
%
%  Discussion:
%
%    H = 2^(-M).
%
%    This is simply an orderly way to index a family of decreasing values of H.
%
%  Example:
%
%     M      H
%    --  -----
%    -2      4
%    -1      2
%     0      1
%     1     1/2
%     2     1/4
%     3     1/8
%     4     1/16
%     5     1/32
%   ...     ...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the level.
%
%    Output, real H, the spacing.
%
  h = 1.0;

  for i = -1 : -1 : m
    h = h * 2.0;
  end

  for i = 1 : m
    h = h / 2.0;
  end

  return
end
