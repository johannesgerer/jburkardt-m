function quality3 = tetrahedron_quality3_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY3_3D computes the mean ratio of a tetrahedron.
%
%  Discussion:
%
%    This routine computes QUALITY3, the eigenvalue or mean ratio of
%    a tetrahedron.
%
%      QUALITY3 = 12 * ( 3 * volume )**(2/3) / (sum of square of edge lengths).
%
%    This value may be used as a shape quality measure for the tetrahedron.
%
%    For an equilateral tetrahedron, the value of this quality measure
%    will be 1.  For any other tetrahedron, the value will be between
%    0 and 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2005
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real QUALITY3, the mean ratio of the tetrahedron.
%
  dim_num = 3;
%
%  Compute the vectors representing the sides of the tetrahedron.
%
  ab(1:3) = tetra(1:3,2) - tetra(1:3,1);
  ac(1:3) = tetra(1:3,3) - tetra(1:3,1);
  ad(1:3) = tetra(1:3,4) - tetra(1:3,1);
  bc(1:3) = tetra(1:3,3) - tetra(1:3,2);
  bd(1:3) = tetra(1:3,4) - tetra(1:3,2);
  cd(1:3) = tetra(1:3,4) - tetra(1:3,3);
%
%  Compute the squares of the lengths of the sides.
%
  lab = sum ( ab(1:dim_num).^2 );
  lac = sum ( ac(1:dim_num).^2 );
  lad = sum ( ad(1:dim_num).^2 );
  lbc = sum ( bc(1:dim_num).^2 );
  lbd = sum ( bd(1:dim_num).^2 );
  lcd = sum ( cd(1:dim_num).^2 );
%
%  Compute the volume.
%
  vol = abs ( ...
      ab(1) * ( ac(2) * ad(3) - ac(3) * ad(2) ) ...
    + ab(2) * ( ac(3) * ad(1) - ac(1) * ad(3) ) ...
    + ab(3) * ( ac(1) * ad(2) - ac(2) * ad(1) ) ) / 6.0;

  denom = lab + lac + lad + lbc + lbd + lcd;

  if ( denom == 0.0 ) then
    quality3 = 0.0;
  else
    quality3 = 12.0 * ( 3.0 * vol ).^( 2.0 / 3.0 ) / denom;
  end

  return
end
