function [ v1, v2, v3, v4 ] = tetrahedron_ref ( )

%*****************************************************************************80
%
%% TETRAHEDRON_REF returns the vertices of the reference tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2014
%
%  Author:
%
%    John Burkardt.
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
%    Output, real V1(3), V2(3), V3(3), V4(3), the vertices.
%
  v1(1) = - 1.0;
  v1(2) = - 1.0 / sqrt ( 3.0 );
  v1(3) = - 1.0 / sqrt ( 6.0 );

  v2(1) =   0.0;
  v2(2) =   2.0 / sqrt ( 3.0 );
  v2(3) = - 1.0 / sqrt ( 6.0 );

  v3(1) =   1.0;
  v3(2) = - 1.0 / sqrt ( 3.0 );
  v3(3) = - 1.0 / sqrt ( 6.0 );

  v4(1) =   0.0;
  v4(2) =   0.0;
  v4(3) =   3.0 / sqrt ( 6.0 );

  return
end

