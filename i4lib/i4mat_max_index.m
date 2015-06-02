function [ i, j ] = i4mat_max_index ( m, n, a )

%*****************************************************************************80
%
%% I4MAT_MAX_INDEX returns the location of the maximum of an I4MAT.
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
%    Output, integer I, J, the indices of the maximum entry of A.
%
  i = -1;
  j = -1;

  for jj = 1 : n
    for ii = 1 : m
      if ( ii == 1 && jj == 1 )
        i = ii;
        j = jj;
      elseif ( a(i,j) < a(ii,jj) )
        i = ii;
        j = jj;
      end
    end
  end

  return
end
