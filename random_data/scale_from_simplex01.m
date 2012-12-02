function x = scale_from_simplex01 ( dim_num, n, t, x )

%*****************************************************************************80
%
%% SCALE_FROM_SIMPLEX01 rescales data from a unit to non-unit simplex.
%
%  Discussion:
%
%    Thanks to Jacob Grunnet for pointing out an error in the MATLAB
%    version of this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity 
%    of Queueing Networks,
%    Krieger, 1992,
%    ISBN: 0894647644,
%    LC: QA298.R79.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input, real T(DIM_NUM,1:DIM_NUM+1), the coordinates of the
%    DIM_NUM+1 points that define the simplex.  T(1:DIM_NUM,1) corresponds
%    to the origin, and T(1:DIM_NUM,J+1) will be the image of the J-th unit
%    coordinate vector.
%
%    Input, real X(DIM_NUM,N), the data to be modified.
%
%    Output, real X(DIM_NUM,N), the modified data.
%
  a(1:dim_num,1:dim_num) = t(1:dim_num,2:dim_num+1);

  for j = 1 : dim_num
    a(1:dim_num,j) = a(1:dim_num,j) - t(1:dim_num,1);
  end

  for j = 1 : n
    x(1:dim_num,j) = a(1:dim_num,1:dim_num) * x(1:dim_num,j) + t(1:dim_num,1);
  end

  return
end

