function [ icc, ccc ] = st_to_cc_index ( nst, ist, jst, ncc, n )

%*****************************************************************************80
%
%% ST_TO_CC_INDEX creates CC indices from ST data.
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
%    Input, integer NCC, the number of CC elements.
%
%    Input, integer N, the number of columns.
%
%    Output, integer ICC(NCC), the CC rows.
%
%    Output, integer CCC(N+1), the compressed CC columns.
%

%
%  Sort the elements.
%
  [ jst2, ist2 ] = i4vec2_sort_a ( nst, jst, ist );
%
%  Get the unique elements.
%
  [ jcc, icc ] = i4vec2_sorted_uniquely ( nst, jst2, ist2, ncc );
%
%  Compress the column index.
%
  ccc = zeros(n+1,1);

  ccc(1) = 1;
  jlo = 1;
  for i = 1 : ncc
    jhi = jcc(i);
    if ( jhi ~= jlo )
      ccc(jlo+1:jhi) = i;
      jlo = jhi;
    end
  end
  jhi = n + 1;
  ccc(jlo+1:jhi) = ncc + 1;

  return
end
