function a = fd1d_heat_implicit_matrix ( x_num, cfl )

%*****************************************************************************80
%
%% FD1D_HEAT_IMPLICIT_MATRIX: set the system matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2012
%
%  Author:
%
%    John Burkardt
%
  a = sparse ( [], [], [], x_num, x_num );

  a(1,1) = 1.0;

  for i = 2 : x_num - 1
    a(i,i-1) =           - cfl;
    a(i,i  ) = 1.0 + 2.0 * cfl;
    a(i,i+1) =           - cfl;
  end

  a(x_num,x_num) = 1.0;

  return
end
