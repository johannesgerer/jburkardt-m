function program_02 ( )

%*****************************************************************************80
%
%% PROGRAM_02 demonstrates point and triangle orientation.
%
%  Discussion:
%
%    The program
%    * reads a triangle T (defined by three points),
%    * determines the orientation of the triangle;
%    * computes and prints the length of the edges;
%    * reads a point P
%    * computes the signed distance from P to each line
%      (not the line segment!)
%    * reports whether the point is INSIDE, ON or OUTSIDE the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_02 - Point/Triangle Orientation\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define a triangle T:\n' );

  t_v1 = input ( '  Enter [ T.v1.x, T.v1.y]: ' ); 
  t_v2 = input ( '  Enter [ T.v2.x, T.v2.y]: ' ); 
  t_v3 = input ( '  Enter [ T.v3.x, T.v3.y]: ' ); 
%
%  Compute the edges.
%
  t_e1 = t_v2 - t_v1;
  t_e2 = t_v3 - t_v2;
  t_e3 = t_v1 - t_v3;
%
%  Compute the unit normal vectors to each edge.
%  MATLAB's NORM function returns the square root of the sum
%  of the squares of the entries of a vector.
%
  t_e1_nv = [ -t_e1(2), t_e1(1) ] / norm ( t_e1 );
  t_e2_nv = [ -t_e2(2), t_e2(1) ] / norm ( t_e2 );
  t_e3_nv = [ -t_e3(2), t_e3(1) ] / norm ( t_e3 );
%
%  Orientation test.
%  The signed distance of V3 from the line from V1 to V2 must be positive.
%
  test = t_e1_nv * ( t_v3 - t_v1 )';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Orientation test value = %f\n', test );

  if ( test < 0.0 )
    fprintf ( 1, '  Error!  The triangle is improperly oriented.\n' );
    return
  elseif ( test == 0.0 )
    fprintf ( 1, '  Error!  The triangle is degenerate!\n' );
  else
    fprintf ( 1, '  The triangle is properly oriented.\n' );
  end
%
%  Edge lengths.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Edge1 = v2-v1, length = %f\n', norm ( t_e1 ) );
  fprintf ( 1, '  Edge2 = v3-v2, length = %f\n', norm ( t_e2 ) );
  fprintf ( 1, '  Edge3 = v1-v3, length = %f\n', norm ( t_e3 ) );
%
%  Check various points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now we see whether a point is in the triangle.\n' );
  fprintf ( 1, '\n' );

  while ( 1 )

    p = [];
    fprintf ( 1, '\n' );
    p = input ( '  Enter a point [ P.x, P.y], or RETURN to quit: ' );

    if ( isempty ( p ) )
      break
    end

%  Compute the signed distance from the point to the line that
%  includes each edge.
%
    p_e1_dist = t_e1_nv * ( p - t_v1 )';
    p_e2_dist = t_e2_nv * ( p - t_v2 )';
    p_e3_dist = t_e3_nv * ( p - t_v3 )';

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Distance to line through edge 1 = %f\n', p_e1_dist );
    fprintf ( 1, '  Distance to line through edge 2 = %f\n', p_e2_dist );
    fprintf ( 1, '  Distance to line through edge 3 = %f\n', p_e3_dist );

    fprintf ( 1, '\n' );
    if ( p_e1_dist < 0.0 | p_e2_dist < 0.0 | p_e3_dist < 0.0 )
      fprintf ( 1, '  The point is OUTSIDE the triangle\n' );
    elseif ( p_e1_dist == 0.0 | p_e2_dist == 0.0 | p_e3_dist == 0.0 )
      fprintf ( 1, '  The point is ON the triangle\n' );
    else
      fprintf ( 1, '  The point is INSIDE the triangle.\n' );
    end

  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_02\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end

