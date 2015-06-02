function tsearch_test01 ( opt )

%*****************************************************************************80
%
%% TEST01 compares TSEARCH_MEX and PointLocation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPT, specifies which function to try.
%    0, tsearch ();
%    1, mytsearch(), which requires access to tsearch();
%    2, tsearch_mex();
%    3, pointLocation();
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSEARCH_TEST01\n' );
  fprintf ( 1, '  For searching a Delaunay triangulation,\n' );
  fprintf ( 1, '  0: TSEARCH is an obsolete Matlab function\n' );
  fprintf ( 1, '  1: MYTSEARCH was an "improved" preprocessor to TSEARCH;\n' );
  fprintf ( 1, '  2: TSEARCH_MEX is an equivalent C code in a MEX file.\n' );
  fprintf ( 1, '  3: PointLocation works with the new Delaunay function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate those functions that are available\n' );
  fprintf ( 1, '  and compare the results.\n' );

  if ( nargin < 1 )
    opt = 2;
  end
%
%  Set the data points.
%
  n = 20;
  xy = zeros ( n, 2 );

  seed = 123456789;
  [ temp, seed ] = r8mat_uniform_01 ( n-4, 2, seed );
  xy(1:n-4,1:2) = temp;
  xy(n-3,1:2) = [ 0.0, 0.0 ];
  xy(n-2,1:2) = [ 1.0, 0.0 ];
  xy(n-1,1:2) = [ 1.0, 1.0 ];
  xy(n,  1:2) = [ 0.0, 1.0 ];
%
%  Compute the triangulation.
%
  if ( opt == 0 || opt == 1 || opt == 2 )
    dtri = delaunay ( xy(:,1), xy(:,2) );
  else
    dtri = DelaunayTri ( xy(:,1), xy(:,2) );
  end
%
%  Display the triangulation.
%
  if ( opt == 0 || opt == 1 || opt == 2 )
    triplot ( dtri, xy(:,1), xy(:,2) );
  else
    triplot ( dtri );
  end
%
%  Set the query points.
%
  q_num = 10;
  [ q, seed ] = r8mat_uniform_01 ( q_num, 2, seed );
  
  if ( opt == 0 )
    t = tsearch ( xy(:,1), xy(:,2), dtri, q(:,1), q(:,2) );  
  elseif ( opt == 1 )
    t = [];
    t = mytsearch ( xy(:,1), xy(:,2), dtri, q(:,1), q(:,2), t );      
  elseif ( opt == 2 )
    t = tsearch_mex ( xy(:,1), xy(:,2), dtri, q(:,1), q(:,2) );    
  elseif ( opt == 3 )
    dtri = DelaunayTri ( xy );
    t = pointLocation ( dtri, q );
  end
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  OPTION = %d\n', opt );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   T      X      Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : q_num
    fprintf ( 1, '  %2d  %2d  %8f  %8f\n', i, t(i), q(i,1), q(i,2) );
  end

  return
end

