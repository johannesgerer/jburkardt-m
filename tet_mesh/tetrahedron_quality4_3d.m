function quality4 = tetrahedron_quality4_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY4_3D computes the minimum solid angle of a tetrahedron.
%
%  Discussion:
%
%    This routine computes a quality measure for a tetrahedron, based
%    on the sine of half the minimum of the four solid angles.
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
%    Output, real QUALITY4, the value of the quality measure.
%
  dim_num = 3;
%
%  Compute the vectors that represent the sides.
%
  ab(1:dim_num) = tetra(1:dim_num,2) - tetra(1:dim_num,1);
  ac(1:dim_num) = tetra(1:dim_num,3) - tetra(1:dim_num,1);
  ad(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,1);
  bc(1:dim_num) = tetra(1:dim_num,3) - tetra(1:dim_num,2);
  bd(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,2);
  cd(1:dim_num) = tetra(1:dim_num,4) - tetra(1:dim_num,3);
%
%  Compute the lengths of the sides.
%
  lab = sqrt ( sum ( ab(1:dim_num).^2 ) );
  lac = sqrt ( sum ( ac(1:dim_num).^2 ) );
  lad = sqrt ( sum ( ad(1:dim_num).^2 ) );
  lbc = sqrt ( sum ( bc(1:dim_num).^2 ) );
  lbd = sqrt ( sum ( bd(1:dim_num).^2 ) );
  lcd = sqrt ( sum ( cd(1:dim_num).^2 ) );
%
%  Compute the volume
%
  volume = abs ( ...
      ab(1) * ( ac(2) * ad(3) - ac(3) * ad(2) ) ...
    + ab(2) * ( ac(3) * ad(1) - ac(1) * ad(3) ) ...
    + ab(3) * ( ac(1) * ad(2) - ac(2) * ad(1) ) ) / 6.0;

  quality4 = 1.0;

  l1 = lab + lac;
  l2 = lab + lad;
  l3 = lac + lad;

  denom = ( l1 + lbc ) * ( l1 - lbc ) ...
        * ( l2 + lbd ) * ( l2 - lbd ) ...
        * ( l3 + lcd ) * ( l3 - lcd );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  l1 = lab + lbc;
  l2 = lab + lbd;
  l3 = lbc + lbd;

  denom = ( l1 + lac ) * ( l1 - lac ) ...
        * ( l2 + lad ) * ( l2 - lad ) ...
        * ( l3 + lcd ) * ( l3 - lcd );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  l1 = lac + lbc;
  l2 = lac + lcd;
  l3 = lbc + lcd;

  denom = ( l1 + lab ) * ( l1 - lab ) ...
        * ( l2 + lad ) * ( l2 - lad ) ...
        * ( l3 + lbd ) * ( l3 - lbd );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  l1 = lad + lbd;
  l2 = lad + lcd;
  l3 = lbd + lcd;

  denom = ( l1 + lab ) * ( l1 - lab ) ...
        * ( l2 + lac ) * ( l2 - lac ) ...
        * ( l3 + lbc ) * ( l3 - lbc );

  if ( denom <= 0.0 )
    quality4 = 0.0;
  else
    quality4 = min ( quality4, 12.0 * volume / sqrt ( denom ) );
  end

  quality4 = quality4 * 1.5 * sqrt ( 6.0 );

  return
end
