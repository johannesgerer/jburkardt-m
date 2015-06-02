function ncc = st_to_cc_size ( nst, ist, jst )

%*****************************************************************************80
%
%% ST_TO_CC_SIZE sizes CC indexes based on ST data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NST, the number of ST elements.
%
%    Input, integer IST(NST), JST(NST), the ST rows and columns.
%
%    Output, integer NCC, the number of CC elements.
%

%
%  Sort by column first, then row.
%
  [ jst2, ist2 ] = i4vec2_sort_a ( nst, jst, ist );
%
%  Count the unique pairs.
%
  ncc = i4vec2_sorted_unique_count ( nst, jst2, ist2 );

  return
end