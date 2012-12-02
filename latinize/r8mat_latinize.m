function table = r8mat_latinize ( m, n, table )

%*****************************************************************************80
%
%% R8MAT_LATINIZE "Latinizes" a double precision table dataset.
%
%  Discussion:
%
%    On output, each row of the table will have the properties that:
%    1) the minimum and maximum row values are the same as on input;
%    2) the row contains N evenly spaced values between the
%       minimum and maximum;
%    3) in each row, the elements retain their ordering.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of columns.
%
%    Input, real TABLE(M,N), the dataset to be "Latinized".
%
%    Output, real TABLE(M,N), the Latinized dataset.
%
  if ( n <= 2 )
    return
  end

  for i = 1 : m

    v_min = min ( table(i,1:n) );
    v_max = max ( table(i,1:n) );

    indx = r8vec_sort_heap_index_a ( n, table(i,1:n) );

    for j = 1 : n
      table(i,indx(j)) =  ( ( n - j     ) * v_min   ...
                          + (     j - 1 ) * v_max ) ...
                          / ( n     - 1 );
    end

  end

  return
end
