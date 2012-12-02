function cond = wilk03_condition ( )

%*****************************************************************************80
%
%% WILK03_CONDITION returns the L1 condition of the WILK03 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Wilkinson,
%    Error Analysis of Direct Methods of Matrix Inversion,
%    Journal of the Association for Computing Machinery,
%    Volume 8, 1961, pages 281-330.
%
%  Parameters:
%
%    Output, real COND, the L1 condition.
%
  cond = 1.8 * ( 13.0 * 10.0E+10 / 9.0 );

  return
end
