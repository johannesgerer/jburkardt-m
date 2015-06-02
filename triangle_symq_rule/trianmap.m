function [ rnodes, whts ] = trianmap ( numnodes, vert1, vert2, vert3, ...
  rnodes, whts )

%*****************************************************************************80
%
%% TRIANMAP maps rules from the reference triangle to the user triangle.
%
%  Discussion:
%
%    This routine maps the quadrature nodes on the reference
%    triangle into a user-defined triangle specified by its vertices.
%
%    The weights are rescaled accordingly, so that
%    the resulting quadrature will integrate correctly constants, i.e.
%    the sum of the weights is the area of the user-defined triangle.
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
%    Input, integer NUMNODES, the number of nodes.
%
%    Input, real VERT1(2), VERT2(2), VERT3(2), the vertices of
%    the triangle on which the quadrature rule is to be constructed.
%
%    Input/output, real RNODES(2,NUMNODES), the nodes.
%
%    Input/output, real WHTS(NUMNODES), the weights.
%
  area = abs ( triangle_area ( vert1, vert2, vert3 );

  scale = sum ( whts(1:numnodes) );
  scale = area / scale;

  for i = 1 : numnodes

    [ u, v ] = triasimp ( rnodes(1,i), rnodes(2,i) );

    x = ( vert2(1) - vert1(1) ) * u ...
      + ( vert3(1) - vert1(1) ) * v + vert1(1);

    y = ( vert2(2) - vert1(2) ) * u ...
      + ( vert3(2) - vert1(2) ) * v + vert1(2);

    rnodes(1,i) = x;
    rnodes(2,i) = y;
    whts(i) = whts(i) * scale;

  end

  return
end
