function table = r8mat_latinize ( m, n, table )

%*****************************************************************************80
%
%% R8MAT_LATINIZE "Latinizes" an R8MAT.
%
%  Discussion:
%
%    It is assumed, though not necessary, that the input dataset
%    has points that lie in the unit hypercube.
%
%    In any case, the output dataset will have this property.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of cells.
%
%    Input, real TABLE(M,N), the dataset to be "Latinized".
%
%    Output, real TABLE(M,N), the Latinized dataset.
%
  for i = 1 : m
    indx = r8vec_sort_heap_index_a ( n, table(i,1:n) );
    for j = 1 : n
      table(i,indx(j)) = ( 2 * j - 1 ) / ( 2 * n );
    end
  end

  return
end
