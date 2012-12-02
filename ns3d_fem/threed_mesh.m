function [x, e_conn] = threed_mesh(order, xl,yl,zl, jmax,kmax,lmax)
%-----------------------------------------------------------------------
%  threed_mesh.m - Creates a mesh for a rectangular domain.  Either
%                  linear or quadratic tetrahedral elements are
%                  constructed from "cubes."
%
%  Copyright (c) 2008, Jeff Borggaard, Virginia Tech
%  Version: 1.1
%
%  Usage:     [x, e_conn, variable, index_bc] = ...
%             threed_mesh(order, xl,yl,zl, jmax,kmax,lmax)
%
%  Variables:     order
%                        order of element:
%                          order = 1 => linear tetrahedrons
%                          order = 2 => quadratic tetrahedrons
%
%                 (xl,yl,zl)
%                        (optional) Length, Width and Height of the box
%
%                 (jmax,kmax,lmax)
%                        (optional) Number of nodes in each direction
%                        should be odd for quadratic elements
%-----------------------------------------------------------------------

if (nargin==0)
  order = 1;
end

if (nargin<7)
  xl = 1; yl = 1; zl = 1;
  jmax = 5; kmax = 5; lmax = 5;
end

deltax = xl/(jmax-1);  deltay = yl/(kmax-1);  deltaz = zl/(lmax-1);

if ( order==1 )
  for l=1:lmax
    for k=1:kmax
      for j=1:jmax
        i = j + (k-1)*jmax + (l-1)*jmax*kmax;
        x(i,1) = deltax*(j-1);
        x(i,2) = deltay*(k-1);
        x(i,3) = deltaz*(l-1);
      end
    end
  end
elseif ( order==2 )

  for j=1:jmax
    points_x(j) = deltax*(j-1);
  end

  for k=1:kmax
    points_y(k) = deltay*(k-1);
  end

  for l=1:lmax
    points_z(l) = deltaz*(l-1);
  end

  for l=0:lmax-1
    l_odd = mod(l,2);

    for k=0:kmax-1
      k_odd = mod(k,2);

      if (k_odd & l_odd)      % skip center of cubes
        for j=0:2:jmax-1
          i = jkl_to_global(j,k,l,jmax,kmax,lmax);
          x(i,1) = points_x(j+1);
          x(i,2) = points_y(k+1);
          x(i,3) = points_z(l+1);
        end
      else                    % fill the entire row
        for j=0:jmax-1
          i = jkl_to_global(j,k,l,jmax,kmax,lmax);
          x(i,1) = points_x(j+1);
          x(i,2) = points_y(k+1);
          x(i,3) = points_z(l+1);
        end
      end
    end % k-loop
  end % l-loop

else
  error(' Orders other than 1 or 2 are not implemented \n')
end

if ( order==1 )
  % Set up connectivity (for a mesh of linear elements)
  nel = 0;
  for l=1:lmax-1
    for k=1:kmax-1
      for j=1:jmax-1
        i1 = j + (k-1)*jmax + (l-1)*jmax*kmax;
        i2 = i1 + 1;
        i3 = i1 + jmax;
        i4 = i3 + 1;
        i5 = i1 + jmax*kmax;
        i6 = i5 + 1;
        i7 = i5 + jmax;
        i8 = i7 + 1;

        e_conn(nel+1,:) = [ i1 i5 i2 i3 ];
        e_conn(nel+2,:) = [ i6 i2 i5 i8 ];
        e_conn(nel+3,:) = [ i7 i3 i8 i5 ];
        e_conn(nel+4,:) = [ i4 i8 i3 i2 ];
        e_conn(nel+5,:) = [ i5 i8 i2 i3 ];  % connect the stump element

%       wrong_edges
        nel = nel + 5;
      end
    end
  end

