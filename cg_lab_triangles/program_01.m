function program_01 ( )

%*****************************************************************************80
%
%% PROGRAM_01 demonstrates point and line orientation.
%
%  Discussion:
%
%    The program
%    * reads a line L (defined by two points),
%    * computes and prints the length of the direction vector
%    * computes and prints the unit normal vector
%    * reads a point P
%    * computes the signed distance from P to L.
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
  fprintf ( 1, 'PROGRAM_01 - Point/Line Orientation\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define a line L:\n' );
  l_p1 = input ( '  Enter [ L.p1.x, L.p1.y]: ' ); 
  l_p2 = input ( '  Enter [ L.p2.x, L.p2.y]: ' ); 

  l_dv = l_p2 - l_p1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Direction vector L.DV = (%f  %f)\n', l_dv );

  l_nv(1) = - l_dv(2);
  l_nv(2) =   l_dv(1);

  l_nv = l_nv / sqrt ( l_nv(1)^2 + l_nv(2)^2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normal vector L.NV = [%f  %f]\n', l_nv );

  while ( 1 )

    p = [];
    fprintf ( 1, '\n' );
    p = input ( '  Enter a point [ P.x, P.y], or RETURN to quit: ' );

    if ( isempty ( p ) )
      break
    end

    l_p_dist = l_nv * ( p - l_p1 )';

    fprintf ( 1, '  (L,P) distance = %d\n', l_p_dist );

  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_01\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end
