function geometry_test219 ( )

%*****************************************************************************80
%
%% TEST219 tests TUBE_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2009
%
%  Author:
%
%    John Burkardt
%
  maxn = 5;
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST219\n' );
  fprintf ( 1, '  TUBE_2D computes corners of a tube of radius\n' );
  fprintf ( 1, '    DIST surrounding a sequence of points.\n' );
 
  for itest = 1 : 4
 
    if ( itest == 1 )
 
      n = 4;
 
      p(1:dim_num,1:n) = [
        0.0, 0.0; ...
        4.0, 3.0; ...
        4.0, 0.0; ...
        0.0, 0.0 ]';
 
      dist = 0.5;
 
    elseif ( itest == 2 )
 
      n = 5;

      p(1:dim_num,1:n) = [ ...
        0.0, 0.0; ...
        2.0, 0.0; ...
        2.0, 1.0; ...
        0.0, 1.0; ...
        0.0, 0.0 ]';
 
      dist = 0.5;
 
    elseif ( itest == 3 )
 
      n = 5;
 
      p(1:dim_num,1:n) = [ ...
        10.0, 20.0; ...
        20.0, 20.0; ...
        10.0, 10.0; ...
        20.0, 10.0; ...
        10.0, 20.0 ]';
 
      dist = 1.0;
 
    elseif ( itest == 4 )
 
      n = 5;
 
      p(1:dim_num,1:n) = [ ...
         0.0,  0.0; ...
        10.0,  0.0; ...
        10.0, 10.0; ...
        10.0,  0.0; ...
         0.0,  0.0 ]';
 
      dist = 1.0;
 
    end
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test number %d\n', itest );
    fprintf ( 1, '  Number of points N = %d\n', n );
    fprintf ( 1, '  Tube radius DIST = %f\n', dist );

    r8mat_transpose_print ( dim_num, n, p, '  Points to surround:' );
 
    [ p1, p2 ] = tube_2d ( dist, n, p );
 
    r8mat_transpose_print ( dim_num, n, p1, '  P1:' );

    r8mat_transpose_print ( dim_num, n, p2, '  P2:' );
 
  end
 
 
  return
end