elseif ( order==2 )
  % Set up connectivity (for a mesh of quadratic elements)
  % loop over 5x5x5 blocks and carve into 40 elements so that they tile...

  vertex_corner = 0;
  if ( vertex_corner )  %  build a mesh with one vertex in the corners
    ee = 0;
    for l=0:4:lmax-3
    for k=0:4:kmax-3
    for j=0:4:jmax-3
      i0   = jkl_to_global(j  , k  , l  ,jmax,kmax,lmax);
      i1   = jkl_to_global(j+1, k  , l  ,jmax,kmax,lmax);
      i2   = jkl_to_global(j+2, k  , l  ,jmax,kmax,lmax);
      i3   = jkl_to_global(j+3, k  , l  ,jmax,kmax,lmax);
      i4   = jkl_to_global(j+4, k  , l  ,jmax,kmax,lmax);
      i5   = jkl_to_global(j  , k+1, l  ,jmax,kmax,lmax);
      i6   = jkl_to_global(j+1, k+1, l  ,jmax,kmax,lmax);
      i7   = jkl_to_global(j+2, k+1, l  ,jmax,kmax,lmax);
      i8   = jkl_to_global(j+3, k+1, l  ,jmax,kmax,lmax);
      i9   = jkl_to_global(j+4, k+1, l  ,jmax,kmax,lmax);
      i10  = jkl_to_global(j  , k+2, l  ,jmax,kmax,lmax);
      i11  = jkl_to_global(j+1, k+2, l  ,jmax,kmax,lmax);
      i12  = jkl_to_global(j+2, k+2, l  ,jmax,kmax,lmax);
      i13  = jkl_to_global(j+3, k+2, l  ,jmax,kmax,lmax);
      i14  = jkl_to_global(j+4, k+2, l  ,jmax,kmax,lmax);
      i15  = jkl_to_global(j  , k+3, l  ,jmax,kmax,lmax);
      i16  = jkl_to_global(j+1, k+3, l  ,jmax,kmax,lmax);
      i17  = jkl_to_global(j+2, k+3, l  ,jmax,kmax,lmax);
      i18  = jkl_to_global(j+3, k+3, l  ,jmax,kmax,lmax);
      i19  = jkl_to_global(j+4, k+3, l  ,jmax,kmax,lmax);
      i20  = jkl_to_global(j  , k+4, l  ,jmax,kmax,lmax);
      i21  = jkl_to_global(j+1, k+4, l  ,jmax,kmax,lmax);
      i22  = jkl_to_global(j+2, k+4, l  ,jmax,kmax,lmax);
      i23  = jkl_to_global(j+3, k+4, l  ,jmax,kmax,lmax);
      i24  = jkl_to_global(j+4, k+4, l  ,jmax,kmax,lmax);

      i25  = jkl_to_global(j  , k  , l+1,jmax,kmax,lmax);
      i26  = jkl_to_global(j+1, k  , l+1,jmax,kmax,lmax);
      i27  = jkl_to_global(j+2, k  , l+1,jmax,kmax,lmax);
      i28  = jkl_to_global(j+3, k  , l+1,jmax,kmax,lmax);
      i29  = jkl_to_global(j+4, k  , l+1,jmax,kmax,lmax);
      i30  = jkl_to_global(j  , k+1, l+1,jmax,kmax,lmax);
      i31  = jkl_to_global(j+1, k+1, l+1,jmax,kmax,lmax);
      i32  = jkl_to_global(j+2, k+1, l+1,jmax,kmax,lmax);
      i33  = jkl_to_global(j+3, k+1, l+1,jmax,kmax,lmax);
      i34  = jkl_to_global(j+4, k+1, l+1,jmax,kmax,lmax);
      i35  = jkl_to_global(j  , k+2, l+1,jmax,kmax,lmax);
      i36  = jkl_to_global(j+1, k+2, l+1,jmax,kmax,lmax);
      i37  = jkl_to_global(j+2, k+2, l+1,jmax,kmax,lmax);
      i38  = jkl_to_global(j+3, k+2, l+1,jmax,kmax,lmax);
      i39  = jkl_to_global(j+4, k+2, l+1,jmax,kmax,lmax);
      i40  = jkl_to_global(j  , k+3, l+1,jmax,kmax,lmax);
      i41  = jkl_to_global(j+1, k+3, l+1,jmax,kmax,lmax);
      i42  = jkl_to_global(j+2, k+3, l+1,jmax,kmax,lmax);
      i43  = jkl_to_global(j+3, k+3, l+1,jmax,kmax,lmax);
      i44  = jkl_to_global(j+4, k+3, l+1,jmax,kmax,lmax);
      i45  = jkl_to_global(j  , k+4, l+1,jmax,kmax,lmax);
      i46  = jkl_to_global(j+1, k+4, l+1,jmax,kmax,lmax);
      i47  = jkl_to_global(j+2, k+4, l+1,jmax,kmax,lmax);
      i48  = jkl_to_global(j+3, k+4, l+1,jmax,kmax,lmax);
      i49  = jkl_to_global(j+4, k+4, l+1,jmax,kmax,lmax);

      i50  = jkl_to_global(j  , k  , l+2,jmax,kmax,lmax);
      i51  = jkl_to_global(j+1, k  , l+2,jmax,kmax,lmax);
      i52  = jkl_to_global(j+2, k  , l+2,jmax,kmax,lmax);
      i53  = jkl_to_global(j+3, k  , l+2,jmax,kmax,lmax);
      i54  = jkl_to_global(j+4, k  , l+2,jmax,kmax,lmax);
      i55  = jkl_to_global(j  , k+1, l+2,jmax,kmax,lmax);
      i56  = jkl_to_global(j+1, k+1, l+2,jmax,kmax,lmax);
      i57  = jkl_to_global(j+2, k+1, l+2,jmax,kmax,lmax);
      i58  = jkl_to_global(j+3, k+1, l+2,jmax,kmax,lmax);
      i59  = jkl_to_global(j+4, k+1, l+2,jmax,kmax,lmax);
      i60  = jkl_to_global(j  , k+2, l+2,jmax,kmax,lmax);
      i61  = jkl_to_global(j+1, k+2, l+2,jmax,kmax,lmax);
      i62  = jkl_to_global(j+2, k+2, l+2,jmax,kmax,lmax);
      i63  = jkl_to_global(j+3, k+2, l+2,jmax,kmax,lmax);
      i64  = jkl_to_global(j+4, k+2, l+2,jmax,kmax,lmax);
      i65  = jkl_to_global(j  , k+3, l+2,jmax,kmax,lmax);
      i66  = jkl_to_global(j+1, k+3, l+2,jmax,kmax,lmax);
      i67  = jkl_to_global(j+2, k+3, l+2,jmax,kmax,lmax);
      i68  = jkl_to_global(j+3, k+3, l+2,jmax,kmax,lmax);
      i69  = jkl_to_global(j+4, k+3, l+2,jmax,kmax,lmax);
      i70  = jkl_to_global(j  , k+4, l+2,jmax,kmax,lmax);
      i71  = jkl_to_global(j+1, k+4, l+2,jmax,kmax,lmax);
      i72  = jkl_to_global(j+2, k+4, l+2,jmax,kmax,lmax);
      i73  = jkl_to_global(j+3, k+4, l+2,jmax,kmax,lmax);
      i74  = jkl_to_global(j+4, k+4, l+2,jmax,kmax,lmax);

      i75  = jkl_to_global(j  , k  , l+3,jmax,kmax,lmax);
      i76  = jkl_to_global(j+1, k  , l+3,jmax,kmax,lmax);
      i77  = jkl_to_global(j+2, k  , l+3,jmax,kmax,lmax);
      i78  = jkl_to_global(j+3, k  , l+3,jmax,kmax,lmax);
      i79  = jkl_to_global(j+4, k  , l+3,jmax,kmax,lmax);
      i80  = jkl_to_global(j  , k+1, l+3,jmax,kmax,lmax);
      i81  = jkl_to_global(j+1, k+1, l+3,jmax,kmax,lmax);
      i82  = jkl_to_global(j+2, k+1, l+3,jmax,kmax,lmax);
      i83  = jkl_to_global(j+3, k+1, l+3,jmax,kmax,lmax);
      i84  = jkl_to_global(j+4, k+1, l+3,jmax,kmax,lmax);
      i85  = jkl_to_global(j  , k+2, l+3,jmax,kmax,lmax);
      i86  = jkl_to_global(j+1, k+2, l+3,jmax,kmax,lmax);
      i87  = jkl_to_global(j+2, k+2, l+3,jmax,kmax,lmax);
      i88  = jkl_to_global(j+3, k+2, l+3,jmax,kmax,lmax);
      i89  = jkl_to_global(j+4, k+2, l+3,jmax,kmax,lmax);
      i90  = jkl_to_global(j  , k+3, l+3,jmax,kmax,lmax);
      i91  = jkl_to_global(j+1, k+3, l+3,jmax,kmax,lmax);
      i92  = jkl_to_global(j+2, k+3, l+3,jmax,kmax,lmax);
      i93  = jkl_to_global(j+3, k+3, l+3,jmax,kmax,lmax);
      i94  = jkl_to_global(j+4, k+3, l+3,jmax,kmax,lmax);
      i95  = jkl_to_global(j  , k+4, l+3,jmax,kmax,lmax);
      i96  = jkl_to_global(j+1, k+4, l+3,jmax,kmax,lmax);
      i97  = jkl_to_global(j+2, k+4, l+3,jmax,kmax,lmax);
      i98  = jkl_to_global(j+3, k+4, l+3,jmax,kmax,lmax);
      i99  = jkl_to_global(j+4, k+4, l+3,jmax,kmax,lmax);

      i100 = jkl_to_global(j  , k  , l+4,jmax,kmax,lmax);
      i101 = jkl_to_global(j+1, k  , l+4,jmax,kmax,lmax);
      i102 = jkl_to_global(j+2, k  , l+4,jmax,kmax,lmax);
      i103 = jkl_to_global(j+3, k  , l+4,jmax,kmax,lmax);
      i104 = jkl_to_global(j+4, k  , l+4,jmax,kmax,lmax);
      i105 = jkl_to_global(j  , k+1, l+4,jmax,kmax,lmax);
      i106 = jkl_to_global(j+1, k+1, l+4,jmax,kmax,lmax);
      i107 = jkl_to_global(j+2, k+1, l+4,jmax,kmax,lmax);
      i108 = jkl_to_global(j+3, k+1, l+4,jmax,kmax,lmax);
      i109 = jkl_to_global(j+4, k+1, l+4,jmax,kmax,lmax);
      i110 = jkl_to_global(j  , k+2, l+4,jmax,kmax,lmax);
      i111 = jkl_to_global(j+1, k+2, l+4,jmax,kmax,lmax);
      i112 = jkl_to_global(j+2, k+2, l+4,jmax,kmax,lmax);
      i113 = jkl_to_global(j+3, k+2, l+4,jmax,kmax,lmax);
      i114 = jkl_to_global(j+4, k+2, l+4,jmax,kmax,lmax);
      i115 = jkl_to_global(j  , k+3, l+4,jmax,kmax,lmax);
      i116 = jkl_to_global(j+1, k+3, l+4,jmax,kmax,lmax);
      i117 = jkl_to_global(j+2, k+3, l+4,jmax,kmax,lmax);
      i118 = jkl_to_global(j+3, k+3, l+4,jmax,kmax,lmax);
      i119 = jkl_to_global(j+4, k+3, l+4,jmax,kmax,lmax);
      i120 = jkl_to_global(j  , k+4, l+4,jmax,kmax,lmax);
      i121 = jkl_to_global(j+1, k+4, l+4,jmax,kmax,lmax);
      i122 = jkl_to_global(j+2, k+4, l+4,jmax,kmax,lmax);
      i123 = jkl_to_global(j+3, k+4, l+4,jmax,kmax,lmax);
      i124 = jkl_to_global(j+4, k+4, l+4,jmax,kmax,lmax);

      % first cube

      ee = ee + 1;
      e_conn(ee,:) = [i0, i50, i2, i10, i25, i26, i1, i30, i6, i5];

      ee = ee + 1;
      e_conn(ee,:) = [i52, i2, i50, i62, i27, i26, i51, i32, i56, i57];

      ee = ee + 1;
      e_conn(ee,:) = [i12, i62, i10, i2, i37, i36, i11, i32, i6, i7];

      ee = ee + 1;
      e_conn(ee,:) = [i60, i10, i62, i50, i35, i36, i61, i30, i56, i55];

      ee = ee + 1;
      e_conn(ee,:) = [i2, i50, i62, i10, i26, i56, i32, i30, i36, i6 ];

      % second cube

      ee = ee + 1;
      e_conn(ee,:) = [i52, i54, i2 , i62, i53, i28, i27, i58, i32, i57];

      ee = ee + 1;
      e_conn(ee,:) = [i4 , i2 , i54, i14, i3 , i28, i29, i8 , i34, i9];

      ee = ee + 1;
      e_conn(ee,:) = [i12, i14, i62, i2 , i13, i38, i37, i8 , i32, i7];

      ee = ee + 1;
      e_conn(ee,:) = [i64, i62, i14, i54, i63, i38, i39, i58, i34, i59];

      ee = ee + 1;
      e_conn(ee,:) = [i2 , i62, i54, i14, i32, i58, i28, i38, i34, i8];

      % third cube
      
      ee = ee + 1;
      e_conn(ee,:) = [i52 , i50 , i102, i62 , i51 , i76 , i77 , i56 , i82 , i57];

      ee = ee + 1;
      e_conn(ee,:) = [i100, i102, i50 , i110, i101, i76 , i75 , i106, i80 , i105];

      ee = ee + 1;
      e_conn(ee,:) = [i60 , i62 , i110, i50 , i61 , i86 , i85 , i56 , i80 , i55];

      ee = ee + 1;
      e_conn(ee,:) = [i112, i110, i62 , i102, i111, i86 , i87 , i106, i82 , i107];

      ee = ee + 1;
      e_conn(ee,:) = [i110, i102, i50 , i62 , i106, i76 , i80 , i82 , i56 , i86];

      % fourth cube
      
      ee = ee + 1;
      e_conn(ee,:) = [i52 , i102, i54 , i62 , i77 , i78 , i53 , i82 , i58 , i57];

      ee = ee + 1;
      e_conn(ee,:) = [i104, i54 , i102, i114, i79 , i78 , i103, i84 , i108, i109];

      ee = ee + 1;
      e_conn(ee,:) = [i64 , i114, i62 , i54 , i89 , i88 , i63 , i84 , i58 , i59];

      ee = ee + 1;
      e_conn(ee,:) = [i112, i62 , i114, i102, i87 , i88 , i113, i82 , i108, i107];

      ee = ee + 1;
      e_conn(ee,:) = [i54 , i102, i114, i62 , i78 , i108, i84 , i82 , i88 , i58];

    ee = ee + 1;
    e_conn(ee,:) = [i12 , i10 , i62 , i22 , i11 , i36 , i37 , i16 , i42 , i17];

    ee = ee + 1;
    e_conn(ee,:) = [i60 , i62 , i10 , i70 , i61 , i36 , i35 , i66 , i40 , i65 ];

    ee = ee + 1;
    e_conn(ee,:) = [i20 , i22 , i70 , i10 , i21 , i46 , i45 , i16 , i40 , i15];

    ee = ee + 1;
    e_conn(ee,:) = [i72 , i70 , i22 , i62 , i71 , i46 , i47 , i66 , i42 , i67];

    ee = ee + 1;
    e_conn(ee,:) = [i10 , i62 , i22 , i70 , i36 , i42 , i16 , i66 , i46 , i40];

    ee = ee + 1;
    e_conn(ee,:) = [i12 , i62 , i14 , i22 , i37 , i38 , i13 , i42 , i18 , i17];

    ee = ee + 1;
    e_conn(ee,:) = [i64 , i14 , i62 , i74 , i39 , i38 , i63 , i44 , i68 , i69 ];

    ee = ee + 1;
    e_conn(ee,:) = [i72 , i22 , i74 , i62 , i47 , i48 , i73 , i42 , i68 , i67];

    ee = ee + 1;
    e_conn(ee,:) = [i24 , i74 , i22 , i14 , i49 , i48 , i23 , i44 , i18 , i19];

    ee = ee + 1;
    e_conn(ee,:) = [i14 , i62 , i74 , i22 , i38 , i68 , i44 , i42 , i48 , i18];

    ee = ee + 1;
    e_conn(ee,:) = [i60 , i110, i62 , i70 , i85 , i86 , i61 , i90 , i66 , i65];

    ee = ee + 1;
    e_conn(ee,:) = [i112, i62 , i110, i122, i87 , i86 , i111, i92 , i116, i117];

    ee = ee + 1;
    e_conn(ee,:) = [i72 , i122, i70 , i62 , i97 , i96 , i71 , i92 , i66 , i67 ];

    ee = ee + 1;
    e_conn(ee,:) = [i120, i70 , i122, i110, i95 , i96 , i121, i90 , i116, i115];

      ee = ee + 1;
      e_conn(ee,:) = [i62 , i110, i122, i70 , i86 , i116, i92 , i90 , i96 , i66];

      ee = ee + 1;
      e_conn(ee,:) = [i64 , i62 , i114, i74 , i63 , i88 , i89 , i68 , i94 , i69 ];

      ee = ee + 1;
      e_conn(ee,:) = [i112, i114, i62 , i122, i113, i88 , i87 , i118, i92 , i117];

      ee = ee + 1;
      e_conn(ee,:) = [i72 , i74 , i122, i62 , i73 , i98 , i97 , i68 , i92 , i67];

      ee = ee + 1;
      e_conn(ee,:) = [i124, i122, i74 , i114, i123, i98 , i99 , i118, i94 , i119];

      ee = ee + 1;
      e_conn(ee,:) = [i62 , i114, i74 , i122, i88 , i94 , i68 , i118, i98 , i92];

    end % j-loop
    end % k-loop
    end % l-loop
  
  else    %  mesh several tetrahedra into corners
    ee = 0;
    for l=0:4:lmax-3
    for k=0:4:kmax-3
    for j=0:4:jmax-3

      i1   = jkl_to_global(j  , k  , l  ,jmax,kmax,lmax);
      i2   = jkl_to_global(j+1, k  , l  ,jmax,kmax,lmax);
      i3   = jkl_to_global(j+2, k  , l  ,jmax,kmax,lmax);
      i4   = jkl_to_global(j+3, k  , l  ,jmax,kmax,lmax);
      i5   = jkl_to_global(j+4, k  , l  ,jmax,kmax,lmax);
      i6   = jkl_to_global(j  , k+1, l  ,jmax,kmax,lmax);
      i7   = jkl_to_global(j+1, k+1, l  ,jmax,kmax,lmax);
      i8   = jkl_to_global(j+2, k+1, l  ,jmax,kmax,lmax);
      i9   = jkl_to_global(j+3, k+1, l  ,jmax,kmax,lmax);
      i10  = jkl_to_global(j+4, k+1, l  ,jmax,kmax,lmax);
      i11  = jkl_to_global(j  , k+2, l  ,jmax,kmax,lmax);
      i12  = jkl_to_global(j+1, k+2, l  ,jmax,kmax,lmax);
      i13  = jkl_to_global(j+2, k+2, l  ,jmax,kmax,lmax);
      i14  = jkl_to_global(j+3, k+2, l  ,jmax,kmax,lmax);
      i15  = jkl_to_global(j+4, k+2, l  ,jmax,kmax,lmax);
      i16  = jkl_to_global(j  , k+3, l  ,jmax,kmax,lmax);
      i17  = jkl_to_global(j+1, k+3, l  ,jmax,kmax,lmax);
      i18  = jkl_to_global(j+2, k+3, l  ,jmax,kmax,lmax);
      i19  = jkl_to_global(j+3, k+3, l  ,jmax,kmax,lmax);
      i20  = jkl_to_global(j+4, k+3, l  ,jmax,kmax,lmax);
      i21  = jkl_to_global(j  , k+4, l  ,jmax,kmax,lmax);
      i22  = jkl_to_global(j+1, k+4, l  ,jmax,kmax,lmax);
      i23  = jkl_to_global(j+2, k+4, l  ,jmax,kmax,lmax);
      i24  = jkl_to_global(j+3, k+4, l  ,jmax,kmax,lmax);
      i25  = jkl_to_global(j+4, k+4, l  ,jmax,kmax,lmax);

      i26  = jkl_to_global(j  , k  , l+1,jmax,kmax,lmax);
      i27  = jkl_to_global(j+1, k  , l+1,jmax,kmax,lmax);
      i28  = jkl_to_global(j+2, k  , l+1,jmax,kmax,lmax);
      i29  = jkl_to_global(j+3, k  , l+1,jmax,kmax,lmax);
      i30  = jkl_to_global(j+4, k  , l+1,jmax,kmax,lmax);
      i31  = jkl_to_global(j  , k+1, l+1,jmax,kmax,lmax);
