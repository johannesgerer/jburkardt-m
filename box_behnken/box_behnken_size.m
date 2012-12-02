function x_num = box_behnken_size ( dim_num )

%*****************************************************************************80
%
%% BOX_BEHNKEN_SIZE returns the size of a Box-Behnken design.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Box, Donald Behnken,
%    Some new three level designs for the study of quantitative variables,
%    Technometrics,
%    Volume 2, pages 455-475, 1960.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, integer X_NUM, the number of elements of the design.
%    X_NUM will be equal to DIM_NUM * 2**(DIM_NUM-1) + 1.
%
  if ( 1 <= dim_num )
    x_num = 1 + dim_num * 2^( dim_num - 1 );
  else
    x_num = -1;
  end

  return
end
