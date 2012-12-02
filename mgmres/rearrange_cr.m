function [ ja, a ] = rearrange_cr ( n, nz_num, ia, ja, a )

%*****************************************************************************80
%
%% REARRANGE_CR sorts a sparse compressed row matrix.
%
%  Discussion:
%
%    This routine guarantees that the entries in the CR matrix
%    are properly sorted.
%
%    After the sorting, the entries of the matrix are rearranged in such
%    a way that the entries of each column are listed in ascending order
%    of their column values.
%
%    The matrix A is assumed to be stored in compressed row format.  Only
%    the nonzero entries of A are stored.  The vector JA stores the
%    column index of the nonzero value.  The nonzero values are sorted
%    by row, and the compressed row vector IA then has the property that
%    the entries in A and JA that correspond to row I occur in indices
%    IA(I) through IA(I+1)-1.
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
%    C original version by Lili Ju
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the system.
%
%    Input, integer NZ_NUM, the number of nonzeros.
%
%    Input, integer IA(N+1), the compressed row indices..
%
%    Input, integer JA(NZ_NUM), the column indices.
%
%    Input, real A(NZ_NUM), the matrix values.
%
%    Output, integer JA(NZ_NUM), may have been rearranged by the sorting.
%
%    Output, real A(NZ_NUM), the matrix values may have been moved somewhat
%    because of the sorting.
%
  for i = 1 : n

    for k = ia(i) : ia(i+1) - 2
      for l = k + 1 : ia(i+1) - 1

        if ( ja(l) < ja(k) )
          t     = ja(l);
          ja(l) = ja(k);
          ja(k) = t;

          t    = a(l);
          a(l) = a(k);
          a(k) = t;
        end

      end
    end

  end

  return
end
