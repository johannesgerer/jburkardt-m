function [ r, pc ] = sphere_exp2imp_nd ( n, p )

%*****************************************************************************80
%
%% SPHERE_EXP2IMP_ND finds an N-dimensional sphere through N+1 points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real P(N,N+1), the points.
%
%    Output, real R, PC(N), the radius and center of the sphere.
%

%
%  Set up the linear system.
%
  a(1:n,1:n) = p(1:n,2:n+1)';

  for j = 1 : n
    a(1:n,j) = a(1:n,j) - p(j,1);
  end

  b = zeros ( n, 1 );

  for i = 1 : n
    b(i) = sum ( a(i,1:n).^2 );
  end
%
%  Solve the linear system.
%
  b = a \ b;
%
%  Compute the radius and center.
%
  r = 0.5 * sqrt ( sum ( b(1:n).^2 ) );

  pc(1:n) = p(1:n,1) + 0.5 * b(1:n);

  return
end
