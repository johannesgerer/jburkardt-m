function geometry_test0485 ( )

%*****************************************************************************80
%
%% TEST0485 tests PARALLELOGRAM_CONTAINS_POINT_2D
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 51;
  dim_num = 2;

  p1 = [ 0.2, 0.0 ];
  p2 = [ 0.4, 0.6 ];
  p3 = [ 0.6, 0.4 ];
  xhi =  1.0;
  xlo =  0.0;
  yhi =  1.0;
  ylo =  0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0485\n' );
  fprintf ( 1, '  PARALLELOGRAM_CONTAINS_POINT_2D reports if a\n' );
  fprintf ( 1, '  parallelogram contains a point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will call the function repeatedly, and draw\n' );
  fprintf ( 1, '  a sketch of the unit square.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n

    p(2) = ( ( n - i      ) * yhi   ...
           + (     i - 1 ) * ylo ) ...
           / ( n     - 1 );

    for j = 1 : n

      p(1) = ( ( n - j      ) * xlo   ...
             + (     j - 1 ) * xhi ) ...
             / ( n     - 1 );

      if ( parallelogram_contains_point_2d ( p1, p2, p3, p ) )
        fprintf ( 1, '*' );
      else
        fprintf ( 1, '-' );
      end

    end
    fprintf ( 1, '\n' );
  end

  return
end
