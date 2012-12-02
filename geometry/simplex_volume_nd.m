function volume = simplex_volume_nd ( dim_num, a )

%*****************************************************************************80
%
%% SIMPLEX_VOLUME_ND computes the volume of a simplex in ND.
%
%  Discussion:
%
%    The formula is: 
%
%      volume = 1/N! * det ( A )
%
%    where A is the N by N matrix obtained by subtracting one
%    vector from all the others.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, real A(DIM_NUM,DIM_NUM+1), the vertices.
%
%    Output, real VOLUME, the volume of the simplex.
%
  b(1:dim_num,1:dim_num) = a(1:dim_num,1:dim_num);
  for j = 1 : dim_num
    b(1:dim_num,j) = b(1:dim_num,j) - a(1:dim_num,dim_num+1);
  end

  [ b_lu, pivot, info ] = dge_fa ( dim_num, b );

  if ( info ~= 0 )

    volume = -1.0;

  else

    volume = dge_det ( dim_num, b_lu, pivot );

    volume = abs ( volume );
    for i = 1 : dim_num
      volume = volume / i;
    end

  end

  return
end
