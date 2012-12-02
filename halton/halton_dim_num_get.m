function dim_num = halton_dim_num_get ( )

%*****************************************************************************80
%
%% HALTON_DIM_NUM_GET gets the dimension of the leaped Halton subsequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer DIM_NUM, the current value of the dimension.   
%
  global halton_DIM_NUM

  dim_num = halton_DIM_NUM;

  return
end