%     i31.5= jkl_to_global(j+1, k+1, l+1,jmax,kmax,lmax);
      i32  = jkl_to_global(j+2, k+1, l+1,jmax,kmax,lmax);
%     i32.5= jkl_to_global(j+3, k+1, l+1,jmax,kmax,lmax);
      i33  = jkl_to_global(j+4, k+1, l+1,jmax,kmax,lmax);
      i34  = jkl_to_global(j  , k+2, l+1,jmax,kmax,lmax);
      i35  = jkl_to_global(j+1, k+2, l+1,jmax,kmax,lmax);
      i36  = jkl_to_global(j+2, k+2, l+1,jmax,kmax,lmax);
      i37  = jkl_to_global(j+3, k+2, l+1,jmax,kmax,lmax);
      i38  = jkl_to_global(j+4, k+2, l+1,jmax,kmax,lmax);
      i39  = jkl_to_global(j  , k+3, l+1,jmax,kmax,lmax);
%     i39.5= jkl_to_global(j+1, k+3, l+1,jmax,kmax,lmax);
      i40  = jkl_to_global(j+2, k+3, l+1,jmax,kmax,lmax);
%     i40.5= jkl_to_global(j+3, k+3, l+1,jmax,kmax,lmax);
      i41  = jkl_to_global(j+4, k+3, l+1,jmax,kmax,lmax);
      i42  = jkl_to_global(j  , k+4, l+1,jmax,kmax,lmax);
      i43  = jkl_to_global(j+1, k+4, l+1,jmax,kmax,lmax);
      i44  = jkl_to_global(j+2, k+4, l+1,jmax,kmax,lmax);
      i45  = jkl_to_global(j+3, k+4, l+1,jmax,kmax,lmax);
      i46  = jkl_to_global(j+4, k+4, l+1,jmax,kmax,lmax);

      i47  = jkl_to_global(j  , k  , l+2,jmax,kmax,lmax);
      i48  = jkl_to_global(j+1, k  , l+2,jmax,kmax,lmax);
      i49  = jkl_to_global(j+2, k  , l+2,jmax,kmax,lmax);
      i50  = jkl_to_global(j+3, k  , l+2,jmax,kmax,lmax);
      i51  = jkl_to_global(j+4, k  , l+2,jmax,kmax,lmax);
      i52  = jkl_to_global(j  , k+1, l+2,jmax,kmax,lmax);
      i53  = jkl_to_global(j+1, k+1, l+2,jmax,kmax,lmax);
      i54  = jkl_to_global(j+2, k+1, l+2,jmax,kmax,lmax);
      i55  = jkl_to_global(j+3, k+1, l+2,jmax,kmax,lmax);
      i56  = jkl_to_global(j+4, k+1, l+2,jmax,kmax,lmax);
      i57  = jkl_to_global(j  , k+2, l+2,jmax,kmax,lmax);
      i58  = jkl_to_global(j+1, k+2, l+2,jmax,kmax,lmax);
      i59  = jkl_to_global(j+2, k+2, l+2,jmax,kmax,lmax);
      i60  = jkl_to_global(j+3, k+2, l+2,jmax,kmax,lmax);
      i61  = jkl_to_global(j+4, k+2, l+2,jmax,kmax,lmax);
      i62  = jkl_to_global(j  , k+3, l+2,jmax,kmax,lmax);
      i63  = jkl_to_global(j+1, k+3, l+2,jmax,kmax,lmax);
      i64  = jkl_to_global(j+2, k+3, l+2,jmax,kmax,lmax);
      i65  = jkl_to_global(j+3, k+3, l+2,jmax,kmax,lmax);
      i66  = jkl_to_global(j+4, k+3, l+2,jmax,kmax,lmax);
      i67  = jkl_to_global(j  , k+4, l+2,jmax,kmax,lmax);
      i68  = jkl_to_global(j+1, k+4, l+2,jmax,kmax,lmax);
      i69  = jkl_to_global(j+2, k+4, l+2,jmax,kmax,lmax);
      i70  = jkl_to_global(j+3, k+4, l+2,jmax,kmax,lmax);
      i71  = jkl_to_global(j+4, k+4, l+2,jmax,kmax,lmax);

      i72  = jkl_to_global(j  , k  , l+3,jmax,kmax,lmax);
      i73  = jkl_to_global(j+1, k  , l+3,jmax,kmax,lmax);
      i74  = jkl_to_global(j+2, k  , l+3,jmax,kmax,lmax);
      i75  = jkl_to_global(j+3, k  , l+3,jmax,kmax,lmax);
      i76  = jkl_to_global(j+4, k  , l+3,jmax,kmax,lmax);
      i77  = jkl_to_global(j  , k+1, l+3,jmax,kmax,lmax);
