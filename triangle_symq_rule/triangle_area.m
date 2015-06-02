function area = triangle_area ( vert1, vert2, vert3 )

%*****************************************************************************80
%
%% TRIANGLE_AREA returns the area of a triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, real VERT1(2), VERT2(2), VERT3(2), the vertices of
%    the triangle.
%
%    Output, real AREA, the area of the triangle.
%
  area = 0.5 * ...
    ( ...
        ( vert2(1) - vert1(1) ) * ( vert3(2) - vert1(2) ) ...
      - ( vert3(1) - vert1(1) ) * ( vert2(2) - vert1(2) ) ...
    );

  return
end
