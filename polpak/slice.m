function piece_num = slice ( dim_num, slice_num )

%*****************************************************************************80
%
%% SLICE: maximum number of pieces created by a given number of slices.
%
%  Discussion:
%
%    If we imagine slicing a pizza, each slice produce more pieces.  
%    The position of the slice affects the number of pieces created, but there
%    is a maximum.  
%
%    This function determines the maximum number of pieces created by a given
%    number of slices, applied to a space of a given dimension.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Banks,
%    Slicing Pizzas, Racing Turtles, and Further Adventures in 
%    Applied Mathematics,
%    Princeton, 1999,
%    ISBN13: 9780691059471,
%    LC: QA93.B358.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer SLICE_NUM, the number of slices.
%
%    Input, real PIECE_NUM, the maximum number of pieces that can
%    be created by the given number of slices applied in the given dimension.
%
  piece_num = 0;
  for j = 0 : min ( dim_num, slice_num )
    piece_num = piece_num + i4_choose ( slice_num, j );
  end

  return
end