%     i77.5= jkl_to_global(j+1, k+1, l+3,jmax,kmax,lmax);
      i78  = jkl_to_global(j+2, k+1, l+3,jmax,kmax,lmax);
%     i78.5= jkl_to_global(j+3, k+1, l+3,jmax,kmax,lmax);
      i79  = jkl_to_global(j+4, k+1, l+3,jmax,kmax,lmax);
      i80  = jkl_to_global(j  , k+2, l+3,jmax,kmax,lmax);
      i81  = jkl_to_global(j+1, k+2, l+3,jmax,kmax,lmax);
      i82  = jkl_to_global(j+2, k+2, l+3,jmax,kmax,lmax);
      i83  = jkl_to_global(j+3, k+2, l+3,jmax,kmax,lmax);
      i84  = jkl_to_global(j+4, k+2, l+3,jmax,kmax,lmax);
      i85  = jkl_to_global(j  , k+3, l+3,jmax,kmax,lmax);
%     i85.5= jkl_to_global(j+1, k+3, l+3,jmax,kmax,lmax);
      i86  = jkl_to_global(j+2, k+3, l+3,jmax,kmax,lmax);
%     i86.5= jkl_to_global(j+3, k+3, l+3,jmax,kmax,lmax);
      i87  = jkl_to_global(j+4, k+3, l+3,jmax,kmax,lmax);
      i88  = jkl_to_global(j  , k+4, l+3,jmax,kmax,lmax);
      i89  = jkl_to_global(j+1, k+4, l+3,jmax,kmax,lmax);
      i90  = jkl_to_global(j+2, k+4, l+3,jmax,kmax,lmax);
      i91  = jkl_to_global(j+3, k+4, l+3,jmax,kmax,lmax);
      i92  = jkl_to_global(j+4, k+4, l+3,jmax,kmax,lmax);

      i93  = jkl_to_global(j  , k  , l+4,jmax,kmax,lmax);
      i94  = jkl_to_global(j+1, k  , l+4,jmax,kmax,lmax);
      i95  = jkl_to_global(j+2, k  , l+4,jmax,kmax,lmax);
      i96  = jkl_to_global(j+3, k  , l+4,jmax,kmax,lmax);
      i97  = jkl_to_global(j+4, k  , l+4,jmax,kmax,lmax);
      i98  = jkl_to_global(j  , k+1, l+4,jmax,kmax,lmax);
      i99  = jkl_to_global(j+1, k+1, l+4,jmax,kmax,lmax);
      i100 = jkl_to_global(j+2, k+1, l+4,jmax,kmax,lmax);
      i101 = jkl_to_global(j+3, k+1, l+4,jmax,kmax,lmax);
      i102 = jkl_to_global(j+4, k+1, l+4,jmax,kmax,lmax);
      i103 = jkl_to_global(j  , k+2, l+4,jmax,kmax,lmax);
      i104 = jkl_to_global(j+1, k+2, l+4,jmax,kmax,lmax);
      i105 = jkl_to_global(j+2, k+2, l+4,jmax,kmax,lmax);
      i106 = jkl_to_global(j+3, k+2, l+4,jmax,kmax,lmax);
      i107 = jkl_to_global(j+4, k+2, l+4,jmax,kmax,lmax);
      i108 = jkl_to_global(j  , k+3, l+4,jmax,kmax,lmax);
      i109 = jkl_to_global(j+1, k+3, l+4,jmax,kmax,lmax);
      i110 = jkl_to_global(j+2, k+3, l+4,jmax,kmax,lmax);
      i111 = jkl_to_global(j+3, k+3, l+4,jmax,kmax,lmax);
      i112 = jkl_to_global(j+4, k+3, l+4,jmax,kmax,lmax);
      i113 = jkl_to_global(j  , k+4, l+4,jmax,kmax,lmax);
      i114 = jkl_to_global(j+1, k+4, l+4,jmax,kmax,lmax);
      i115 = jkl_to_global(j+2, k+4, l+4,jmax,kmax,lmax);
      i116 = jkl_to_global(j+3, k+4, l+4,jmax,kmax,lmax);
      i117 = jkl_to_global(j+4, k+4, l+4,jmax,kmax,lmax);

      % first cube
      ee = ee + 1;
      e_conn(ee,:) = [i47 , i49 , i1  , i57 , i48 , i27 , i26 , i53 , i31 , i52 ];

      ee = ee + 1;
      e_conn(ee,:) = [i3  , i1  , i49 , i13 , i2  , i27 , i28 , i7  , i32 , i8  ];

      ee = ee + 1;
      e_conn(ee,:) = [i11 , i13 , i57 , i1  , i12 , i35 , i34 , i7  , i31 , i6  ];

      ee = ee + 1;
      e_conn(ee,:) = [i59 , i57 , i13 , i49 , i58 , i35 , i36 , i53 , i32 , i54 ];

      ee = ee + 1;
      e_conn(ee,:) = [i1  , i57 , i49 , i13 , i31 , i53 , i27 , i35 , i32 , i7  ];

      % second cube
      ee = ee + 1;
      e_conn(ee,:) = [i3  , i49 , i5  , i13 , i28 , i29 , i4  , i32 , i9  , i8  ];

      ee = ee + 1;
      e_conn(ee,:) = [i51 , i5  , i49 , i61 , i30 , i29 , i50 , i33 , i55 , i56 ];

      ee = ee + 1;
      e_conn(ee,:) = [i15 , i61 , i13 , i5  , i38 , i37 , i14 , i33 , i9  , i10  ];

      ee = ee + 1;
      e_conn(ee,:) = [i59 , i13 , i61 , i49 , i36 , i37 , i60 , i32 , i55 , i54 ];

      ee = ee + 1;
      e_conn(ee,:) = [i13 , i49 , i5  , i61 , i32 , i29 , i9  , i55 , i33 , i37 ];

      % third cube
      ee = ee + 1;
      e_conn(ee,:) = [i11 , i57 , i13 , i21 , i34 , i35 , i12 , i39 , i17 , i16 ];

      ee = ee + 1;
      e_conn(ee,:) = [i59 , i13 , i57 , i69 , i36 , i35 , i58 , i40 , i63 , i64 ];

      ee = ee + 1;
      e_conn(ee,:) = [i23 , i69 , i21 , i13 , i44 , i43 , i22 , i40 , i17 , i18 ];

      ee = ee + 1;
      e_conn(ee,:) = [i67 , i21 , i69 , i57 , i42 , i43 , i68 , i39 , i63 , i62 ];

      ee = ee + 1;
      e_conn(ee,:) = [i13 , i69 , i21 , i57 , i40 , i43 , i17 , i63 , i39 , i35 ];

      % fourth cube
      ee = ee + 1;
      e_conn(ee,:) = [i15 , i13 , i61 , i25 , i14 , i37 , i38 , i19 , i41 , i20 ];

      ee = ee + 1;
      e_conn(ee,:) = [i59 , i61 , i13 , i69 , i60 , i37 , i36 , i65 , i40 , i64 ];

      ee = ee + 1;
      e_conn(ee,:) = [i23 , i25 , i69 , i13 , i24 , i45 , i44 , i19 , i40 , i18 ];

      ee = ee + 1;
      e_conn(ee,:) = [i71 , i69 , i25 , i61 , i70 , i45 , i46 , i65 , i41 , i66 ];

      ee = ee + 1;
      e_conn(ee,:) = [i13 , i69 , i61 , i25 , i40 , i65 , i37 , i45 , i41 , i19 ];

      % fifth cube
      ee = ee + 1;
      e_conn(ee,:) = [i47 , i93 , i49 , i57 , i72 , i73 , i48 , i77 , i53 , i52 ];

      ee = ee + 1;
      e_conn(ee,:) = [i95 , i49 , i93 , i105, i74 , i73 , i94 , i78 , i99 , i100];

      ee = ee + 1;
      e_conn(ee,:) = [i59 , i105 , i57 , i49 , i82 , i81 , i58 , i78 , i53 , i54 ];

      ee = ee + 1;
      e_conn(ee,:) = [i103, i57 , i105, i93 , i80 , i81 , i104, i77 , i99 , i98 ];

      ee = ee + 1;
      e_conn(ee,:) = [i49 , i57 , i93 , i105, i53 , i77 , i73 , i81 , i99 , i78 ];

      % sixth cube
      ee = ee + 1;
      e_conn(ee,:) = [i51 , i49 , i97 , i61 , i50 , i75 , i76 , i55 , i79 , i56 ];

      ee = ee + 1;
      e_conn(ee,:) = [i95 , i97 , i49 , i105, i96 , i75 , i74 , i101, i78 , i100];

      ee = ee + 1;
      e_conn(ee,:) = [i59 , i61 , i105, i49 , i60 , i83 , i82 , i55 , i78 , i54 ];

      ee = ee + 1;
      e_conn(ee,:) = [i107, i105, i61 , i97 , i106, i83 , i84 , i101, i79 , i102];

      ee = ee + 1;
      e_conn(ee,:) = [i49 , i61 , i105, i97 , i55 , i83 , i78 , i79 , i101, i75 ];

      % seventh cube
      ee = ee + 1;
      e_conn(ee,:) = [i59 , i57 , i105, i69 , i58 , i81 , i82 , i63 , i86 , i64 ];

      ee = ee + 1;
      e_conn(ee,:) = [i103, i105, i57 , i113, i104, i81 , i80 , i109, i85 , i108];

      ee = ee + 1;
      e_conn(ee,:) = [i67 , i69 , i113, i57 , i68 , i89 , i88 , i63 , i85 , i62 ];

      ee = ee + 1;
      e_conn(ee,:) = [i115, i113, i69 , i105, i114, i89 , i90 , i109, i86 , i110];

      ee = ee + 1;
      e_conn(ee,:) = [i57 , i113, i105, i69 , i85 , i109, i81 , i89 , i86 , i63 ];

      % eighth cube
      ee = ee + 1;
      e_conn(ee,:) = [i59 , i105, i61 , i69 , i82 , i83 , i60 , i86 , i65 , i64 ];

      ee = ee + 1;
      e_conn(ee,:) = [i107, i61 , i105, i117, i84 , i83 , i106, i87 , i111, i112];

      ee = ee + 1;
      e_conn(ee,:) = [i71 , i117, i69 , i61 , i92 , i91 , i70 , i87 , i65 , i66 ];

      ee = ee + 1;
      e_conn(ee,:) = [i115, i69 , i117, i105, i90 , i91 , i116, i86 , i111, i110];

      ee = ee + 1;
      e_conn(ee,:) = [i61 , i105, i117, i69 , i83 , i111, i87 , i86 , i91 , i65 ];

    end % j-loop
    end % k-loop
    end % l-loop
  end
  
else
  error(' Orders other than 1 or 2 are not implemented \n')
end



function [i] = jkl_to_global(j,k,l,jmax,kmax,lmax)

% use logic from c-code (j,k,l indices start with 0)

l_odd = mod(l,2);

be = (l+l_odd)/2;    % number of preceeding even numbered l planes
bo = (l-l_odd)/2;    % "                    odd  "               "

basel = be*( jmax*kmax ) + bo*( jmax*(kmax+1)/2 + (jmax+1)/2*(kmax-1)/2 );

k_odd = mod(k,2);

if ( l_odd )
  base = basel + (k+k_odd)/2 *jmax + (k-k_odd)/2 *(jmax+1)/2;
else
  base = basel + k*jmax;
end

if ( k_odd & l_odd )     % skip center of cubes
  i = j/2 + base;
else
  i = j + base;
end

i = i+1;  % (matlab index starts with 1)
