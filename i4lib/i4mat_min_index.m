function [ i, j ] = i4mat_min_index ( m, n, a )

%*****************************************************************************80
%
%% I4MAT_MIN_INDEX returns the location of the minimum of an I4AMT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, integer A(M,N), the M by N matrix.
%
%    Output, integer I, J, the indices of the minimum entry of A.
%
  i = -1;
  j = -1;

  for jj = 1 : n
    for ii = 1 : m
      if ( ii == 1 & jj == 1 )
        i = ii;
        j = jj;
      elseif ( a(ii,jj) < a(i,j) )
        i = ii;
        j = jj;
      end
    end
  end

  return
end
