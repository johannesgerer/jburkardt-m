function circles_demo ( )

%*****************************************************************************80
%
%% CIRCLES_DEMO demonstrates MESH2D on a circle with an off-center hole.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLES_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESH2D on a channel with an off-center hole.\n' );

  clf

  warning off
%
%  Display the nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Circle with a hole, max element size is 0.50.\n' );

  n = 16;

  v = zeros ( 2 * n, 2 );
  e = zeros ( 2 * n, 2 );
%
%  We trace the outer boundary in anti-clockwise order.
%
  r = 3.0;
  i = 0;
  for j = 0 : n - 1
    theta = j * 2.0 * pi / n;
    x = r * cos ( theta );
    y = r * sin ( theta );
    i = i + 1;
    v(i,1) = x;
    v(i,2) = y;
    e(i,1) = i;
    e(i,2) = mod ( i, n ) + 1;
  end
%
%  We have to trace the hole in clockwise order.
%
  r = 1.0;
  for j = n - 1 : -1 : 0
    theta = j * 2.0 * pi / n;
    x = r * cos ( theta ) + 1.0;
    y = r * sin ( theta ) + 1.0;
    i = i + 1;
    v(i,1) = x;
    v(i,2) = y;
    e(i,1) = i;
    e(i,2) = mod ( i, n ) + n + 1;
  end

  hdata = [];
  hdata.hmax = 0.25;

  [ p, t ] = mesh2d ( v, e, hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', ...
    nv, np, nt );

  return
end
