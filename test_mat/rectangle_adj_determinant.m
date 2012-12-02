function determ = rectangle_adj_determinant ( row_num, col_num )

%*****************************************************************************80
%
%% RECTANGLE_ADJ_DETERMINANT returns the determinant of the RECTANGLE_ADJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ROW_NUM, COL_NUM, the number of rows and
%    columns in the rectangle.
%
%    Output, real DETERM, the determinant.
%

%
%  If ROW_NUM == 1 or COL_NUM == 1 we have a case of the LINE_ADJ matrix.
%
  if ( row_num == 1 )

         if ( mod ( row_num, 4 ) == 1 )
      determ =   0.0;
    elseif ( mod ( row_num, 4 ) == 2 )
      determ = - 1.0;
    elseif ( mod ( row_num, 4 ) == 3 )
      determ =   0.0;
    elseif ( mod ( row_num, 4 ) == 0 )
      determ = + 1.0;
    end

  elseif ( col_num == 1 )

         if ( mod ( col_num, 4 ) == 1 )
      determ =   0.0;
    elseif ( mod ( col_num, 4 ) == 2 )
      determ = - 1.0;
    elseif ( mod ( col_num, 4 ) == 3 )
      determ =   0.0;
    elseif ( mod ( col_num, 4 ) == 0 )
      determ = + 1.0;
    end
%
%  Otherwise, we can form at least one square, hence a null vector,
%  hence the matrix is singular.
%
  else

    determ = 0.0;

  end

  return
end
