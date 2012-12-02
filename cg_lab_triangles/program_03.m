function program_03 ( )

%*****************************************************************************80
%
%% PROGRAM_03 demonstrates barycentric coordinates.
%
%  Discussion:
%
%    The program
%    * reads a triangle T (defined by three points),
%    * computes and prints the area;
%    * computes and prints the angles;
%    * reads a point P
%    * computes the signed areas of the subtriangles;
%    * computes the barycentric coordinates.
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
  fprintf ( 1, 'PROGRAM_03 - Barycentric Coordinates\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define a triangle T:\n' );

  t_v1 = input ( '  Enter [ T.v1.x, T.v1.y]: ' ); 
  t_v2 = input ( '  Enter [ T.v2.x, T.v2.y]: ' ); 
  t_v3 = input ( '  Enter [ T.v3.x, T.v3.y]: ' ); 
%
%  Compute the area.
%
  t_area = 0.5 * ( t_v1(1) * ( t_v2(2) - t_v3(2) ) ...
                 + t_v2(1) * ( t_v3(2) - t_v1(2) ) ...
                 + t_v3(1) * ( t_v1(2) - t_v2(2) ) );
             
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle area = %f\n', t_area );
%
%  Check various points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now we compute barycentric coordinates for points.\n' );
  fprintf ( 1, '\n' );

  while ( 1 )

    p = [];
    fprintf ( 1, '\n' );
    p = input ( '  Enter a point [ P.x, P.y], or RETURN to quit: ' );

    if ( isempty ( p ) )
      break
    end
%
%  Compute the areas of the three subtriangles.
%
    tpbc_area = 0.5 * ( p(1)    * ( t_v2(2) - t_v3(2) ) ...
                      + t_v2(1) * ( t_v3(2) - p(2)    ) ...
                      + t_v3(1) * ( p(2)    - t_v2(2) ) );

    tapc_area = 0.5 * ( t_v1(1) * ( p(2)    - t_v3(2) ) ...
                      + p(1)    * ( t_v3(2) - t_v1(2) ) ...
                      + t_v3(1) * ( t_v1(2) - p(2)    ) );

    tabp_area = 0.5 * ( t_v1(1) * ( t_v2(2) - p(2)    ) ...
                      + t_v2(1) * ( p(2)    - t_v1(2) ) ...
                      + p(1)    * ( t_v1(2) - t_v2(2) ) );

    xi1 = tpbc_area / t_area;
    xi2 = tapc_area / t_area;
    xi3 = tabp_area / t_area;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  PBC = %8.4f  XI1 = %8.4f\n', tpbc_area, xi1 );
    fprintf ( 1, '  APC = %8.4f  XI2 = %8.4f\n', tapc_area, xi2 );
    fprintf ( 1, '  APB = %8.4f  XI3 = %8.4f\n', tabp_area, xi3 );
    sum1 = tpbc_area + tapc_area + tabp_area;
    sum2 = xi1 + xi2 + xi3;
    fprintf ( 1, '  Sum = %8.4f  Sum = %8.4f\n', sum1, sum2 );

  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_03\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end

