function fem2d_bvp_serene_test02 ( )

%*****************************************************************************80
%
%% FEM2D_BVP_SERENE_TEST02 checks the basis functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_BVP_SERENE_TEST02\n' );
  fprintf ( 1, '  Basis function checks.\n' );
%
%  Check that V is identity matrix at nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix Aij = V(i)(X(j),Y(j)) should be the identity.\n' );
  fprintf ( 1, '\n' );

  v = zeros(8,8);

  xw = 0.0;
  ys = 3.0;
  xe = 2.0;
  yn = 5.0;
  xx = [ 2.0, 1.0, 0.0, 0.0, 0.0, 1.0, 2.0, 2.0 ];
  yy = [ 5.0, 5.0, 5.0, 4.0, 3.0, 3.0, 3.0, 4.0 ];

  for j = 1 : 8
    xq = xx(j);
    yq = yy(j);
    v(1:8,j) = basis_serene ( xq, yq, xw, ys, xe, yn, xx, yy );
  end

  for i = 1 : 8
    for j = 1 : 8
      fprintf ( 1, '  %8.2g', v(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Check that VX and VY sum to zero anywhere.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The vectors dVdX(1:8)(X,Y) and dVdY(1:8)(X,Y)\n' );
  fprintf ( 1, '  should both sum to zero for any (X,Y).\n' );

  xq = 2.0 * rand ( 1, 1 );
  yq = 3.0 + 2.0 * rand ( 1, 1 );
  xw = 0.0;
  ys = 3.0;
  xe = 2.0;
  yn = 5.0;
  xx = [ 2.0, 1.0, 0.0, 0.0, 0.0, 1.0, 2.0, 2.0 ];
  yy = [ 5.0, 5.0, 5.0, 4.0, 3.0, 3.0, 3.0, 4.0 ];
  [ vx, vy ] = basisd_serene ( xq, yq, xw, ys, xe, yn, xx, yy );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Random evaluation point is (%g,%g)\n', xq, yq );
  fprintf ( 1, '\n' );
  fprintf ( 1, '              dVdX        dVdY\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 8
    fprintf ( 1, '  %4d  %10.4g  %10.4g\n', i, vx(i), vy(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum:  %10.4g  %10.4g\n', sum ( vx(1:8) ), sum ( vy(1:8) ) );

  return
end

  
