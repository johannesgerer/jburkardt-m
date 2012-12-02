function check = r8sp_check ( m, n, nz_num, row, col )

%*****************************************************************************80
%
%% R8SP_CHECK checks that a R8SP matrix data structure is properly sorted.
%
%  Discussion:
%
%    This routine assumes that the data structure has been sorted,
%    so that the entries of ROW are ascending sorted, and that the
%    entries of COL are ascending sorted, within the group of entries
%    that have a common value of ROW.
%
%    The R8SP storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.
%
%    The R8SP format is used by CSPARSE ("sparse triplet"), DLAP/SLAP
%    ("nonsymmetric SLAP triad"), by MATLAB, and by SPARSEKIT ("COO" format).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of
%    the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in
%    the matrix.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and
%    column indices of the nonzero elements.
%
%    Output, logical CHECK, is TRUE if the matrix is properly defined.
%
  check = 1;
%
%  Check 1 <= ROW(*) <= M.
%
  for k = 1 : nz_num

    if ( row(k) < 1 | m < row(k) )
      check = 0;
      return
    end

  end
%
%  Check 1 <= COL(*) <= N.
%
  for k = 1 : nz_num

    if ( col(k) < 1 | n < col(k) )
      check = 0;
      return
    end

  end
%
%  Check that ROW(K) <= ROW(K+1).
%
  for k = 1 : nz_num - 1

    if ( row(k+1) < row(k) )
      check = 0;
      return
    end

  end
%
%  Check that, if ROW(K) == ROW(K+1), that COL(K) < COL(K+1).
%
  for k = 1 : nz_num - 1

    if ( row(k) == row(k+1) )
      if ( col(k+1) <= col(k) )
        check = 0;
        return
      end
    end

  end

  return
end
