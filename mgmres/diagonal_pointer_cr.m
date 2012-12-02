function ua = diagonal_pointer_cr ( n, nz_num, ia, ja )

%*****************************************************************************80
%
%% DIAGONAL_POINTER_CR finds diagonal entries in a sparse compressed row matrix.
%
%  Discussion:
%
%    The matrix A is assumed to be stored in compressed row format.  Only
%    the nonzero entries of A are stored.  The vector JA stores the
%    column index of the nonzero value.  The nonzero values are sorted
%    by row, and the compressed row vector IA then has the property that
%    the entries in A and JA that correspond to row I occur in indices
%    IA[I] through IA[I+1]-1.
%
%    The array UA can be used to locate the diagonal elements of the matrix.
%
%    It is assumed that every row of the matrix includes a diagonal element,
%    and that the elements of each row have been ascending sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%   
%  Modified:
%
%    25 March 2008
%
%  Author:
%
%    Original C version by Lili Ju
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the system.
%
%    Input, integer NZ_NUM, the number of nonzeros.
%
%    Input, integer IA(N+1), JA(NZ_NUM), the row and column indices
%    of the matrix values.  The row vector has been compressed.  On output,
%    the order of the entries of JA may have changed because of the sorting.
%
%    Output, integer UA(N), the index of the diagonal element of each row.
%
  ua(1:n) = -1;

  for i = 1 : n
    for j = ia(i) : ia(i+1) - 1
      if ( ja(j) == i ) 
        ua(i) = j;
      end
    end
  end

  return
end
